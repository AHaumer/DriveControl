within DriveControl.Blocks;
block SpeedController "Speed controller"
  extends DriveControl.Interfaces.PartialController(
    referenceLimiter(uMax=data.wMax, uMin=-data.wMax),
    preFilter(T=data.TfW, y_start=w0),
    controller(
      final useI=true,
      T=data.TiW,
      YMax=data.tauMax,
      YMin=-data.tauMax,
      final FeedForward=true,
      kFF=kFF_Acceleration,
      k=kTune*data.kpW));
  parameter Real kFF_Acceleration=0 "Feed-forward of acceleration"
    annotation(Dialog(group="Advanced"));
  parameter Modelica.Units.SI.AngularVelocity w0=0 "Initial speed"
    annotation (Dialog(group="Advanced"));
  parameter Modelica.Units.SI.Time Td=1e-6
    "Derivative time constant of slewRateLimiter"
    annotation (Dialog(group="Advanced"));
  SlewRateLimiter slewRateLimiter(
    Rising=data.aMax,
    Falling=-data.aMax,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=w0,
    Td=Td) annotation (Placement(transformation(extent={{-20,40},{-40,60}})));
  Modelica.Blocks.Continuous.Der a
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Modelica.Blocks.Math.Gain feedForward(k=data.Jtot) annotation (Placement(
        transformation(
        extent={{10,10},{-10,-10}},
        rotation=270,
        origin={50,-30})));
equation
  connect(slewRateLimiter.y, a.u) annotation (Line(points={{-41,50},{-90,50},{
          -90,-50},{-42,-50}},
                           color={0,0,127}));
  connect(a.y, feedForward.u) annotation (Line(points={{-19,-50},{10,-50},{50,
          -50},{50,-42}},
                     color={0,0,127}));
  connect(referenceLimiter.y, slewRateLimiter.u)
    annotation (Line(points={{-1,50},{-18,50}}, color={0,0,127}));
  connect(slewRateLimiter.y, u) annotation (Line(points={{-41,50},{-41,50},{-90,
          50},{-90,0},{-50,0}}, color={0,0,127}));
  connect(controller.y, driveBus.tauRef)
    annotation (Line(points={{61,0},{100.1,0},{100.1,-0.1}}, color={0,0,127}));
  connect(referenceLimiter.u, driveBus.wRef) annotation (Line(points={{22,50},{
          62,50},{100.1,50},{100.1,-0.1}}, color={0,0,127}));
  connect(slewRateLimiter.y, driveBus.wRefLim) annotation (Line(points={{-41,50},
          {-66,50},{-90,50},{-90,30},{100.1,30},{100.1,-0.1}}, color={0,0,127}));
  connect(feedForward.y, controller.feedForward)
    annotation (Line(points={{50,-19},{50,-16},{50,-12}}, color={0,0,127}));
  connect(controlError.u2, driveBus.wAct) annotation (Line(points={{10,-8},{10,
          -8},{10,-60},{100.1,-60},{100.1,-0.1}}, color={0,0,127}));
  annotation (Icon(graphics={Text(
          extent={{-100,20},{100,-20}},
          lineColor={28,108,200},
          textString="speed")}), Documentation(info="<html>
<p>
Speed controller as explained in the <a href=\"modelica://DriveControl.UsersGuide.SpeedController\">User's guide, Speed controller</a>.
</p>
<p>
Necessary signals are read from and written to the <a href=\"modelica://DriveControl.Interfaces.DriveBus\">signal bus</a>.
</p>
<p>
Parameters are calculated in the <a href=\"modelica://DriveControl.DataRecords.Data\">data record</a>.
</p>
</html>"));
end SpeedController;
