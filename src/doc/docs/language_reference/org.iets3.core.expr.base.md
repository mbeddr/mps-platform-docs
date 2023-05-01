# org.iets3.core.expr.base

---

## Included Languages
- com.mbeddr.mpsutil.blutil
- com.mbeddr.mpsutil.editor.querylist
- com.mbeddr.mpsutil.framecell
- com.mbeddr.mpsutil.grammarcells
- com.mbeddr.mpsutil.intentions
- com.mbeddr.mpsutil.modellisteners
- com.mbeddr.mpsutil.refactoring
- de.itemis.mps.editor.celllayout
- de.slisson.mps.conditionalEditor
- de.slisson.mps.richtext
- de.slisson.mps.richtext.customcell
- jetbrains.mps.baseLanguage
- jetbrains.mps.baseLanguage.closures
- jetbrains.mps.baseLanguage.collections
- jetbrains.mps.baseLanguage.javadoc
- jetbrains.mps.baseLanguage.lightweightdsl
- jetbrains.mps.baseLanguage.logging
- jetbrains.mps.baseLanguage.tuples
- jetbrains.mps.baseLanguageInternal
- jetbrains.mps.ide.httpsupport
- jetbrains.mps.lang.access
- jetbrains.mps.lang.actions
- jetbrains.mps.lang.behavior
- jetbrains.mps.lang.constraints
- jetbrains.mps.lang.constraints.msg.specification
- jetbrains.mps.lang.constraints.rules
- jetbrains.mps.lang.constraints.rules.kinds
- jetbrains.mps.lang.constraints.rules.skeleton
- jetbrains.mps.lang.context
- jetbrains.mps.lang.context.defs
- jetbrains.mps.lang.core
- jetbrains.mps.lang.dataFlow
- jetbrains.mps.lang.descriptor
- jetbrains.mps.lang.editor
- jetbrains.mps.lang.editor.tooltips
- jetbrains.mps.lang.extension
- jetbrains.mps.lang.findUsages
- jetbrains.mps.lang.generator
- jetbrains.mps.lang.generator.generationContext
- jetbrains.mps.lang.intentions
- jetbrains.mps.lang.migration
- jetbrains.mps.lang.migration.util
- jetbrains.mps.lang.pattern
- jetbrains.mps.lang.plugin
- jetbrains.mps.lang.plugin.standalone
- jetbrains.mps.lang.quotation
- jetbrains.mps.lang.refactoring
- jetbrains.mps.lang.resources
- jetbrains.mps.lang.rulesAndMessages
- jetbrains.mps.lang.scopes
- jetbrains.mps.lang.script
- jetbrains.mps.lang.sharedConcepts
- jetbrains.mps.lang.smodel
- jetbrains.mps.lang.smodel.query
- jetbrains.mps.lang.structure
- jetbrains.mps.lang.text
- jetbrains.mps.lang.textGen
- jetbrains.mps.lang.typesystem

---

## Defined Concepts

### AbstractMinMaxExpression (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F2152957725070409762))


#### Children
- *values*



### AltOption ([node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7971844778466793051))


#### Children
- *when*

- *then*



### AlternativesExpression (alt, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7971844778466793028))


#### Children
- *alternatives*



### AlwaysValue (always, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8435714728543612222))


### AndTag (&&, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5338017450510309031))


### AssignmentExpr (:=, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F195141004745644975))


### AttemptType (attempt, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F6481804410366698223))


#### Children
- *successType*

- *errorLiterals*



### BangOp (!, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F2390066428848651932))


#### Children
- *optionValue*



### BinaryArithmeticExpression (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156687762))


### BinaryComparisonExpression (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156687763))


### BinaryEqualityExpression (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156760985))


### BinaryExpression (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156576277))


#### Children
- *left*

- *right*



### BinaryLogicalExpression (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156723687))


### CastExpression (cast, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F3281846772293355652))


#### Children
- *expr*

- *expectedType*



### CheckTypeConstraintsExpr (check, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8219602584757553931))


#### Properties
- *failIfInvalid*



#### Children
- *expr*

- *tp*



### ColonCast (:, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5955298286257997823))


#### Children
- *expr*

- *type*



### ConstraintAndErrorNode ([node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F1813872364117842299))


#### References
- *expression*

- *source*



### Contract ([node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F867786408877811041))


#### Children
- *items*



### ContractItem (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F867786408877811036))


#### Properties
- *warning*



#### Children
- *expr*

- *err*



### ConvenientBoolean ([node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8435714728543612220))


#### Children
- *value*



### ConvenientBooleanValue (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8435714728543612221))


### ConvenientValueCond (if, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8435714728543612284))


#### Children
- *expr*



### DeRefTarget (deref, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7782108600712067692))


### DefaultValueExpression (default, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F6932772747669876272))


#### Children
- *type*



### DivExpression (/, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156652603))


