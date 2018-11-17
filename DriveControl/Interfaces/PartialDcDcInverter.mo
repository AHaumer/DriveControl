within DriveControl.Interfaces;
partial model PartialDcDcInverter "Partial DC/DC inverter"

  parameter DataRecords.Data data
    annotation (Placement(transformation(extent={{-10,80},{10,100}})));
  Interfaces.DriveBus driveBus
    annotation (Placement(transformation(extent={{-20,-120},{20,-80}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin src_p
    "Positive DC input"
    annotation (Placement(transformation(extent={{-110,70},{-90,50}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin src_n
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
  Modelica.Electrical.Analog.Sensors.VoltageSensor voltageScr annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-90,-30})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSrc annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-50,-50})));
  Modelica.Blocks.Continuous.FirstOrder smoothingSrc[2](
    each final k=1,
    each final T=data.TsI,
    each initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start={data.Vdc0,0}) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-34,-66})));
  Modelica.Blocks.Continuous.FirstOrder smoothingMot[2](
    each final k=1,
    each final T=data.TsI,
    each initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (
      Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={34,-66})));
  Modelica.Electrical.Analog.Basic.Inductor ldc(i(fixed=true), L=data.Ldc)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-10})));
  Modelica.Blocks.Math.Mean meanSrc[2](each f=data.fS)
    annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-20,-80})));
  Modelica.Blocks.Math.Mean meanMot[2](each f=data.fS) annotation (Placement(
        transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={20,-80})));
equation
  connect(currentMot.p, mot_n)
    annotation (Line(points={{50,-60},{50,-60},{100,-60}}, color={0,0,255}));
  connect(mot_n, voltageMot.n) annotation (Line(points={{100,-60},{100,-60},{90,
          -60},{90,-40}}, color={0,0,255}));
  connect(mot_p, voltageMot.p)
    annotation (Line(points={{100,60},{90,60},{90,-20}}, color={0,0,255}));
  connect(src_n,voltageScr. n) annotation (Line(points={{-100,-60},{-90,-60},{
          -90,-40}}, color={0,0,255}));
  connect(src_p,voltageScr. p)
    annotation (Line(points={{-100,60},{-90,60},{-90,-20}}, color={0,0,255}));
  connect(src_n,currentSrc. n) annotation (Line(points={{-100,-60},{-76,-60},{
          -50,-60}}, color={0,0,255}));
  connect(ldc.p, currentMot.n)
    annotation (Line(points={{50,-20},{50,-40}}, color={0,0,255}));
  connect(voltageScr.v, smoothingSrc[1].u) annotation (Line(points={{-80,-30},{
          -34,-30},{-34,-58.8}}, color={0,0,127}));
  connect(currentSrc.i, smoothingSrc[2].u) annotation (Line(points={{-40,-50},{
          -34,-50},{-34,-58.8}}, color={0,0,127}));
  connect(voltageScr.v, meanSrc[1].u) annotation (Line(points={{-80,-30},{-20,
          -30},{-20,-72.8}}, color={0,0,127}));
  connect(currentSrc.i, meanSrc[2].u) annotation (Line(points={{-40,-50},{-20,
          -50},{-20,-72.8}}, color={0,0,127}));
  connect(voltageMot.v, smoothingMot[1].u)
    annotation (Line(points={{80,-30},{34,-30},{34,-58.8}}, color={0,0,127}));
  connect(currentMot.i, smoothingMot[2].u)
    annotation (Line(points={{40,-50},{34,-50},{34,-58.8}}, color={0,0,127}));
  connect(voltageMot.v, meanMot[1].u)
    annotation (Line(points={{80,-30},{20,-30},{20,-72.8}}, color={0,0,127}));
  connect(currentMot.i, meanMot[2].u)
    annotation (Line(points={{40,-50},{20,-50},{20,-72.8}}, color={0,0,127}));
  connect(smoothingSrc[1].y, driveBus.vSrc) annotation (Line(points={{-34,-72.6},
          {-34,-99.9},{0.1,-99.9}}, color={0,0,127}));
  connect(smoothingSrc[2].y, driveBus.iSrc) annotation (Line(points={{-34,-72.6},
          {-34,-99.9},{0.1,-99.9}}, color={0,0,127}));
  connect(smoothingMot[1].y, driveBus.vAct) annotation (Line(points={{34,-72.6},
          {34,-99.9},{0.1,-99.9}}, color={0,0,127}));
  connect(smoothingMot[2].y, driveBus.iAct) annotation (Line(points={{34,-72.6},
          {34,-99.9},{0.1,-99.9}}, color={0,0,127}));
  connect(meanSrc[1].y, driveBus.vSrcAv) annotation (Line(points={{-20,-86.6},{
          -20,-99.9},{0.1,-99.9}}, color={0,0,127}));
  connect(meanSrc[2].y, driveBus.iSrcAv) annotation (Line(points={{-20,-86.6},{
          -20,-99.9},{0.1,-99.9}}, color={0,0,127}));
  connect(meanMot[1].y, driveBus.vActAv) annotation (Line(points={{20,-86.6},{
          20,-99.9},{0.1,-99.9}}, color={0,0,127}));
  connect(meanMot[2].y, driveBus.iActAv) annotation (Line(points={{20,-86.6},{
          20,-99.9},{0.1,-99.9}}, color={0,0,127}));
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
        Text(
          extent={{-100,130},{100,100}},
          lineColor={28,108,200},
          textString="%name")}),
                              Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
Partial model of a DC/DC inverter with commonly used connectors, measurements, bus, data record and icon.
</p>
</html>"));
end PartialDcDcInverter;
