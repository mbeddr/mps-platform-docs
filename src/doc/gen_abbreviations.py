import mkdocs_gen_files
import re

definition_files = ["includes/abbreviations.md","includes/code_abbreviations.md"]
generated_files = ["reference/abbreviations.md","reference/code_abbreviations.md"]
headers = ["Abbreviations","Code abbreviations"]

abbr_pattern = re.compile(r'\*\[(.*)\]:\s*(.*)')

for index in range(len(definition_files)):
    with mkdocs_gen_files.open(generated_files[index], "w+") as f:
        print("#" + headers[index], file=f)
        
        for i, line in enumerate(mkdocs_gen_files.open(definition_files[index],"r")):
            for match in re.finditer(abbr_pattern, line):
                print("**" + match.group(1) + "**: " + match.group(2) + "\n", file=f)
    
    mkdocs_gen_files.set_edit_path(generated_files[index], definition_files[index])