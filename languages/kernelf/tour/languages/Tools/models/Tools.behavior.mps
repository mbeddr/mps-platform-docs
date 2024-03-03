<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:b811fc4e-3110-4bf6-ad59-8920322a10f7(Tools.behavior)">
  <persistence version="9" />
  <languages>
    <use id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel" version="19" />
    <use id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior" version="2" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  </languages>
  <imports>
    <import index="guwi" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.io(JDK/)" />
    <import index="d244" ref="r:0a882e21-5553-485b-8777-3b0ace5a0d84(com.mbeddr.core.base.pluginSolution.plugin)" />
    <import index="cj4x" ref="1ed103c3-3aa6-49b7-9c21-6765ee11f224/java:jetbrains.mps.openapi.editor(MPS.Editor/)" />
    <import index="srqo" ref="r:5957d4c9-cc37-4d16-870b-eb83bcfdff2c(org.iets3.core.expr.doc.behavior)" />
    <import index="z60i" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.awt(JDK/)" />
    <import index="34lm" ref="r:04cb519f-2059-4c60-9414-918c7823fd79(org.iets3.core.expr.doc.structure)" />
    <import index="fnpx" ref="39983771-4e9b-401b-a1a9-1da6c777c843/java:com.intellij.notification(MPS.ThirdParty/)" />
    <import index="qkt" ref="498d89d2-c2e9-11e2-ad49-6cf049e62fe5/java:com.intellij.openapi.actionSystem(MPS.IDEA/)" />
    <import index="mhfm" ref="3f233e7f-b8a6-46d2-a57f-795d56775243/java:org.jetbrains.annotations(Annotations/)" />
    <import index="eoo2" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.nio.file(JDK/)" />
    <import index="7x5y" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.nio.charset(JDK/)" />
    <import index="gdgh" ref="r:e4d9478b-ae0e-416e-be60-73d136571015(org.iets3.core.base.behavior)" />
    <import index="av4b" ref="r:ba7faab6-2b80-43d5-8b95-0c440665312c(org.iets3.core.expr.tests.structure)" />
    <import index="xk6s" ref="r:7961970e-5737-42e2-b144-9bef3ad8d077(org.iets3.core.expr.tests.behavior)" />
    <import index="smjb" ref="6ed54515-acc8-4d1e-a16c-9fd6cfe951ea/java:jetbrains.mps.help(MPS.Core/)" />
    <import index="3f1g" ref="r:3a9aade9-8370-492d-a54d-a5447c10b564(Tools.structure)" implicit="true" />
    <import index="wyt6" ref="6354ebe7-c22a-4a0f-ac54-50b52ab9b065/java:java.lang(JDK/)" implicit="true" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="af65afd8-f0dd-4942-87d9-63a55f2a9db1" name="jetbrains.mps.lang.behavior">
      <concept id="6496299201655527393" name="jetbrains.mps.lang.behavior.structure.LocalBehaviorMethodCall" flags="nn" index="BsUDl" />
      <concept id="1225194240794" name="jetbrains.mps.lang.behavior.structure.ConceptBehavior" flags="ng" index="13h7C7">
        <reference id="1225194240799" name="concept" index="13h7C2" />
        <child id="1225194240805" name="method" index="13h7CS" />
        <child id="1225194240801" name="constructor" index="13h7CW" />
      </concept>
      <concept id="1225194413805" name="jetbrains.mps.lang.behavior.structure.ConceptConstructorDeclaration" flags="in" index="13hLZK" />
      <concept id="1225194472830" name="jetbrains.mps.lang.behavior.structure.ConceptMethodDeclaration" flags="ng" index="13i0hz">
        <reference id="1225194472831" name="overriddenMethod" index="13i0hy" />
      </concept>
      <concept id="1225194691553" name="jetbrains.mps.lang.behavior.structure.ThisNodeExpression" flags="nn" index="13iPFW" />
    </language>
    <language id="f3061a53-9226-4cc5-a443-f952ceaf5816" name="jetbrains.mps.baseLanguage">
      <concept id="1215693861676" name="jetbrains.mps.baseLanguage.structure.BaseAssignmentExpression" flags="nn" index="d038R">
        <child id="1068498886297" name="rValue" index="37vLTx" />
        <child id="1068498886295" name="lValue" index="37vLTJ" />
      </concept>
      <concept id="4836112446988635817" name="jetbrains.mps.baseLanguage.structure.UndefinedType" flags="in" index="2jxLKc" />
      <concept id="1202948039474" name="jetbrains.mps.baseLanguage.structure.InstanceMethodCallOperation" flags="nn" index="liA8E" />
      <concept id="8118189177080264853" name="jetbrains.mps.baseLanguage.structure.AlternativeType" flags="ig" index="nSUau">
        <child id="8118189177080264854" name="alternative" index="nSUat" />
      </concept>
      <concept id="1188207840427" name="jetbrains.mps.baseLanguage.structure.AnnotationInstance" flags="nn" index="2AHcQZ">
        <reference id="1188208074048" name="annotation" index="2AI5Lk" />
      </concept>
      <concept id="1188208481402" name="jetbrains.mps.baseLanguage.structure.HasAnnotation" flags="ngI" index="2AJDlI">
        <child id="1188208488637" name="annotation" index="2AJF6D" />
      </concept>
      <concept id="1197027756228" name="jetbrains.mps.baseLanguage.structure.DotExpression" flags="nn" index="2OqwBi">
        <child id="1197027771414" name="operand" index="2Oq$k0" />
        <child id="1197027833540" name="operation" index="2OqNvi" />
      </concept>
      <concept id="1083260308424" name="jetbrains.mps.baseLanguage.structure.EnumConstantReference" flags="nn" index="Rm8GO">
        <reference id="1083260308426" name="enumConstantDeclaration" index="Rm8GQ" />
        <reference id="1144432896254" name="enumClass" index="1Px2BO" />
      </concept>
      <concept id="1145552977093" name="jetbrains.mps.baseLanguage.structure.GenericNewExpression" flags="nn" index="2ShNRf">
        <child id="1145553007750" name="creator" index="2ShVmc" />
      </concept>
      <concept id="1137021947720" name="jetbrains.mps.baseLanguage.structure.ConceptFunction" flags="in" index="2VMwT0">
        <child id="1137022507850" name="body" index="2VODD2" />
      </concept>
      <concept id="1070475926800" name="jetbrains.mps.baseLanguage.structure.StringLiteral" flags="nn" index="Xl_RD">
        <property id="1070475926801" name="value" index="Xl_RC" />
      </concept>
      <concept id="4952749571008284462" name="jetbrains.mps.baseLanguage.structure.CatchVariable" flags="ng" index="XOnhg" />
      <concept id="1182160077978" name="jetbrains.mps.baseLanguage.structure.AnonymousClassCreator" flags="nn" index="YeOm9">
        <child id="1182160096073" name="cls" index="YeSDq" />
      </concept>
      <concept id="1081236700937" name="jetbrains.mps.baseLanguage.structure.StaticMethodCall" flags="nn" index="2YIFZM">
        <reference id="1144433194310" name="classConcept" index="1Pybhc" />
      </concept>
      <concept id="1070533707846" name="jetbrains.mps.baseLanguage.structure.StaticFieldReference" flags="nn" index="10M0yZ">
        <reference id="1144433057691" name="classifier" index="1PxDUh" />
      </concept>
      <concept id="1068431474542" name="jetbrains.mps.baseLanguage.structure.VariableDeclaration" flags="ng" index="33uBYm">
        <property id="1176718929932" name="isFinal" index="3TUv4t" />
        <child id="1068431790190" name="initializer" index="33vP2m" />
      </concept>
      <concept id="1513279640923991009" name="jetbrains.mps.baseLanguage.structure.IGenericClassCreator" flags="ngI" index="366HgL">
        <property id="1513279640906337053" name="inferTypeParams" index="373rjd" />
      </concept>
      <concept id="1068498886296" name="jetbrains.mps.baseLanguage.structure.VariableReference" flags="nn" index="37vLTw">
        <reference id="1068581517664" name="variableDeclaration" index="3cqZAo" />
      </concept>
      <concept id="1068498886292" name="jetbrains.mps.baseLanguage.structure.ParameterDeclaration" flags="ir" index="37vLTG" />
      <concept id="1068498886294" name="jetbrains.mps.baseLanguage.structure.AssignmentExpression" flags="nn" index="37vLTI" />
      <concept id="1225271177708" name="jetbrains.mps.baseLanguage.structure.StringType" flags="in" index="17QB3L" />
      <concept id="4972933694980447171" name="jetbrains.mps.baseLanguage.structure.BaseVariableDeclaration" flags="ng" index="19Szcq">
        <child id="5680397130376446158" name="type" index="1tU5fm" />
      </concept>
      <concept id="1068580123132" name="jetbrains.mps.baseLanguage.structure.BaseMethodDeclaration" flags="ng" index="3clF44">
        <child id="1068580123133" name="returnType" index="3clF45" />
        <child id="1068580123134" name="parameter" index="3clF46" />
        <child id="1068580123135" name="body" index="3clF47" />
      </concept>
      <concept id="1068580123165" name="jetbrains.mps.baseLanguage.structure.InstanceMethodDeclaration" flags="ig" index="3clFb_" />
      <concept id="1068580123155" name="jetbrains.mps.baseLanguage.structure.ExpressionStatement" flags="nn" index="3clFbF">
        <child id="1068580123156" name="expression" index="3clFbG" />
      </concept>
      <concept id="1068580123157" name="jetbrains.mps.baseLanguage.structure.Statement" flags="nn" index="3clFbH" />
      <concept id="1068580123136" name="jetbrains.mps.baseLanguage.structure.StatementList" flags="sn" stub="5293379017992965193" index="3clFbS">
        <child id="1068581517665" name="statement" index="3cqZAp" />
      </concept>
      <concept id="1068581242875" name="jetbrains.mps.baseLanguage.structure.PlusExpression" flags="nn" index="3cpWs3" />
      <concept id="1068581242878" name="jetbrains.mps.baseLanguage.structure.ReturnStatement" flags="nn" index="3cpWs6" />
      <concept id="1068581242864" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclarationStatement" flags="nn" index="3cpWs8">
        <child id="1068581242865" name="localVariableDeclaration" index="3cpWs9" />
      </concept>
      <concept id="1068581242863" name="jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration" flags="nr" index="3cpWsn" />
      <concept id="1068581517677" name="jetbrains.mps.baseLanguage.structure.VoidType" flags="in" index="3cqZAl" />
      <concept id="1204053956946" name="jetbrains.mps.baseLanguage.structure.IMethodCall" flags="ngI" index="1ndlxa">
        <reference id="1068499141037" name="baseMethodDeclaration" index="37wK5l" />
        <child id="1068499141038" name="actualArgument" index="37wK5m" />
      </concept>
      <concept id="1212685548494" name="jetbrains.mps.baseLanguage.structure.ClassCreator" flags="nn" index="1pGfFk" />
      <concept id="1107461130800" name="jetbrains.mps.baseLanguage.structure.Classifier" flags="ng" index="3pOWGL">
        <property id="521412098689998745" name="nonStatic" index="2bfB8j" />
        <child id="5375687026011219971" name="member" index="jymVt" unordered="true" />
      </concept>
      <concept id="1107535904670" name="jetbrains.mps.baseLanguage.structure.ClassifierType" flags="in" index="3uibUv">
        <reference id="1107535924139" name="classifier" index="3uigEE" />
      </concept>
      <concept id="1081773326031" name="jetbrains.mps.baseLanguage.structure.BinaryOperation" flags="nn" index="3uHJSO">
        <child id="1081773367579" name="rightExpression" index="3uHU7w" />
        <child id="1081773367580" name="leftExpression" index="3uHU7B" />
      </concept>
      <concept id="3093926081414150598" name="jetbrains.mps.baseLanguage.structure.MultipleCatchClause" flags="ng" index="3uVAMA">
        <child id="8276990574895933173" name="catchBody" index="1zc67A" />
        <child id="8276990574895933172" name="throwable" index="1zc67B" />
      </concept>
      <concept id="1178549954367" name="jetbrains.mps.baseLanguage.structure.IVisible" flags="ngI" index="1B3ioH">
        <child id="1178549979242" name="visibility" index="1B3o_S" />
      </concept>
      <concept id="5351203823916750322" name="jetbrains.mps.baseLanguage.structure.TryUniversalStatement" flags="nn" index="3J1_TO">
        <child id="8276990574886367510" name="catchClause" index="1zxBo5" />
        <child id="8276990574886367508" name="body" index="1zxBo7" />
      </concept>
      <concept id="1146644602865" name="jetbrains.mps.baseLanguage.structure.PublicVisibility" flags="nn" index="3Tm1VV" />
      <concept id="1170345865475" name="jetbrains.mps.baseLanguage.structure.AnonymousClass" flags="ig" index="1Y3b0j">
        <reference id="1170346070688" name="classifier" index="1Y3XeK" />
      </concept>
    </language>
    <language id="fd392034-7849-419d-9071-12563d152375" name="jetbrains.mps.baseLanguage.closures">
      <concept id="2524418899405758586" name="jetbrains.mps.baseLanguage.closures.structure.InferredClosureParameterDeclaration" flags="ig" index="gl6BB" />
      <concept id="1199569711397" name="jetbrains.mps.baseLanguage.closures.structure.ClosureLiteral" flags="nn" index="1bVj0M">
        <child id="1199569906740" name="parameter" index="1bW2Oz" />
        <child id="1199569916463" name="body" index="1bW5cS" />
      </concept>
    </language>
    <language id="7866978e-a0f0-4cc7-81bc-4d213d9375e1" name="jetbrains.mps.lang.smodel">
      <concept id="1177026924588" name="jetbrains.mps.lang.smodel.structure.RefConcept_Reference" flags="nn" index="chp4Y">
        <reference id="1177026940964" name="conceptDeclaration" index="cht4Q" />
      </concept>
      <concept id="1179409122411" name="jetbrains.mps.lang.smodel.structure.Node_ConceptMethodCall" flags="nn" index="2qgKlT" />
      <concept id="4693937538533521280" name="jetbrains.mps.lang.smodel.structure.OfConceptOperation" flags="ng" index="v3k3i">
        <child id="4693937538533538124" name="requestedConcept" index="v3oSu" />
      </concept>
      <concept id="2396822768958367367" name="jetbrains.mps.lang.smodel.structure.AbstractTypeCastExpression" flags="nn" index="$5XWr">
        <child id="6733348108486823193" name="leftExpression" index="1m5AlR" />
        <child id="3906496115198199033" name="conceptArgument" index="3oSUPX" />
      </concept>
      <concept id="1171310072040" name="jetbrains.mps.lang.smodel.structure.Node_GetContainingRootOperation" flags="nn" index="2Rxl7S" />
      <concept id="1140137987495" name="jetbrains.mps.lang.smodel.structure.SNodeTypeCastExpression" flags="nn" index="1PxgMI">
        <property id="1238684351431" name="asCast" index="1BlNFB" />
      </concept>
      <concept id="1138055754698" name="jetbrains.mps.lang.smodel.structure.SNodeType" flags="in" index="3Tqbb2">
        <reference id="1138405853777" name="concept" index="ehGHo" />
      </concept>
      <concept id="1138056022639" name="jetbrains.mps.lang.smodel.structure.SPropertyAccess" flags="nn" index="3TrcHB">
        <reference id="1138056395725" name="property" index="3TsBF5" />
      </concept>
      <concept id="1138056143562" name="jetbrains.mps.lang.smodel.structure.SLinkAccess" flags="nn" index="3TrEf2">
        <reference id="1138056516764" name="link" index="3Tt5mk" />
      </concept>
      <concept id="1138056282393" name="jetbrains.mps.lang.smodel.structure.SLinkListAccess" flags="nn" index="3Tsc0h">
        <reference id="1138056546658" name="link" index="3TtcxE" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ngI" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="83888646-71ce-4f1c-9c53-c54016f6ad4f" name="jetbrains.mps.baseLanguage.collections">
      <concept id="1204796164442" name="jetbrains.mps.baseLanguage.collections.structure.InternalSequenceOperation" flags="nn" index="23sCx2">
        <child id="1204796294226" name="closure" index="23t8la" />
      </concept>
      <concept id="1204980550705" name="jetbrains.mps.baseLanguage.collections.structure.VisitAllOperation" flags="nn" index="2es0OD" />
      <concept id="1151689724996" name="jetbrains.mps.baseLanguage.collections.structure.SequenceType" flags="in" index="A3Dl8">
        <child id="1151689745422" name="elementType" index="A3Ik2" />
      </concept>
      <concept id="1201792049884" name="jetbrains.mps.baseLanguage.collections.structure.TranslateOperation" flags="nn" index="3goQfb" />
    </language>
  </registry>
  <node concept="13h7C7" id="7cIlz6Qakxi">
    <ref role="13h7C2" to="3f1g:7cIlz6Qaf9r" resolve="CustomFrame" />
    <node concept="13i0hz" id="6vTsh3ZYyHM" role="13h7CS">
      <property role="TrG5h" value="nonEmptyItems" />
      <ref role="13i0hy" to="xk6s:59WscmUTju7" resolve="nonEmptyItems" />
      <node concept="3Tm1VV" id="6vTsh3ZYyHN" role="1B3o_S" />
      <node concept="3clFbS" id="6vTsh3ZYyHR" role="3clF47">
        <node concept="3clFbF" id="6vTsh3ZYA7d" role="3cqZAp">
          <node concept="2OqwBi" id="4ssrwy9RgVp" role="3clFbG">
            <node concept="2OqwBi" id="21ieoTcAzsf" role="2Oq$k0">
              <node concept="2OqwBi" id="2BH_fs4FLM7" role="2Oq$k0">
                <node concept="2OqwBi" id="hHDM$th" role="2Oq$k0">
                  <node concept="13iPFW" id="hHDM$mD" role="2Oq$k0" />
                  <node concept="3TrEf2" id="2BH_fs4FKDk" role="2OqNvi">
                    <ref role="3Tt5mk" to="34lm:1sudaVNqppI" resolve="content" />
                  </node>
                </node>
                <node concept="3Tsc0h" id="2BH_fs4FMc8" role="2OqNvi">
                  <ref role="3TtcxE" to="34lm:1sudaVNqpje" resolve="contents" />
                </node>
              </node>
              <node concept="v3k3i" id="21ieoTcABET" role="2OqNvi">
                <node concept="chp4Y" id="59WscmUTn1U" role="v3oSu">
                  <ref role="cht4Q" to="av4b:59WscmUTdO4" resolve="ITestItemContainer" />
                </node>
              </node>
            </node>
            <node concept="3goQfb" id="4ssrwy9SEuQ" role="2OqNvi">
              <node concept="1bVj0M" id="4ssrwy9SEuS" role="23t8la">
                <node concept="3clFbS" id="4ssrwy9SEuT" role="1bW5cS">
                  <node concept="3clFbF" id="4ssrwy9SEuU" role="3cqZAp">
                    <node concept="2OqwBi" id="4ssrwy9SEuV" role="3clFbG">
                      <node concept="37vLTw" id="4ssrwy9SEuW" role="2Oq$k0">
                        <ref role="3cqZAo" node="3jPfgOVmc_B" />
                      </node>
                      <node concept="2qgKlT" id="59WscmUTnLB" role="2OqNvi">
                        <ref role="37wK5l" to="xk6s:59WscmUTju7" resolve="nonEmptyItems" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="gl6BB" id="3jPfgOVmc_B" role="1bW2Oz">
                  <property role="TrG5h" value="it" />
                  <node concept="2jxLKc" id="3jPfgOVmc_C" role="1tU5fm" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="A3Dl8" id="6vTsh3ZZh1O" role="3clF45">
        <node concept="3Tqbb2" id="6vTsh3ZZh1P" role="A3Ik2">
          <ref role="ehGHo" to="av4b:78hTg1$THIw" resolve="AbstractTestItem" />
        </node>
      </node>
    </node>
    <node concept="13i0hz" id="7cIlz6Q8y4g" role="13h7CS">
      <property role="TrG5h" value="takeScreenshot2" />
      <node concept="3Tm1VV" id="7cIlz6Q8y4h" role="1B3o_S" />
      <node concept="3cqZAl" id="7cIlz6Q8y4i" role="3clF45" />
      <node concept="3clFbS" id="7cIlz6Q8y4j" role="3clF47">
        <node concept="3cpWs8" id="3JvidvJx5cB" role="3cqZAp">
          <node concept="3cpWsn" id="3JvidvJx5cC" role="3cpWs9">
            <property role="TrG5h" value="nonEmptyItems" />
            <node concept="A3Dl8" id="3JvidvJx591" role="1tU5fm">
              <node concept="3Tqbb2" id="3JvidvJx594" role="A3Ik2">
                <ref role="ehGHo" to="av4b:78hTg1$THIw" resolve="AbstractTestItem" />
              </node>
            </node>
            <node concept="BsUDl" id="2BH_fs4FJ9n" role="33vP2m">
              <ref role="37wK5l" to="xk6s:59WscmUTju7" resolve="nonEmptyItems" />
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="ub9nkyPdsa" role="3cqZAp">
          <node concept="2OqwBi" id="ub9nkyPe0i" role="3clFbG">
            <node concept="37vLTw" id="3JvidvJx5cG" role="2Oq$k0">
              <ref role="3cqZAo" node="3JvidvJx5cC" resolve="nonEmptyItems" />
            </node>
            <node concept="2es0OD" id="ub9nkyPfpg" role="2OqNvi">
              <node concept="1bVj0M" id="ub9nkyPfpi" role="23t8la">
                <node concept="3clFbS" id="ub9nkyPfpj" role="1bW5cS">
                  <node concept="3clFbF" id="ub9nkyQ51e" role="3cqZAp">
                    <node concept="2OqwBi" id="ub9nkyPnC$" role="3clFbG">
                      <node concept="37vLTw" id="ub9nkyPnC_" role="2Oq$k0">
                        <ref role="3cqZAo" node="3jPfgOVmc_D" />
                      </node>
                      <node concept="2qgKlT" id="ub9nkyQb6k" role="2OqNvi">
                        <ref role="37wK5l" to="gdgh:3R3AIvumrTm" resolve="runManually" />
                        <node concept="37vLTw" id="2BH_fs4FmsY" role="37wK5m">
                          <ref role="3cqZAo" node="7cIlz6Q8y5o" resolve="context" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="gl6BB" id="3jPfgOVmc_D" role="1bW2Oz">
                  <property role="TrG5h" value="it" />
                  <node concept="2jxLKc" id="3jPfgOVmc_E" role="1tU5fm" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="3JvidvJx4Kd" role="3cqZAp">
          <node concept="2YIFZM" id="3JvidvJx6cH" role="3clFbG">
            <ref role="37wK5l" to="gdgh:3JvidvJx5Pp" resolve="updateEditors" />
            <ref role="1Pybhc" to="gdgh:3JvidvJwDTf" resolve="RunManuallyUtil" />
            <node concept="37vLTw" id="2BH_fs4For3" role="37wK5m">
              <ref role="3cqZAo" node="7cIlz6Q8y5o" resolve="context" />
            </node>
            <node concept="37vLTw" id="3JvidvJx6cJ" role="37wK5m">
              <ref role="3cqZAo" node="3JvidvJx5cC" resolve="nonEmptyItems" />
            </node>
          </node>
        </node>
        <node concept="3clFbH" id="2BH_fs4FjeX" role="3cqZAp" />
        <node concept="3cpWs8" id="7cIlz6Q8y4k" role="3cqZAp">
          <node concept="3cpWsn" id="7cIlz6Q8y4l" role="3cpWs9">
            <property role="TrG5h" value="pp" />
            <node concept="17QB3L" id="7cIlz6Q8y4m" role="1tU5fm" />
            <node concept="2OqwBi" id="7cIlz6Q8y4n" role="33vP2m">
              <node concept="13iPFW" id="7cIlz6Q8y4o" role="2Oq$k0" />
              <node concept="2qgKlT" id="7cIlz6Q8y4p" role="2OqNvi">
                <ref role="37wK5l" to="srqo:2c2AzQcxb7B" resolve="qualifiedFilePath" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="7cIlz6Q8y4x" role="3cqZAp">
          <node concept="3cpWsn" id="7cIlz6Q8y4y" role="3cpWs9">
            <property role="TrG5h" value="f" />
            <property role="3TUv4t" value="true" />
            <node concept="3uibUv" id="7cIlz6Q8y4z" role="1tU5fm">
              <ref role="3uigEE" to="guwi:~File" resolve="File" />
            </node>
            <node concept="2ShNRf" id="7cIlz6Q8y4$" role="33vP2m">
              <node concept="1pGfFk" id="7cIlz6Q8y4_" role="2ShVmc">
                <ref role="37wK5l" to="guwi:~File.&lt;init&gt;(java.lang.String)" resolve="File" />
                <node concept="37vLTw" id="7cIlz6Q8y4A" role="37wK5m">
                  <ref role="3cqZAo" node="7cIlz6Q8y4l" resolve="pp" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="7cIlz6Q8y4B" role="3cqZAp">
          <node concept="2OqwBi" id="7cIlz6Q8y4C" role="3clFbG">
            <node concept="37vLTw" id="7cIlz6Q8y4D" role="2Oq$k0">
              <ref role="3cqZAo" node="7cIlz6Q8y4y" resolve="f" />
            </node>
            <node concept="liA8E" id="7cIlz6Q8y4E" role="2OqNvi">
              <ref role="37wK5l" to="guwi:~File.mkdirs()" resolve="mkdirs" />
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="7cIlz6Q8y4F" role="3cqZAp">
          <node concept="3cpWsn" id="7cIlz6Q8y4G" role="3cpWs9">
            <property role="TrG5h" value="fname" />
            <node concept="17QB3L" id="7cIlz6Q8y4H" role="1tU5fm" />
            <node concept="2OqwBi" id="7cIlz6Q8y4I" role="33vP2m">
              <node concept="13iPFW" id="7cIlz6Q8y4J" role="2Oq$k0" />
              <node concept="2qgKlT" id="7cIlz6Q8y4K" role="2OqNvi">
                <ref role="37wK5l" to="srqo:1sudaVNr1vl" resolve="qualifiedFileName" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3J1_TO" id="7cIlz6Q8y4S" role="3cqZAp">
          <node concept="3uVAMA" id="7cIlz6Q8y4T" role="1zxBo5">
            <node concept="XOnhg" id="7cIlz6Q8y4U" role="1zc67B">
              <property role="TrG5h" value="e" />
              <node concept="nSUau" id="7cIlz6Q8y4V" role="1tU5fm">
                <node concept="3uibUv" id="7cIlz6Q8y4W" role="nSUat">
                  <ref role="3uigEE" to="wyt6:~Exception" resolve="Exception" />
                </node>
              </node>
            </node>
            <node concept="3clFbS" id="7cIlz6Q8y4X" role="1zc67A">
              <node concept="3clFbF" id="7cIlz6QatF_" role="3cqZAp">
                <node concept="2YIFZM" id="7cIlz6QatMs" role="3clFbG">
                  <ref role="37wK5l" to="fnpx:~Notifications$Bus.notify(com.intellij.notification.Notification)" resolve="notify" />
                  <ref role="1Pybhc" to="fnpx:~Notifications$Bus" resolve="Notifications.Bus" />
                  <node concept="2ShNRf" id="7cIlz6QatS2" role="37wK5m">
                    <node concept="1pGfFk" id="7cIlz6QawBl" role="2ShVmc">
                      <property role="373rjd" value="true" />
                      <ref role="37wK5l" to="fnpx:~Notification.&lt;init&gt;(java.lang.String,java.lang.String,com.intellij.notification.NotificationType)" resolve="Notification" />
                      <node concept="Xl_RD" id="7cIlz6QawHy" role="37wK5m">
                        <property role="Xl_RC" value="Failed to saved screenshot" />
                      </node>
                      <node concept="2OqwBi" id="7cIlz6QayZd" role="37wK5m">
                        <node concept="37vLTw" id="7cIlz6QayHA" role="2Oq$k0">
                          <ref role="3cqZAo" node="7cIlz6Q8y4U" resolve="e" />
                        </node>
                        <node concept="liA8E" id="7cIlz6QazkT" role="2OqNvi">
                          <ref role="37wK5l" to="wyt6:~Throwable.getMessage()" resolve="getMessage" />
                        </node>
                      </node>
                      <node concept="Rm8GO" id="7cIlz6Qayef" role="37wK5m">
                        <ref role="Rm8GQ" to="fnpx:~NotificationType.ERROR" resolve="ERROR" />
                        <ref role="1Px2BO" to="fnpx:~NotificationType" resolve="NotificationType" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="3cpWs6" id="7cIlz6QazEm" role="3cqZAp" />
            </node>
          </node>
          <node concept="3clFbS" id="7cIlz6Q8y51" role="1zxBo7">
            <node concept="3clFbF" id="7cIlz6Q8y52" role="3cqZAp">
              <node concept="2YIFZM" id="7cIlz6Q8y53" role="3clFbG">
                <ref role="37wK5l" to="d244:7SQqK0Fdjw_" resolve="writeImage" />
                <ref role="1Pybhc" to="d244:1yFmGPnLcL9" resolve="CellEditorScreenshooter" />
                <node concept="2OqwBi" id="7cIlz6Q8y54" role="37wK5m">
                  <node concept="2OqwBi" id="7cIlz6Q8y55" role="2Oq$k0">
                    <node concept="37vLTw" id="7cIlz6Q8y56" role="2Oq$k0">
                      <ref role="3cqZAo" node="7cIlz6Q8y5o" resolve="context" />
                    </node>
                    <node concept="liA8E" id="7cIlz6Q8y57" role="2OqNvi">
                      <ref role="37wK5l" to="cj4x:~EditorContext.getEditorComponent()" resolve="getEditorComponent" />
                    </node>
                  </node>
                  <node concept="liA8E" id="7cIlz6Q8y58" role="2OqNvi">
                    <ref role="37wK5l" to="cj4x:~EditorComponent.findNodeCell(org.jetbrains.mps.openapi.model.SNode)" resolve="findNodeCell" />
                    <node concept="2OqwBi" id="7cIlz6Q8y59" role="37wK5m">
                      <node concept="13iPFW" id="7cIlz6Q8y5a" role="2Oq$k0" />
                      <node concept="3TrEf2" id="7cIlz6Q8y5b" role="2OqNvi">
                        <ref role="3Tt5mk" to="34lm:1sudaVNqppI" resolve="content" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="37vLTw" id="7cIlz6Q8y5c" role="37wK5m">
                  <ref role="3cqZAo" node="7cIlz6Q8y4G" resolve="fname" />
                </node>
              </node>
            </node>
            <node concept="3cpWs8" id="2BH_fs4DaeG" role="3cqZAp">
              <node concept="3cpWsn" id="2BH_fs4DaeH" role="3cpWs9">
                <property role="TrG5h" value="path" />
                <node concept="3uibUv" id="2BH_fs4D9XT" role="1tU5fm">
                  <ref role="3uigEE" to="eoo2:~Path" resolve="Path" />
                </node>
                <node concept="2YIFZM" id="2BH_fs4DaeI" role="33vP2m">
                  <ref role="37wK5l" to="eoo2:~Path.of(java.lang.String,java.lang.String...)" resolve="of" />
                  <ref role="1Pybhc" to="eoo2:~Path" resolve="Path" />
                  <node concept="37vLTw" id="2BH_fs4DaeJ" role="37wK5m">
                    <ref role="3cqZAo" node="7cIlz6Q8y4G" resolve="fname" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="3cpWs8" id="2BH_fs4Dg32" role="3cqZAp">
              <node concept="3cpWsn" id="2BH_fs4Dg33" role="3cpWs9">
                <property role="TrG5h" value="newFile" />
                <node concept="3uibUv" id="2BH_fs4Dg34" role="1tU5fm">
                  <ref role="3uigEE" to="guwi:~File" resolve="File" />
                </node>
                <node concept="2ShNRf" id="2BH_fs4Dhcx" role="33vP2m">
                  <node concept="1pGfFk" id="2BH_fs4DhIa" role="2ShVmc">
                    <property role="373rjd" value="true" />
                    <ref role="37wK5l" to="guwi:~File.&lt;init&gt;(java.lang.String,java.lang.String)" resolve="File" />
                    <node concept="2OqwBi" id="2BH_fs4Dd63" role="37wK5m">
                      <node concept="2OqwBi" id="2BH_fs4DbRK" role="2Oq$k0">
                        <node concept="37vLTw" id="2BH_fs4Db9$" role="2Oq$k0">
                          <ref role="3cqZAo" node="2BH_fs4DaeH" resolve="path" />
                        </node>
                        <node concept="liA8E" id="2BH_fs4DcHn" role="2OqNvi">
                          <ref role="37wK5l" to="eoo2:~Path.toFile()" resolve="toFile" />
                        </node>
                      </node>
                      <node concept="liA8E" id="2BH_fs4DdIc" role="2OqNvi">
                        <ref role="37wK5l" to="guwi:~File.getParent()" resolve="getParent" />
                      </node>
                    </node>
                    <node concept="3cpWs3" id="2BH_fs4DnaP" role="37wK5m">
                      <node concept="Xl_RD" id="2BH_fs4DnaS" role="3uHU7w">
                        <property role="Xl_RC" value=".md" />
                      </node>
                      <node concept="2OqwBi" id="2BH_fs4EBp1" role="3uHU7B">
                        <node concept="1PxgMI" id="2BH_fs4KgDU" role="2Oq$k0">
                          <property role="1BlNFB" value="true" />
                          <node concept="chp4Y" id="2BH_fs4Ki5T" role="3oSUPX">
                            <ref role="cht4Q" to="tpck:h0TrEE$" resolve="INamedConcept" />
                          </node>
                          <node concept="2OqwBi" id="2BH_fs4E$Na" role="1m5AlR">
                            <node concept="13iPFW" id="2BH_fs4EzJG" role="2Oq$k0" />
                            <node concept="2Rxl7S" id="2BH_fs4K1ef" role="2OqNvi" />
                          </node>
                        </node>
                        <node concept="3TrcHB" id="2BH_fs4ECtV" role="2OqNvi">
                          <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3clFbF" id="2BH_fs4D746" role="3cqZAp">
              <node concept="2YIFZM" id="2BH_fs4D7Vt" role="3clFbG">
                <ref role="37wK5l" to="eoo2:~Files.writeString(java.nio.file.Path,java.lang.CharSequence,java.nio.charset.Charset,java.nio.file.OpenOption...)" resolve="writeString" />
                <ref role="1Pybhc" to="eoo2:~Files" resolve="Files" />
                <node concept="2OqwBi" id="2BH_fs4Dq7S" role="37wK5m">
                  <node concept="37vLTw" id="2BH_fs4Do_8" role="2Oq$k0">
                    <ref role="3cqZAo" node="2BH_fs4Dg33" resolve="newFile" />
                  </node>
                  <node concept="liA8E" id="2BH_fs4DqwI" role="2OqNvi">
                    <ref role="37wK5l" to="guwi:~File.toPath()" resolve="toPath" />
                  </node>
                </node>
                <node concept="3cpWs3" id="2BH_fs4EIDF" role="37wK5m">
                  <node concept="Xl_RD" id="2BH_fs4EGX0" role="3uHU7w">
                    <property role="Xl_RC" value=".png)" />
                  </node>
                  <node concept="3cpWs3" id="2BH_fs4EGWS" role="3uHU7B">
                    <node concept="Xl_RD" id="2BH_fs4EGWY" role="3uHU7B">
                      <property role="Xl_RC" value="---\nhide:\n- toc\n---\n![image](" />
                    </node>
                    <node concept="2OqwBi" id="2BH_fs4EJEF" role="3uHU7w">
                      <node concept="13iPFW" id="2BH_fs4EJc$" role="2Oq$k0" />
                      <node concept="3TrcHB" id="2BH_fs4EKgq" role="2OqNvi">
                        <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="10M0yZ" id="2BH_fs4DzC$" role="37wK5m">
                  <ref role="3cqZAo" to="7x5y:~StandardCharsets.UTF_8" resolve="UTF_8" />
                  <ref role="1PxDUh" to="7x5y:~StandardCharsets" resolve="StandardCharsets" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="2BH_fs4_cYL" role="3cqZAp">
          <node concept="3cpWsn" id="2BH_fs4_cYM" role="3cpWs9">
            <property role="TrG5h" value="notification" />
            <node concept="3uibUv" id="2BH_fs4_cAS" role="1tU5fm">
              <ref role="3uigEE" to="fnpx:~Notification" resolve="Notification" />
            </node>
            <node concept="2ShNRf" id="2BH_fs4_cYN" role="33vP2m">
              <node concept="1pGfFk" id="2BH_fs4_cYO" role="2ShVmc">
                <property role="373rjd" value="true" />
                <ref role="37wK5l" to="fnpx:~Notification.&lt;init&gt;(java.lang.String,java.lang.String,com.intellij.notification.NotificationType)" resolve="Notification" />
                <node concept="Xl_RD" id="2BH_fs4_cYP" role="37wK5m">
                  <property role="Xl_RC" value="Saved screenshot" />
                </node>
                <node concept="3cpWs3" id="2BH_fs4_cYQ" role="37wK5m">
                  <node concept="37vLTw" id="2BH_fs4_cYR" role="3uHU7w">
                    <ref role="3cqZAo" node="7cIlz6Q8y4G" resolve="fname" />
                  </node>
                  <node concept="Xl_RD" id="2BH_fs4_cYS" role="3uHU7B" />
                </node>
                <node concept="Rm8GO" id="2BH_fs4_cYT" role="37wK5m">
                  <ref role="Rm8GQ" to="fnpx:~NotificationType.INFORMATION" resolve="INFORMATION" />
                  <ref role="1Px2BO" to="fnpx:~NotificationType" resolve="NotificationType" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3cpWs8" id="6mIllBujApv" role="3cqZAp">
          <node concept="3cpWsn" id="6mIllBujApw" role="3cpWs9">
            <property role="TrG5h" value="action" />
            <node concept="3uibUv" id="6mIllBujAoy" role="1tU5fm">
              <ref role="3uigEE" to="qkt:~AnAction" resolve="AnAction" />
            </node>
            <node concept="2ShNRf" id="6mIllBujApx" role="33vP2m">
              <node concept="YeOm9" id="6mIllBujApy" role="2ShVmc">
                <node concept="1Y3b0j" id="6mIllBujApz" role="YeSDq">
                  <property role="2bfB8j" value="true" />
                  <property role="373rjd" value="true" />
                  <ref role="1Y3XeK" to="qkt:~AnAction" resolve="AnAction" />
                  <ref role="37wK5l" to="qkt:~AnAction.&lt;init&gt;(java.lang.String)" resolve="AnAction" />
                  <node concept="3Tm1VV" id="6mIllBujAp$" role="1B3o_S" />
                  <node concept="3clFb_" id="6mIllBujAp_" role="jymVt">
                    <property role="TrG5h" value="actionPerformed" />
                    <node concept="3Tm1VV" id="6mIllBujApA" role="1B3o_S" />
                    <node concept="3cqZAl" id="6mIllBujApB" role="3clF45" />
                    <node concept="37vLTG" id="6mIllBujApC" role="3clF46">
                      <property role="TrG5h" value="p1" />
                      <node concept="3uibUv" id="6mIllBujApD" role="1tU5fm">
                        <ref role="3uigEE" to="qkt:~AnActionEvent" resolve="AnActionEvent" />
                      </node>
                      <node concept="2AHcQZ" id="6mIllBujApE" role="2AJF6D">
                        <ref role="2AI5Lk" to="mhfm:~NotNull" resolve="NotNull" />
                      </node>
                    </node>
                    <node concept="3clFbS" id="6mIllBujApF" role="3clF47">
                      <node concept="3J1_TO" id="6mIllBujApG" role="3cqZAp">
                        <node concept="3clFbS" id="6mIllBujApH" role="1zxBo7">
                          <node concept="3clFbF" id="6mIllBujApI" role="3cqZAp">
                            <node concept="2OqwBi" id="6mIllBujApJ" role="3clFbG">
                              <node concept="2YIFZM" id="6mIllBujApK" role="2Oq$k0">
                                <ref role="37wK5l" to="z60i:~Desktop.getDesktop()" resolve="getDesktop" />
                                <ref role="1Pybhc" to="z60i:~Desktop" resolve="Desktop" />
                              </node>
                              <node concept="liA8E" id="6mIllBujApL" role="2OqNvi">
                                <ref role="37wK5l" to="z60i:~Desktop.open(java.io.File)" resolve="open" />
                                <node concept="37vLTw" id="6mIllBujApM" role="37wK5m">
                                  <ref role="3cqZAo" node="7cIlz6Q8y4y" resolve="f" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3uVAMA" id="6mIllBujApN" role="1zxBo5">
                          <node concept="3clFbS" id="6mIllBujApO" role="1zc67A" />
                          <node concept="XOnhg" id="6mIllBujApP" role="1zc67B">
                            <property role="TrG5h" value="e" />
                            <node concept="nSUau" id="6mIllBujApQ" role="1tU5fm">
                              <node concept="3uibUv" id="6mIllBujApR" role="nSUat">
                                <ref role="3uigEE" to="guwi:~IOException" resolve="IOException" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="2AHcQZ" id="6mIllBujApS" role="2AJF6D">
                      <ref role="2AI5Lk" to="wyt6:~Override" resolve="Override" />
                    </node>
                  </node>
                  <node concept="Xl_RD" id="6mIllBujApT" role="37wK5m">
                    <property role="Xl_RC" value="Open folder" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbH" id="6mIllBujEPL" role="3cqZAp" />
        <node concept="3clFbF" id="6mIllBujASz" role="3cqZAp">
          <node concept="2OqwBi" id="6mIllBujBfq" role="3clFbG">
            <node concept="37vLTw" id="6mIllBujASx" role="2Oq$k0">
              <ref role="3cqZAo" node="2BH_fs4_cYM" resolve="notification" />
            </node>
            <node concept="liA8E" id="6mIllBujBHA" role="2OqNvi">
              <ref role="37wK5l" to="fnpx:~Notification.addAction(com.intellij.openapi.actionSystem.AnAction)" resolve="addAction" />
              <node concept="37vLTw" id="6mIllBujCdW" role="37wK5m">
                <ref role="3cqZAo" node="6mIllBujApw" resolve="action" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3clFbF" id="2BH_fs4CD14" role="3cqZAp">
          <node concept="2YIFZM" id="2BH_fs4CD15" role="3clFbG">
            <ref role="37wK5l" to="fnpx:~Notifications$Bus.notify(com.intellij.notification.Notification)" resolve="notify" />
            <ref role="1Pybhc" to="fnpx:~Notifications$Bus" resolve="Notifications.Bus" />
            <node concept="37vLTw" id="2BH_fs4CDPQ" role="37wK5m">
              <ref role="3cqZAo" node="2BH_fs4_cYM" resolve="notification" />
            </node>
          </node>
        </node>
        <node concept="3clFbH" id="2BH_fs4CCUI" role="3cqZAp" />
      </node>
      <node concept="37vLTG" id="7cIlz6Q8y5o" role="3clF46">
        <property role="TrG5h" value="context" />
        <node concept="3uibUv" id="7cIlz6Q8y5p" role="1tU5fm">
          <ref role="3uigEE" to="cj4x:~EditorContext" resolve="EditorContext" />
        </node>
      </node>
    </node>
    <node concept="13hLZK" id="7cIlz6Qakxj" role="13h7CW">
      <node concept="3clFbS" id="7cIlz6Qakxk" role="2VODD2">
        <node concept="3clFbF" id="2BH_fs4ymLb" role="3cqZAp">
          <node concept="37vLTI" id="2BH_fs4yogg" role="3clFbG">
            <node concept="Xl_RD" id="2BH_fs4yogE" role="37vLTx">
              <property role="Xl_RC" value="screenshot" />
            </node>
            <node concept="2OqwBi" id="2BH_fs4yn8b" role="37vLTJ">
              <node concept="13iPFW" id="2BH_fs4ymLa" role="2Oq$k0" />
              <node concept="3TrcHB" id="2BH_fs4ynID" role="2OqNvi">
                <ref role="3TsBF5" to="tpck:h0TrG11" resolve="name" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</model>

