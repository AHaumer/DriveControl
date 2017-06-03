within DriveControl.Interfaces;
partial model PartialInverter "Partial DC/DC inverter"

  parameter DataRecords.Data data
    annotation (Placement(transformation(extent={{-10,80},{10,100}})));
  Interfaces.DriveBus driveBus
    annotation (Placement(transformation(extent={{-20,-120},{20,-80}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin bat_p
    "Positive DC input"
    annotation (Placement(transformation(extent={{-110,70},{-90,50}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin bat_n
    "Negative DC input"
    annotation (Placement(transformation(extent={{-90,-70},{-110,-50}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin mot_p
    "Positive DC output"
    annotation (Placement(transformation(extent={{110,70},{90,50}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin mot_n
    "Negative DC output"
    annotation (Placement(transformation(extent={{90,-70},{110,-50}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentMot annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={50,-50})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageMot annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={90,-30})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageBat annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-90,-30})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentBat annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,-50})));
equation
  connect(currentMot.p, mot_n)
    annotation (Line(points={{50,-60},{50,-60},{100,-60}}, color={0,0,255}));
  connect(currentMot.i, driveBus.iAct) annotation (Line(points={{40,-50},{30,-50},
          {30,-99.9},{0.1,-99.9}}, color={0,0,127}));
  connect(mot_n, voltageMot.n) annotation (Line(points={{100,-60},{100,-60},{90,
          -60},{90,-40}}, color={0,0,255}));
  connect(mot_p, voltageMot.p)
    annotation (Line(points={{100,60},{90,60},{90,-20}}, color={0,0,255}));
  connect(voltageMot.v, driveBus.vAct) annotation (Line(points={{80,-30},{50,-30},
          {20,-30},{20,-99.9},{0.1,-99.9}}, color={0,0,127}));
  connect(bat_n, voltageBat.n) annotation (Line(points={{-100,-60},{-90,-60},{
          -90,-40}}, color={0,0,255}));
  connect(bat_p, voltageBat.p)
    annotation (Line(points={{-100,60},{-90,60},{-90,-20}}, color={0,0,255}));
  connect(voltageBat.v, driveBus.vBat) annotation (Line(points={{-80,-30},{-50,
          -30},{-20,-30},{-20,-99.9},{0.1,-99.9}}, color={0,0,127}));
  connect(currentBat.i, driveBus.iBat) annotation (Line(points={{-40,-50},{-30,
          -50},{-30,-99.9},{0.1,-99.9}}, color={0,0,127}));
  connect(bat_n, currentBat.n) annotation (Line(points={{-100,-60},{-76,-60},{
          -50,-60}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{0,-50},{100,-70}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="DC out"),
        Text(
          extent={{-100,70},{0,50}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="DC in"),
        Line(
          points={{-100,-100},{100,100}},
          color={0,0,127}),
        Rectangle(
          extent={{-40,40},{40,-40}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-20,30},{-20,-30}},
          color={0,0,127}),
        Line(
          points={{-20,0},{20,0}},
          color={0,0,127}),
        Line(
          points={{20,30},{20,-30}},
          color={0,0,127}),
        Text(
          extent={{-100,130},{100,100}},
          lineColor={28,108,200},
          textString="%name")}),
                              Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
Partial model of a DC/DC inverter with commonly used connectors, measuremnets, bus, data record and icon.
</p>
</html>"));
end PartialInverter;
