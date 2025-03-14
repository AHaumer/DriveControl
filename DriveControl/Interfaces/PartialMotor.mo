within DriveControl.Interfaces;
partial model PartialMotor "Partial DC motor"
  extends Modelica.Mechanics.Rotational.Interfaces.PartialOneFlangeAndSupport;
  parameter DataRecords.Data data
    annotation (Placement(transformation(extent={{-10,40},{10,60}})));
  output Modelica.Units.SI.Angle phi(
    start=0,
    displayUnit="deg") = relAngleSensor.phi_rel;
  output Modelica.Units.SI.AngularVelocity w(
    start=0,
    displayUnit="rpm") = relSpeedSensor.w_rel;
  Interfaces.DriveBus driveBus annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-100,0})));
  Modelica.Mechanics.Rotational.Sensors.RelAngleSensor relAngleSensor
    annotation (Placement(transformation(extent={{50,-70},{70,-90}})));
  Modelica.Mechanics.Rotational.Sensors.RelSpeedSensor relSpeedSensor
    annotation (Placement(transformation(extent={{50,-40},{70,-20}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin mot_p
    "Positive DC output"
    annotation (Placement(transformation(extent={{70,110},{50,90}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin mot_n
    "Negative DC output"
    annotation (Placement(transformation(extent={{-50,110},{-70,90}})));
  Modelica.Mechanics.Rotational.Sources.QuadraticSpeedDependentTorque friction(
    useSupport=true,
    tau_nominal=-data.tauFric,
    TorqueDirection=false,
    w_nominal=data.wNom) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={30,-20})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(final J=data.Jr)
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,70})));
  Modelica.Mechanics.Rotational.Sensors.MultiSensor multiSensor
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
equation
  connect(relSpeedSensor.w_rel, driveBus.wAct) annotation (Line(points={{60,-41},
          {60,-41},{60,-50},{-100.1,-50},{-100.1,0.1}}, color={0,0,127}));
  connect(relAngleSensor.phi_rel, driveBus.phiAct) annotation (Line(points={{60,-69},
          {60,-60},{-100.1,-60},{-100.1,0.1}},      color={0,0,127}));
  connect(internalSupport, relSpeedSensor.flange_a) annotation (Line(points={{0,-80},
          {20,-80},{20,-70},{20,-30},{50,-30}},      color={0,0,0}));
  connect(internalSupport, relAngleSensor.flange_a)
    annotation (Line(points={{0,-80},{50,-80}},          color={0,0,0}));
  connect(flange, relSpeedSensor.flange_b) annotation (Line(points={{100,0},{80,
          0},{80,-30},{70,-30}}, color={0,0,0}));
  connect(flange, relAngleSensor.flange_b) annotation (Line(points={{100,0},{80,
          0},{80,-80},{70,-80}}, color={0,0,0}));
  connect(internalSupport, friction.support)
    annotation (Line(points={{0,-80},{20,-80},{20,-20}}, color={0,0,0}));
  connect(friction.flange, inertia.flange_a)
    annotation (Line(points={{30,-10},{30,0}},        color={0,0,0}));
  connect(mot_p, powerSensor.pc)
    annotation (Line(points={{60,100},{60,80}}, color={0,0,255}));
  connect(powerSensor.pc, powerSensor.pv)
    annotation (Line(points={{60,80},{70,80},{70,70}}, color={0,0,255}));
  connect(powerSensor.nv, mot_n)
    annotation (Line(points={{50,70},{-60,70},{-60,100}}, color={0,0,255}));
  connect(multiSensor.flange_b, flange)
    annotation (Line(points={{80,0},{100,0}}, color={0,0,0}));
  connect(inertia.flange_b, multiSensor.flange_a)
    annotation (Line(points={{50,0},{60,0}}, color={0,0,0}));
  annotation (Documentation(info="<html>
<p>
Partial model of a DC motor with commonly used connectors, measurements, bus, data record and icon.
</p>
</html>"), Icon(graphics={   Rectangle(
              extent={{-60,60},{60,-60}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={255,0,0}),    Rectangle(
              extent={{-60,60},{-90,-60}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={128,128,128}),Rectangle(
              extent={{60,10},{100,-10}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={95,95,95}),Rectangle(
              extent={{-40,70},{40,50}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),Polygon(
              points={{-70,-90},{-60,-90},{-30,-20},{30,-20},{60,-90},{70,
              -90},{70,-100},{-70,-100},{-70,-90}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
        Text(
          extent={{-100,100},{100,70}},
          lineColor={28,108,200},
          textString="%name")}));
end PartialMotor;
