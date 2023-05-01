# org.iets3.core.expr.collections

---

## Included Languages
- com.mbeddr.mpsutil.grammarcells
- jetbrains.mps.baseLanguage
- jetbrains.mps.baseLanguage.closures
- jetbrains.mps.baseLanguage.collections
- jetbrains.mps.baseLanguage.javadoc
- jetbrains.mps.baseLanguage.logging
- jetbrains.mps.baseLanguage.tuples
- jetbrains.mps.baseLanguageInternal
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
- jetbrains.mps.lang.findUsages
- jetbrains.mps.lang.generator
- jetbrains.mps.lang.generator.generationContext
- jetbrains.mps.lang.intentions
- jetbrains.mps.lang.migration
- jetbrains.mps.lang.pattern
- jetbrains.mps.lang.quotation
- jetbrains.mps.lang.refactoring
- jetbrains.mps.lang.resources
- jetbrains.mps.lang.rulesAndMessages
- jetbrains.mps.lang.scopes
- jetbrains.mps.lang.script
- jetbrains.mps.lang.sharedConcepts
- jetbrains.mps.lang.smodel
- jetbrains.mps.lang.structure
- jetbrains.mps.lang.text
- jetbrains.mps.lang.textGen
- jetbrains.mps.lang.typesystem
- org.iets3.core.expr.lambda
- org.iets3.core.expr.simpleTypes

---

## Defined Concepts

### AbstractStringListJoiner (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F5070313213698520477))


### AllOp (all, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F8872269265518788050))


### AllWithIndexOp (all_with_index, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F444732437356043012))


### AnyOp (any, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F8872269265515619803))


### AnyWithIndexOp (any_with_index, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F4481921169623440367))


### AsImmutableListOp (toList, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F8872269265513219132))


### AsImmutableSetOp (toSet, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F8872269265522211270))


### AsMapOp (toMap, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F24388123213992448))


### AsSingletonList (toList, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F6414340278546763815))


### AtOp (at, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283340004826))


### BracketOp ([node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F5849458724932670346))


#### Children
- *index*



### CollectionSizeSpec ([node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F1330041117646892901))


#### Properties
- *min*

- *max*



### CollectionType (collection, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283339749509))


#### Children
- *sizeConstraint*

- *baseType*



### ContainsOp (contains, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F8872269265514323710))


### DistinctOp (distinct, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F8872269265511400449))


### ElementTypeConstraintMap ([node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F8694548031078300776))


#### Children
- *typeConstraint1*

- *typeConstraint2*



### ElementTypeConstraintSingle ([node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F8694548031077039769))


#### Children
- *typeConstraint*



### FindFirstOp (findFirst, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F24388123216554083))


### FirstNOp (firstN, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F5585772046596642164))


### FirstOp (first, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283339850572))


### FlattenOp (flatten, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F2554784455264825928))


### FoldLeftOp (foldLeft, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F4931785860342338319))


### FoldOp (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F4931785860342338320))


#### Children
- *seed*

- *combiner*



### ForeachOp (foreach, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F9097157441620016186))


### ICollectionOp (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283339790458))


### IContextTypedCollOp (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283340021069))


### IElementTyped (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283339850588))


### IListOneArgOp (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F5291952221900249273))


#### Children
- *arg*



### IMapOneArgOp (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7757419675865128281))


#### Children
- *arg*



### IOrderedCollection (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283339848519))


### IOrderedCollectionOp (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283339848559))


### IProvideIndex (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F9097157441616112342))


### ISetOneArgOp (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F527291771330968213))


#### Children
- *arg*



### IndexExpr (index, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F75413091695536841))


### IndexOfOp (indexOf, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F1406572792884327605))


### IsEmptyOp (isEmpty, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283339840476))


### IsNotEmptyOp (isNotEmpty, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F6095949300270588116))


### KeyValuePair ([node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F8448265401163111273))


#### Children
- *key*

- *val*



### LastNOp (lastN, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F5585772046597818717))


### LastOp (last, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283339853806))


### ListInsertOp (insert, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F890442848561707151))


#### Children
- *index*

- *arg*



### ListLiteral (list, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283339759319))


#### Children
- *typeConstraint*

- *elements*



### ListPickOp (pick, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F531692237848496057))


#### Children
- *selectorList*



### ListType (list, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283339757344))


### ListWithAllOp (withAll, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F362871314062739301))


### ListWithOp (with, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F2156530943179783739))


### ListWithoutOp (without, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F890442848561696122))


### MapContainsKeyOp (containsKey, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7757419675876236259))


### MapKeysOp (keys, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7757419675876255273))


### MapLikeType (mapLike, abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F5291952221899372124))


#### Children
- *keyType_DEPRECATED*

- *valueType_DEPRECATED*



### MapLiteral (map, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F8448265401163111272))


#### Children
- *typeConstraint*

- *elements*



### MapOp (map, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283340640412))


### MapSizeOp (size, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F24388123215615666))


### MapType (map, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F8448265401163110902))


#### Children
- *keyType*

- *valueType*



### MapValuesOp (values, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7757419675876240958))


### MapWithOp (with, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F8448265401163555724))


### MapWithoutOp (without, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F8448265401163714133))


### MaxOp (max, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F5585772046587930249))


### MinOp (min, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7740953487940081584))


### NoArgCollectionOp (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283339795488))


### OneArgCollectionOp (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283340020764))


#### Children
- *arg*



### OneArgPredicateCollectionOp (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F8872269265515327232))


### OneCollBaseTypedArgCollectionOp (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F8872269265514351708))


### ReverseOp (reverse, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F5396945261017737777))


### SetDiffOp (diff, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F5396945261038438968))


### SetLiteral (set, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F8872269265520081293))


#### Children
- *typeConstraint*

- *elements*



### SetType (set, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F8872269265520080263))


### SetUnionOp (union, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F5396945261030611861))


### SetWithOp (with, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F2156530943179855331))


### SetWithoutOp (without, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F3831047747134047985))


### SimpleSortOp (sort, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F890435239346753529))


#### Properties
- *order*



### SizeOp (size, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283339796915))


### StringJoinOp (join, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F5070313213695398904))


### StringTerminateOp (terminate, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F5070313213697900736))


### SumOp (sum, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F5585772046594451299))


### TailOp (tail, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F393796118209799325))


### TwoArgPredicateCollectionOp (abstract, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F444732437356045611))


### UnpackOptionsOp (unpackOptions, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F4618483580248255217))


### UpToTarget (upto, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F3989687177013570767))


#### Children
- *max*



### WhereOp (where, [node url](http://127.0.0.1:63320/node?ref=r%3A61b1de80-490d-4fee-8e95-b956503290e9%28org.iets3.core.expr.collections.structure%29%2F7554398283340715406))