### DocWordRef ([node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F6527211908668938616))


#### References
- *node*



### DotExpression ([node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F9002563722476995145))


#### Children
- *target*



### EmptyExpression ([node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7089558164908491660))


### EmptyType (emptytype, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F3984696641266738408))


### EmptyValue (empty, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F3889855429450038473))


#### Children
- *type*



### EqualsExpression (==, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156761033))


### ErrorExpression (error, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F1919538606560895472))


#### Children
- *error*



### ErrorLiteral ([node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F1919538606559981270))


### ErrorTarget (err, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8219602584758531613))


### ExprInContract (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F867786408877888703))


### Expression (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7425695345928347719))


### FailExpr (fail, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F411710798114972602))


#### Children
- *message*

- *contextExpression*

- *type*



### GenericErrorType (error, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F1919538606561852365))


### GreaterEqualsExpression (>=, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156687889))


### GreaterExpression (>, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156687764))


### HasValueOp (hasValue, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F3889855429449957987))


### IAllowDeletionOfDot (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5032482955836171565))


### IAllowDotOnLeft (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5032482955834438679))


### IAllowsDocInChildExpressions (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F3878179565981658347))


### IAssertConstraints (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F1185099853503726569))


### IAttemptType (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F1919538606562038159))


### IBigExpression (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7849560302565692340))


### IBlockLike (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F508719611255975992))


### ICanBeLValue (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F195141004745586068))


### ICollectionType (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F6859926652464625057))


### IComplexTypeSupportsEquals (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7520958096812440715))


### IContainmentStackMember (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7249175668709475545))


### IContextAssistantTypeProvider (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F672388678117471179))


### IContextTypeProvider (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F4886573260948603548))


### IContextTypedOp (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7549708508605912547))


### IContracted (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F867786408877810851))


#### Children
- *contract*



### IControlAdvancedFeatures_old (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7631603674206286466))


### IDeclarativelyInterpretable (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F543855896735511983))


### IDocumentableWordContainer (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F6527211908672525240))


### IDocumentableWordProvider (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F6527211908668936592))


### IDotTarget (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F9002563722476995146))


### IEmptyLiteral (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F915344943735946072))
Marker interface used to mark literals that at runtime evaluate to empty value.


### IHasBaseType (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F3908189377504169836))


### IIgnoreTrivialErrorsContext (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F3913100176250796213))


### IIsSingleSymbol (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F125444643124876487))


### IJoinTypeContext (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F6095949300264944876))


### ILiteral (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7782108600710395780))


### IMainSlot (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F162522551948891781))


### IMayAllowEffect (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F952298261448780116))


### IMayHaveEffect (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7791618349053901166))


### IMayReadMutableState (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F3878179565988505489))


### IMultiTraceRoot (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F1102067954003609289))


### INameQualifier (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5227231181400542768))


### INeverAllowDot (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8266215269008046728))


### IOptionDerefContext (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F6381079423399017846))


### IOptionallyTyped (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7089558164905593724))


#### Children
- *type*



### IParameterizedTypeSupportsEquals (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8946943035394495000))


### IProgramLocationProvider (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5299123466384889590))


### IProvidePathConstraints (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F4443886968505207936))


### IReducableExpression (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8092372783983747124))


### IRef (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7416522108621683377))


### IReferenceableType (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7782108600708210942))


### IRunningInterpreterContext (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5043470053404793105))


### ISSConstrainedValue (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F6571046568849029819))


### ISSConstrainedValueRef (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F6571046568849029820))


### ISSDelegatingType (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7093020903927062949))


### ISSItValueRef (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7093020903919699057))


### IScopeFilterer (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F3829047245302401610))


### ISingleSymbolRef (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F3829047245302399306))


### IStructuredSyntax (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8811147530087029174))


### ITargetThatCanDealWithNix (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F2417394483940924214))


### ITraceRoot (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8505972469205863874))


### ITypeFromMultiple (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F1206081519717706522))


### ITypeOverridingContext (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F369777186288917319))


### ITypeSupportsDefaultValue (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F6932772747669856399))


### ITypeSupportsProposals (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F672388678113750644))


### ITypeable (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5706483968284528352))
Nodes that have a defined type but not necessarily specified explicitly in a child


### ITyped (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7071042522334260296))


#### Children
- *type*:

type is actually required, but is 0..1 here to improve editor usability


### IValidOtherwiseContainer (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5822258191940088521))


### IVoidContext (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8237981399425912554))


### IWantNewLine (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F1134276681297127890))


### IfElseSection (else, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F606861080870797309))


#### Children
- *expr*



### IfExpression (if, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7849560302565679722))


#### Children
- *condition*

- *thenPart*

- *elsePart*

- *elseSection*



### ImplicitValidityValExpr (it, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8219602584770724049))


#### Children
- *type*



### InlineMessage (message, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5299123466398246930))


