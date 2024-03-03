<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:45eea529-c3cf-4f37-b484-821db94bfce9(Tools.accessory)">
  <persistence version="9" />
  <languages>
    <use id="f26691d2-0def-4c06-aec6-2cb90c4af0a4" name="jetbrains.mps.console.scripts" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="3f1g" ref="r:3a9aade9-8370-492d-a54d-a5447c10b564(Tools.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="4836112446988635817" name="jetbrains.mps.baseLanguage.structure.UndefinedType" flags="in" index="2jxLKc" />
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1208623485264" name="jetbrains.mps.baseLanguage.structure.AbstractOperation" flags="nn" index="1B$H19" />
    </language>
    <language id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures">
      <concept id="2524418899405758586" name="jetbrains.mps.baseLanguage.closures.structure.InferredClosureParameterDeclaration" flags="ig" index="gl6BB" />
      <concept id="1199569711397" name="jetbrains.mps.baseLanguage.closures.structure.ClosureLiteral" flags="nn" index="1bVj0M">
        <child id="1199569906740" name="parameter" index="1bW2Oz" />
        <child id="1199569916463" name="body" index="1bW5cS" />
      </concept>
    </language>
    <language id="f26691d2-0def-4c06-aec6-2cb90c4af0a4" name="jetbrains.mps.console.scripts">
      <concept id="1734392475491235550" name="jetbrains.mps.console.scripts.structure.ConsoleScript" flags="ng" index="1MOzCq">
        <child id="1734392475491235551" name="command" index="1MOzCr" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="4693937538533521280" name="jetbrains.mps.lang.smodel.structure.OfConceptOperation" flags="ng" index="v3k3i">
        <child id="4693937538533538124" name="requestedConcept" index="v3oSu" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="1a8554c4-eb84-43ba-8c34-6f0d90c6e75a" name="jetbrains.mps.lang.smodel.query">
      <concept id="2822369470875160718" name="jetbrains.mps.lang.smodel.query.structure.NodesExpression" flags="ng" index="2Jgcaq" />
    </language>
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="1204796164442" name="jetbrains.mps.baseLanguage.collections.structure.InternalSequenceOperation" flags="nn" index="23sCx2">
        <child id="1204796294226" name="closure" index="23t8la" />
      </concept>
      <concept id="1204980550705" name="jetbrains.mps.baseLanguage.collections.structure.VisitAllOperation" flags="nn" index="2es0OD" />
    </language>
    <language id="de1ad86d-6e50-4a02-b306-d4d17f64c375" name="jetbrains.mps.console.base">
      <concept id="7656298970878093785" name="jetbrains.mps.console.base.structure.BLExpression" flags="ng" index="f80E0">
        <child id="7656298970878093890" name="expression" index="f80$r" />
      </concept>
    </language>
  </registry>
  <node concept="1MOzCq" id="2BH_fs4$vBc">
    <property role="TrG5h" value="UpdateAllImages" />
    <node concept="f80E0" id="2BH_fs4$wfT" role="1MOzCr">
      <node concept="2OqwBi" id="2BH_fs4$wO$" role="f80$r">
        <node concept="2OqwBi" id="2BH_fs4$wrv" role="2Oq$k0">
          <node concept="2Jgcaq" id="2BH_fs4$wfS" role="2Oq$k0" />
          <node concept="v3k3i" id="2BH_fs4$w_u" role="2OqNvi">
            <node concept="chp4Y" id="2BH_fs4$wBc" role="v3oSu">
              <ref role="cht4Q" to="3f1g:7cIlz6Qaf9r" resolve="CustomFrame" />
            </node>
          </node>
        </node>
        <node concept="2es0OD" id="2BH_fs4$x0G" role="2OqNvi">
          <node concept="1bVj0M" id="2BH_fs4$x0I" role="23t8la">
            <node concept="3clFbS" id="2BH_fs4$x0J" role="1bW5cS">
              <node concept="3clFbF" id="2BH_fs4$x2W" role="3cqZAp">
                <node concept="2OqwBi" id="2BH_fs4$xrU" role="3clFbG">
                  <node concept="37vLTw" id="2BH_fs4$x2V" role="2Oq$k0">
                    <ref role="3cqZAo" node="3jPfgOVmc__" />
                  </node>
                  <node concept="1B$H19" id="2BH_fs4$xrZ" role="2OqNvi" />
                </node>
              </node>
            </node>
            <node concept="gl6BB" id="3jPfgOVmc__" role="1bW2Oz">
              <property role="TrG5h" value="it" />
              <node concept="2jxLKc" id="3jPfgOVmc_A" role="1tU5fm" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

