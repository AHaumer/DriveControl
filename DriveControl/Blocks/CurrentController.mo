within DriveControl.Blocks;
block CurrentController "Current controller"
  extends DriveControl.Interfaces.PartialController(
    referenceLimiter(uMax=data.tauMax, uMin=-data.tauMax),
    preFilter(T=data.TfI),
    controller(
      final useI=true,
      k=data.kpI,
      T=data.TiI,
      YMax=data.VMax,
      YMin=-data.VMax,
      final FeedForward=true,
      kFF=kFF_InducedVoltage,
      limitation=DriveControl.Types.Limitation.Symmetrical));
  parameter Real kFF_InducedVoltage=1 "Feed-forward of induced voltage"
    annotation(Dialog(tab="Advanced"), Evaluate=true);
  Interfaces.DriveBus driveBus annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={100,0})));
  Modelica.Blocks.Math.Gain tau2i(k=1/data.kPhi)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Continuous.FirstOrder smoothing(
    final k=1,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    final T=data.TsI) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-30})));
  Modelica.Blocks.Math.Gain feedForward(k=data.kPhi) annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={40,-30})));
equation
  connect(feedForward.u, driveBus.wAct) annotation (Line(points={{40,-42},{40,
          -50},{100.1,-50},{100.1,-0.1}},    color={0,0,127}));
  connect(smoothing.u, driveBus.iAct) annotation (Line(points={{10,-42},{10,-42},
          {10,-60},{100.1,-60},{100.1,-0.1}},color={0,0,127}));
  connect(smoothing.y, controlError.u2)
    annotation (Line(points={{10,-19},{10,-8}}, color={0,0,127}));
  connect(feedForward.y, controller.feedForward)
    annotation (Line(points={{40,-19},{40,-19},{40,-12}}, color={0,0,127}));
  connect(referenceLimiter.y, tau2i.u) annotation (Line(points={{-1,50},{-1,50},
          {-90,50},{-90,0},{-82,0}}, color={0,0,127}));
  connect(referenceLimiter.u, driveBus.tauRef) annotation (Line(points={{22,50},
          {62,50},{100.1,50},{100.1,-0.1}}, color={0,0,127}));
  connect(referenceLimiter.y, driveBus.tauRefLim) annotation (Line(points={{-1,
          50},{-46,50},{-90,50},{-90,30},{100.1,30},{100.1,-0.1}}, color={0,0,
          127}));
  connect(controller.y, driveBus.vRef)
    annotation (Line(points={{51,0},{100.1,0},{100.1,-0.1}}, color={0,0,127}));
  connect(u, tau2i.y)
    annotation (Line(points={{-50,0},{-59,0},{-59,0}}, color={0,0,127}));
  connect(u, driveBus.iRef) annotation (Line(points={{-50,0},{-50,0},{-50,30},
          {100.1,30},{100.1,-0.1}},color={0,0,127}));
  connect(controller.yMax, driveBus.vBat) annotation (Line(points={{28,6},{20,6},
          {20,20},{100.1,20},{100.1,-0.1}}, color={0,0,127}));
  annotation (Icon(graphics={Text(
          extent={{-100,20},{100,-20}},
          lineColor={28,108,200},
          textString="current")}), Documentation(info="<html>
<p>
Current controller as explained in the <a href=\"modelica://DriveControl.UsersGuide.CurrentController\">User's guide, Current controller</a>.
</p>
<p>
Necessary signals are read from and written to the <a href=\"modelica://DriveControl.Interfaces.DriveBus\">signal bus</a>.
</p>
<p>
Parameters are calculated in the <a href=\"modelica://DriveControl.DataRecords.Data\">data record</a>.
</p>
</html>"));
end CurrentController;
