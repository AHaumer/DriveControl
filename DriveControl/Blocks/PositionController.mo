within DriveControl.Blocks;
block PositionController "Position controller"
  extends DriveControl.Interfaces.PartialController(final use_preFilter=false,
    referenceLimiter(uMax=data.phiMax,uMin=data.phiMin), preFilter(T=1),
    controller(
      final useI=false,
      k=data.kpP,
      YMax=data.wMax,
      YMin=-data.wMax,
      final FeedForward=true,
      kFF=kFF_Speed));
  parameter Real kFF_Speed=0 "Feed-forward of speed"
    annotation(Dialog(tab="Advanced"));
  parameter Modelica.SIunits.Angle phi0=0 "Initial position"
    annotation(Dialog(group="Slew rate limiter"));
  parameter Modelica.SIunits.Time Td1=1e-6 "1st derivative time constant of der2Limiter"
    annotation(Dialog(group="Slew rate limiter"));
  parameter Modelica.SIunits.AngularVelocity w0=0 "Initial speed"
    annotation(Dialog(group="Slew rate limiter"));
  parameter Modelica.SIunits.Time Td2=1e-6 "2nd derivative time constant of der2Limiter"
    annotation(Dialog(group="Slew rate limiter"));

  Modelica.Blocks.Continuous.Der w
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
equation
  connect(referenceLimiter.u, driveBus.phiRef) annotation (Line(points={{22,50},
          {62,50},{100.1,50},{100.1,-0.1}}, color={0,0,127}));
  connect(controller.y, driveBus.wRef)
    annotation (Line(points={{51,0},{100.1,0},{100.1,-0.1}}, color={0,0,127}));
  connect(controlError.u2, driveBus.phiAct) annotation (Line(points={{10,-8},{10,
          -8},{10,-60},{100.1,-60},{100.1,-0.1}}, color={0,0,127}));
  connect(w.y, controller.feedForward) annotation (Line(points={{-19,-50},{10,
          -50},{40,-50},{40,-12}}, color={0,0,127}));
  connect(referenceLimiter.y, w.u) annotation (Line(points={{-1,50},{-90,50},{
          -90,-50},{-42,-50}}, color={0,0,127}));
  connect(referenceLimiter.y, u) annotation (Line(points={{-1,50},{-90,50},{-90,
          0},{-50,0}}, color={0,0,127}));
  connect(referenceLimiter.y, driveBus.phiRefLim) annotation (Line(points={{-1,
          50},{-90,50},{-90,30},{100.1,30},{100.1,-0.1}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(initialScale=0.1), graphics={Text(
          extent={{-100,20},{100,-20}},
          lineColor={28,108,200},
          textString="position")}), Diagram(coordinateSystem(initialScale=
            0.1)),
    Documentation(info="<html>
<p>
Position controller as explained in the <a href=\"modelica://DriveControl.UsersGuide.PositionController\">User's guide, Position controller</a>.
</p>
<p>
Necessary signals are read from and written to the <a href=\"modelica://DriveControl.Interfaces.DriveBus\">signal bus</a>.
</p>
<p>
Parameters are calculated in the <a href=\"modelica://DriveControl.DataRecords.Data\">data record</a>.
</p>
</html>"));
end PositionController;
