<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:3a9aade9-8370-492d-a54d-a5447c10b564(Tools.structure)">
  <persistence version="9" />
  <languages>
    <devkit ref="78434eb8-b0e5-444b-850d-e7c4ad2da9ab(jetbrains.mps.devkit.aspect.structure)" />
  </languages>
  <imports>
    <import index="34lm" ref="r:04cb519f-2059-4c60-9414-918c7823fd79(org.iets3.core.expr.doc.structure)" />
    <import index="av4b" ref="r:ba7faab6-2b80-43d5-8b95-0c440665312c(org.iets3.core.expr.tests.structure)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
      <concept id="1169125787135" name="jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration" flags="ig" index="PkWjJ">
        <property id="6714410169261853888" name="conceptId" index="EcuMT" />
      </concept>
      <concept id="1169127622168" name="jetbrains.mps.lang.structure.structure.InterfaceConceptReference" flags="ig" index="PrWs8">
        <reference id="1169127628841" name="intfc" index="PrY4T" />
      </concept>
      <concept id="1071489090640" name="jetbrains.mps.lang.structure.structure.ConceptDeclaration" flags="ig" index="1TIwiD">
        <property id="1096454100552" name="rootable" index="19KtqR" />
        <reference id="1071489389519" name="extends" index="1TJDcQ" />
        <child id="1169129564478" name="implements" index="PzmwI" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="1TIwiD" id="7cIlz6Qaf9r">
    <property role="EcuMT" value="8299665934799925851" />
    <property role="TrG5h" value="CustomFrame" />
    <ref role="1TJDcQ" to="34lm:1sudaVNmXYu" resolve="Frame" />
    <node concept="PrWs8" id="2BH_fs4FD2x" role="PzmwI">
      <ref role="PrY4T" to="av4b:59WscmUTdO4" resolve="ITestItemContainer" />
    </node>
  </node>
  <node concept="1TIwiD" id="7cIlz6Qc5LU">
    <property role="EcuMT" value="8299665934800411770" />
    <property role="TrG5h" value="CustomTestSuite" />
    <property role="19KtqR" value="true" />
    <ref role="1TJDcQ" to="av4b:ub9nkyK62f" resolve="TestSuite" />
    <node concept="PrWs8" id="7cIlz6QcdMK" role="PzmwI">
      <ref role="PrY4T" to="tpck:2WmWrdnSpX2" resolve="ICanSuppressErrors" />
    </node>
  </node>
</model>

