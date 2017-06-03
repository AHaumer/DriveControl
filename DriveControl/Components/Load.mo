within DriveControl.Components;
model Load "Mechanical load model"
  extends Modelica.Mechanics.Rotational.Interfaces.PartialOneFlangeAndSupport;
  parameter DriveControl.Types.SpeedDependency speedDependency=DriveControl.Types.SpeedDependency.Linear "Speed dependency of torque";
  parameter Modelica.SIunits.Torque tauN "Nominal torque at nominal speed";
  parameter Modelica.SIunits.AngularVelocity wN(displayUnit="rpm")=1 "Nominal speed"
    annotation(Dialog(enable=(speedDependency==DriveControl.Types.SpeedDependency.Linear or speedDependency==DriveControl.Types.SpeedDependency.Quadratic)));
  parameter Modelica.SIunits.AngularVelocity w0(displayUnit="rpm")=1e-3 "Minimum speed for regularization"
    annotation(Dialog(enable=speedDependency==DriveControl.Types.SpeedDependency.Constant, tab="Advanced"));
  parameter Modelica.SIunits.Time startTime=0 "Start time";
  parameter Modelica.SIunits.Inertia JL "Moment of inertia";
  Blocks.SpeedDependentTorque speedDependentTorque(
    final speedDependency=speedDependency,
    final tauN=-tauN,
    final wN=wN,
    final w0=w0,
    final startTime=startTime)
    annotation (Placement(transformation(extent={{10,30},{-10,50}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque(final useSupport=true)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor
    annotation (Placement(transformation(extent={{40,30},{20,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(final J=JL)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
equation
  connect(torque.support, internalSupport)
    annotation (Line(points={{0,-10},{0,-10},{0,-80}}, color={0,0,0}));
  connect(relSpeedSensor.w_rel, speedDependentTorque.u)
    annotation (Line(points={{30,31},{30,40},{12,40}}, color={0,0,127}));
  connect(speedDependentTorque.y, torque.tau) annotation (Line(points={{-11,40},
          {-20,40},{-20,0},{-12,0}}, color={0,0,127}));
  connect(torque.flange, relSpeedSensor.flange_b)
    annotation (Line(points={{10,0},{20,0},{20,20}}, color={0,0,0}));
  connect(torque.support, relSpeedSensor.flange_a)
    annotation (Line(points={{0,-10},{40,-10},{40,20}}, color={0,0,0}));
  connect(torque.flange, inertia.flange_a)
    annotation (Line(points={{10,0},{35,0},{60,0}}, color={0,0,0}));
  connect(inertia.flange_b, flange)
    annotation (Line(points={{80,0},{90,0},{100,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-96,96},{96,-96}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-58,-82},{-42,-68},{-20,-56},{0,-54},{18,-56},{34,-62},{44,
              -72},{54,-82},{60,-94}},     smooth=Smooth.Bezier),
        Polygon(
          points={{-65,-98},{-46,-80},{-58,-72},{-65,-98}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{94,16},{80,74},{50,52},{94,16}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,130},{100,100}},
          lineColor={0,0,255},
          textString="%name"),
        Line(points={{-92,0},{-76,36},{-54,62},{-30,80},{-14,88},{10,92},{
              26,90},{46,80},{64,62}}, smooth=Smooth.Bezier),
        Text(
          extent={{-100,-30},{100,-50}},
          lineColor={28,108,200},
          textString="start: %startTime")}),                     Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
Model of a speed dependent load torque. It is zero for time &lt; startTime, i.e. it can be switched on at startTime producing a torque step. 
This physical model utilizes the block <a href=\"modelica://DriveControl.Blocks.SpeedDependentTorque\">SpeedDependentTorque</a>. 
Additionally the load's inertia is taken into account.
</p>
<p>
Speed dependency of torque can be choosen from:
</p>
<ul>
<li>Unidirectional ... same direction of constant torque in both directions of rotation</li>
<li>Constant ... constant torque with linear regularization around zero speed</li>
<li>Linear ... linearly speed dependent torque</li>
<li>Quadratic ... quadratic speed dependent torque</li>
</ul>
</html>"));
end Load;