#### Children
- *text*



### Invariant (inv, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F867786408877811181))


### IsSomeExpression (isSome, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F2807135271608145920))


#### Children
- *expr*



### JoinType (join, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F9142018459473556821))


#### Children
- *types*



### LessEqualsExpression (<=, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156687891))


### LessExpression (<, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156687890))


### LogicalAndExpression (&&, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156724025))


### LogicalIffExpression (<=>, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8448265401162061756))


### LogicalImpliesExpression (=>, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F1514143479005139333))


### LogicalNotExpression (!, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156802410))


### LogicalOrExpression (||, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156723899))


### MakeRefTarget (ref, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7782108600709141067))


### MaxExpression (max, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F2152957725070518937))


### MessageValueType (message, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5299123466384402682))


### MinExpression (min, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F2152957725070518938))


### MinusExpression (-, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156652453))


### ModExpression (mod, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F6044555027808714586))


### MulExpression (*, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156578671))


### MulTag (*, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8560722270290706287))


### NeverValue (never, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8435714728543612253))


### NonStrictEqualsExpression (===, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F3593191807001111860))


### NoneLiteral (none, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F2807135271608265973))


#### Children
- *optionalBaseType*



### NoneType (none, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F2807135271607940261))


### NotEqualsExpression (!=, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156761034))


### OkTarget (ok, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8219602584758209317))


### OneOfTarget (oneOf, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F3352322994211036342))


#### Children
- *values*



### OperatorGroup (join, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5338017450510303355))


#### Children
- *expressions*

- *tag*



### OperatorTag (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5338017450510303356))


### OptionOrExpression (?:, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F3829047245309363370))


### OptionType (opt, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F2807135271607939856))


#### Children
- *baseType*



### OrTag (||, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8006404979729416973))


### ParensExpression ((, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837157187871))


#### Children
- *expr*



### PlainConstraint ([node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F867786408882279828))


### PlusExpression (+, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156578546))


### PlusTag (+, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8560722270289800014))


### Postcondition (post, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F867786408877811180))


### PragmaDisableCaching (§disable-caching-globally, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5571545316364803538))


### PragmaExpression (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5571545316364799282))


#### Children
- *expr*



### Precondition (pre, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F867786408877811037))


### PrimitiveLiteral (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8379605524044170035))


### PrimitiveType (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7425695345928515123))


### ProgramLocationOp (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5299123466385889548))


### ProgramLocationType (loc, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5299123466385888301))


### ProgramLocationUrlOp (url, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5299123466385900735))


### RangeTarget (inRange, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F2245119349904068784))


#### Properties
- *upperExcluding*

- *lowerExcluding*



#### Children
- *min*

- *max*



### ReductionInspector ([node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8092372783983858717))


#### Children
- *reduced*



### ReferenceType (ref, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7782108600708168956))


#### Children
- *baseType*



### Revealer ([node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F4934857995792117654))


#### Children
- *condition*



### RevealerThis (revealed, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F9078496479923905756))


### SimpleExpressionValueInspector ([node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F2850607030358693529))


#### Properties
- *onlyLast*

- *showOnTop*

- *showOnConsole*

- *optionalLabel*



### SomeValExpr ([node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F1059200196223309235))


#### References
- *someQuery*



### SpecificErrorType (error[, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F1919538606561852396))


#### Children
- *error*



### SuccessExpression (success, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5974679004769488538))


#### Children
- *expr*



### SuccessType (success, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F1919538606561852052))


#### Children
- *baseType*



### SuccessValueExpr ([node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7089558164910719190))


#### References
- *try*



### ThisExpression (this, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F4886573260948604727))


### TracerExpression ([node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8092372783984279054))


#### Properties
- *traceLabel*



#### Children
- *traced*



#### References
- *target*



### TryErrorClause (error, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7089558164909884363))


#### Children
- *expr*

- *errorLiteral*



### TryExpression (try, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F6481804410367226920))


#### Properties
- *complete*



#### Children
- *expr*

- *successClause*

- *errorClauses*



### TrySuccessClause (=>, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F6481804410367607231))


#### Children
- *expr*



### TupleAccessExpr ([node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F2527679671886479690))


#### Properties
- *index*



#### Children
- *tuple*



### TupleType ([, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F1019070541450015930))


#### Children
- *elementTypes*



### TupleValue ([, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F1019070541450016346))


#### Children
- *values*



### Type (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F7425695345928349204))


### UnaryExpression (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156802409))


#### Children
- *expr*



### UnaryMinusExpression (-, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F5115872837156855227))


### ValidityType (validity, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8219602584757554015))


### VoidType (void, [node url](http://127.0.0.1:63320/node?ref=r%3A66e07cb4-a4b0-4bf3-a36d-5e9ed1ff1bd3%28org.iets3.core.expr.base.structure%29%2F8237981399425912525))


