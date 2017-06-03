within DriveControl.Interfaces;
partial model PartialBattery "Partial DC source"
  parameter Modelica.SIunits.Charge Q0(displayUnit="A.h")=0 "Initial charge";
  Modelica.Electrical.Analog.Interfaces.PositivePin bat_p
    "Positive DC input"
    annotation (Placement(transformation(extent={{90,70},{110,50}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin bat_n
    "Negative DC input"
    annotation (Placement(transformation(extent={{110,-70},{90,-50}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{70,-100},{90,-80}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor
    annotation (Placement(transformation(extent={{40,70},{60,50}})));
  Modelica.Blocks.Continuous.Integrator charge(k=1,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=Q0)
    annotation (Placement(transformation(extent={{60,70},{80,90}})));
  Modelica.SIunits.Charge Q(displayUnit="A.h")=charge.y "Charge";
equation
  connect(ground.p, bat_n)
    annotation (Line(points={{80,-80},{80,-80},{80,-60},{80,-60},{80,-60},{100,-60},
          {100,-60}},                                       color={0,0,255}));
  connect(currentSensor.i, charge.u)
    annotation (Line(points={{50,70},{50,80},{58,80}}, color={0,0,127}));
  connect(currentSensor.n, bat_p)
    annotation (Line(points={{60,60},{100,60}},          color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-100,100},{100,70}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name"),
        Ellipse(
          extent={{-70,-40},{70,-60}},
          lineColor={0,127,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Sphere),
        Rectangle(
          extent={{-70,50},{70,-50}},
          lineColor={0,127,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.VerticalCylinder),
        Ellipse(
          extent={{-70,60},{70,40}},
          lineColor={0,127,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-30,56},{30,44}},
          lineColor={0,140,72},
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid)}),                      Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
Partial model of a battery with commonly used connectors, charge integrator and icon.
</p>
</html>"));
end PartialBattery;
