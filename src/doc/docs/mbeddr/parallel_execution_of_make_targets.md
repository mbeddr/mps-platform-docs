# Introduction

Prerequisites: In order to understand this document, the reader is expected to have a basic understanding of what a Makefile is and how targets in Makefiles are defined in order to accomplish build-related tasks. The reader can refer to the following URL to gain a basic understanding. [GNU Make](https://www.gnu.org/software/make/)

When running code generation on a mbeddr model, MPS generates source and header files corresponding to the implementation modules in the chosen model and generates a Makefile, which is then run using the “make” command (e.g., GNU make). This command is invoked with no arguments, which causes make to execute the “all” target (default) and all of its dependencies that are specified inside the generated Makefile. For instance, a target to “clean” existing files and another one that compiles source files into object files. Further, running “make” with no arguments executes all targets sequentially, while passing over the “-j" option instructs make to run parallelizable targets at the same time (more on that later).

## Importance of running make Targets in parallel

In mbeddr, about 40% of the overall code generation time (m2m, m2t and compilation) when rebuilding projects is spent on running make on the generated source files. Because mbeddr models usually contain multiple implementation modules that get translated to source and header files, we can parallelize the compilation of these files. After introducing this change, we observed that the time taken for parallel makes were almost half the time taken for linear makes in those manual tests, thereby motivating the need for using make's parallel option in mbeddr.

## How does the parallel Option work, and what are the Challenges?

The “make -j" option works at the granularity of targets. This means that targets are executed in parallel, not tasks inside targets. Consider the following example Makefile snippet:

```
targeta:
   stat1
   stat2
```

```
targetb:
   stat3
   stat4
```

In this case, “make -j" would only execute **targeta** and **targetb** in parallel, but the runtime of statements would be linear, implying that **stat1** is always executed before **stat2**. So parallelizing the execution of a Makefile implies the following two main challenges:
1. Tasks that are intended to be executed in parallel (e.g., compilation of source files) need to be specified in separate targets.
2. Dependencies between targets must be specified explicitly, e.g., the target for linking object files must depend on the target for compiling source files.


## DesktopPlatform

In the following section, we describe how we tackled the previously mentioned challenges by modifying the DesktopPlatform to generate parallelizable Makefiles that can be executed by using the “-j” option.

Note: Makefiles can contain *define* elements, which define in a macro a bunch of statements. These macros can be used inside a Makefile just like functions in C. This feature was used by the DesktopPlatform in mbeddr to generate a macro for compiling source files. Additionally, the DesktopPlatform generated a *foreach* loop that expanded this macro for each generated source file. This way, targets were created dynamically, which is not supported when using the "-j" option, .i.e., make needs to figure out dependencies statically before macro expansion. Therefore, we have modified this Makefile generator to generate individual targets for each of the source files to be compiled and created a new target called *CompileSources* which depends on all of these individual targets. Additionally, we introduced a dependency from the linking target into this new *CompileSources* target. This way we have not only ensured that the targets for compilation of individual sources are executed in parallel (by being in different non-dependent targets), we have also ensured that linking does not happen before compilation.

Here is the macro that we were talking about in the paragraph before:
```
define CompileSources
$$(patsubst %.c,$(OBJODIR)/%.o,$$(notdir $(1))): $(1) $(ALL_INCS_ExternalOFile)  | $(OBJODIR)
	$(vecho) "  CC $$<"
	$(Q) $(CC) $$(CFLAGS) $(ALL_INCDIR_FLAGS_ExternalOFile) -c -o $$@ $$<
endef 


$(foreach asrc, $(sort $(ALL_SRCS_ExternalOFile)), $(eval $(call CompileSources,$(asrc))))

ExternalOFile$(EXEXT): $(ALL_OBJS_ExternalOFile)
ifeq ($(HOST),$(TARGET_ExternalOFile))
	$(vecho) "  LD $@"
	$(Q) $(CC) $(LDFLAGS) -o $@ $^ $(EXT_LIBDIR_FLAGS_ExternalOFile) $(EXT_LIB_FLAGS_ExternalOFile)
else
	$(vecho) "Cannot build $(TARGET_ExternalOFile)-specific 'ExternalOFile$(EXEXT)' application under $(HOST)."
endif
```

As described above, we have modified the DesktopPlatform generator to generate for each source file a separate target and this way omit the not parallelizable macro from the code snippet before. The following snippet shows for an example Makefile how we generate individual targets that we can be executed in parallel:
```
$(OBJODIR)/TestExternalOFiles.o: TestExternalOFiles.c  $(ALL_INCS_ExternalOFile) | $(OBJODIR)
	$(vecho) "  CC $<"
	$(Q) $(CC) $(CFLAGS) $(ALL_INCDIR_FLAGS_ExternalOFile) -c -o $@ $<
$(OBJODIR)/Unittest_Helper.o: Unittest_Helper.c  $(ALL_INCS_ExternalOFile) | $(OBJODIR)
	$(vecho) "  CC $<"
	$(Q) $(CC) $(CFLAGS) $(ALL_INCDIR_FLAGS_ExternalOFile) -c -o $@ $<
$(OBJODIR)/Unittest_Helper_NonIsolated.o: Unittest_Helper_NonIsolated.c  $(ALL_INCS_ExternalOFile) | $(OBJODIR)
	$(vecho) "  CC $<"
	$(Q) $(CC) $(CFLAGS) $(ALL_INCDIR_FLAGS_ExternalOFile) -c -o $@ $<
$(OBJODIR)/UnitTestMessages.o: UnitTestMessages.c  $(ALL_INCS_ExternalOFile) | $(OBJODIR)
	$(vecho) "  CC $<"
	$(Q) $(CC) $(CFLAGS) $(ALL_INCDIR_FLAGS_ExternalOFile) -c -o $@ $<

CompileSources:    $(OBJODIR)/TestExternalOFiles.o  $(OBJODIR)/Unittest_Helper.o  $(OBJODIR)/Unittest_Helper_NonIsolated.o  $(OBJODIR)/UnitTestMessages.o

ExternalOFile$(EXEXT): CompileSources
ifeq ($(HOST),$(TARGET_ExternalOFile))
	$(vecho) "  LD $@"
	$(Q) $(CC) $(LDFLAGS) -o $@ $^ $(EXT_LIBDIR_FLAGS_ExternalOFile) $(EXT_LIB_FLAGS_ExternalOFile)
else
	$(vecho) "Cannot build $(TARGET_ExternalOFile)-specific 'ExternalOFile$(EXEXT)' application under $(HOST)."
endif
```

## Using the Parallel make Feature in mbeddr
mbeddr comes with the *Platform* concept that is extended in order to customize the generation of Makefiles. We have designed a new Interface *IGeneratesToMakeFile* in the _com.mbeddr.core.make_ language that contains a virtual method called *canBeParallelized* that controls whether a Makefile that has been generated for the specific platform (a subconcept of *Platform*) can be run in parallel. The default implementation of this method in the abstract concept *Platform* returns false. But, if a specific subconcept of *Platform* generates a Makefile that can be parallelized, then the developer simply needs to override the *canBeParallelized* method by returning true. This ensures that the *runMake* facet of mbeddr, which is responsible for running make after text generation, employs the parallel make execution process for Makefiles that are generated by a *Platform* that can be parallelized. As an example, the *canBeParallelized* implementation for *DesktopPlatform* currently returns true, thus instructing the *runMake* facet to run generated Makefiles in parallel.

### Number of Workers
The “-j" option accepts an optional number that can be specified to indicate the amount of workers that run make targets in parallel. The *runMake* facet sets this number to _(number of cores minus 1)_. This choice makes sure that there is one core left that can be used for external IO operations. Not using all cores is a best practice and prevents the system from freezing.