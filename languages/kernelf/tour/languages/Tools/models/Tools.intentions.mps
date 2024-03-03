<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:61bd0c5e-d316-4c2e-a6b4-1e05fd024c2d(Tools.intentions)">
  <persistence version="9" />
  <languages>
    <use id="d7a92d38-f7db-40d0-8431-763b0c3c9f20" name="jetbrains.mps.lang.intentions" version="1" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="3aup" ref="742f6602-5a2f-4313-aa6e-ae1cd4ffdc61/java:jetbrains.mps.lang.migration.runtime.base(MPS.Platform/)" />
    <import index="av4b" ref="r:ba7faab6-2b80-43d5-8b95-0c440665312c(org.iets3.core.expr.tests.structure)" implicit="true" />
    <import index="3f1g" ref="r:3a9aade9-8370-492d-a54d-a5447c10b564(Tools.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
    </language>
    <language id="d7a92d38-f7db-40d0-8431-763b0c3c9f20" name="jetbrains.mps.lang.intentions">
      <concept id="1192794744107" name="jetbrains.mps.lang.intentions.structure.IntentionDeclaration" flags="ig" index="2S6QgY" />
      <concept id="1192794782375" name="jetbrains.mps.lang.intentions.structure.DescriptionBlock" flags="in" index="2S6ZIM" />
      <concept id="1192795911897" name="jetbrains.mps.lang.intentions.structure.ExecuteBlock" flags="in" index="2Sbjvc" />
      <concept id="1192796902958" name="jetbrains.mps.lang.intentions.structure.ConceptFunctionParameter_node" flags="nn" index="2Sf5sV" />
      <concept id="2522969319638091381" name="jetbrains.mps.lang.intentions.structure.BaseIntentionDeclaration" flags="ig" index="2ZfUlf">
        <reference id="2522969319638198290" name="forConcept" index="2ZfgGC" />
        <child id="2522969319638198291" name="executeFunction" index="2ZfgGD" />
        <child id="2522969319638093993" name="descriptionFunction" index="2ZfVej" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="2644386474300074836" name="jetbrains.mps.lang.smodel.structure.ConceptIdRefExpression" flags="nn" index="35c_gC">
        <reference id="2644386474300074837" name="conceptDeclaration" index="35c_gD" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="2S6QgY" id="2BH_fs4uozG">
    <property role="TrG5h" value="ConvertTestSuite" />
    <ref role="2ZfgGC" to="av4b:ub9nkyK62f" resolve="TestSuite" />
    <node concept="2S6ZIM" id="2BH_fs4uozH" role="2ZfVej">
      <node concept="3clFbS" id="2BH_fs4uozI" role="2VODD2">
        <node concept="3clFbF" id="2BH_fs4uoLo" role="3cqZAp">
          <node concept="Xl_RD" id="2BH_fs4uoLn" role="3clFbG">
            <property role="Xl_RC" value="Convert to custom test suite" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2Sbjvc" id="2BH_fs4uozJ" role="2ZfgGD">
      <node concept="3clFbS" id="2BH_fs4uozK" role="2VODD2">
        <node concept="3clFbF" id="2BH_fs4vJMG" role="3cqZAp">
          <node concept="2YIFZM" id="2BH_fs4vDqE" role="3clFbG">
            <ref role="37wK5l" to="3aup:~RefactoringRuntime.replaceWithNewConcept(org.jetbrains.mps.openapi.model.SNode,org.jetbrains.mps.openapi.language.SAbstractConcept)" resolve="replaceWithNewConcept" />
            <ref role="1Pybhc" to="3aup:~RefactoringRuntime" resolve="RefactoringRuntime" />
            <node concept="2Sf5sV" id="2BH_fs4vDtq" role="37wK5m" />
            <node concept="35c_gC" id="2BH_fs4vE1T" role="37wK5m">
              <ref role="35c_gD" to="3f1g:7cIlz6Qc5LU" resolve="CustomTestSuite" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

