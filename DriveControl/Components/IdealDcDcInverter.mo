within DriveControl.Components;
model IdealDcDcInverter "Ideal DC/DC inverter"
  extends DriveControl.Interfaces.PartialDcDcInverter;
  parameter Modelica.Units.SI.Time Ti=1e-6
    "Integral time constant of power balance";
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor1 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,80})));
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor2 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,80})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={50,20})));
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,40})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{20,50},{0,30}})));
  Modelica.Blocks.Continuous.Integrator integrator(k=1/Ti)
    annotation (Placement(transformation(extent={{-10,30},{-30,50}})));
  Modelica.Blocks.Nonlinear.VariableLimiter
                                    limiter
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-30})));
  Modelica.Blocks.Continuous.FirstOrder deadTime(
    final k=1,
    initType=Modelica.Blocks.Types.Init.InitialState,
    final T=data.Td)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  Modelica.Blocks.Math.Gain negate(k=-1) annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=90,
        origin={8,-60})));
equation
  connect(powerSensor1.pc, powerSensor1.pv)
    annotation (Line(points={{-80,80},{-80,90},{-70,90}}, color={0,0,255}));
  connect(powerSensor2.pc, powerSensor2.pv)
    annotation (Line(points={{60,80},{60,90},{70,90}}, color={0,0,255}));
  connect(powerSensor1.nc, signalCurrent.p) annotation (Line(points={{-60,80},{
          -60,80},{-50,80},{-50,50}},                        color={0,0,255}));
  connect(signalVoltage.p, powerSensor2.pc) annotation (Line(points={{50,30},{
          50,30},{50,80},{60,80}},
                                color={0,0,255}));
  connect(powerSensor1.power, feedback.u2) annotation (Line(points={{-78,69},{
          -78,69},{-78,60},{10,60},{10,48}},
                                           color={0,0,127}));
  connect(limiter.y, deadTime.u) annotation (Line(points={{6.66134e-016,-19},{
          6.66134e-016,-47.5},{0,-47.5},{0,-12}},
                                     color={0,0,127}));
  connect(deadTime.y, signalVoltage.v)
    annotation (Line(points={{8.88178e-016,11},{8.88178e-016,20},{43,20}},
                                                        color={0,0,127}));
  connect(powerSensor1.pc,src_p)  annotation (Line(points={{-80,80},{-80,80},{
          -100,80},{-100,60}}, color={0,0,255}));
  connect(powerSensor2.nc, mot_p) annotation (Line(points={{80,80},{90,80},{100,
          80},{100,60}}, color={0,0,255}));
  connect(limiter.u, driveBus.vRef)
    annotation (Line(points={{0,-42},{0,-99.9},{0.1,-99.9}}, color={0,0,127}));
  connect(mot_n, ground.p) annotation (Line(points={{100,-60},{90,-60},{90,-80},
          {90,-80}}, color={0,0,255}));
  connect(mot_n, powerSensor2.nv) annotation (Line(points={{100,-60},{70,-60},{
          70,-60},{70,-60},{70,70}}, color={0,0,255}));
  connect(src_n, powerSensor1.nv) annotation (Line(points={{-100,-60},{-70,-60},
          {-70,70}},                     color={0,0,255}));
  connect(integrator.y, signalCurrent.i)
    annotation (Line(points={{-31,40},{-43,40}},          color={0,0,127}));
  connect(feedback.y, integrator.u)
    annotation (Line(points={{1,40},{-2,40},{-8,40}}, color={0,0,127}));
  connect(powerSensor2.power, feedback.u1) annotation (Line(points={{62,69},{62,
          69},{62,40},{18,40}}, color={0,0,127}));
  connect(negate.y, limiter.limit2)
    annotation (Line(points={{8,-55.6},{8,-42}}, color={0,0,127}));
  connect(currentSrc.p, signalCurrent.n)
    annotation (Line(points={{-50,-40},{-50,30},{-50,30}}, color={0,0,255}));
  connect(limiter.limit1, driveBus.vSrc) annotation (Line(points={{-8,-42},{-8,
          -70},{0.1,-70},{0.1,-99.9}}, color={0,0,127}));
  connect(negate.u, driveBus.vSrc) annotation (Line(points={{8,-64.8},{8,-70},{
          0.1,-70},{0.1,-99.9}}, color={0,0,127}));
  connect(signalVoltage.n, ldc.n)
    annotation (Line(points={{50,10},{50,0}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-100,130},{100,100}},
          lineColor={28,108,200},
          textString="%name"),
        Line(
          points={{-20,30},{-20,-30}},
          color={0,0,255}),
        Line(
          points={{-20,0},{20,0}},
          color={0,0,255}),
        Line(
          points={{20,30},{20,-30}},
          color={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
The IdealInverter is based on a power balance between input and output. 
The output voltage is fed (with a delay = dead time) to the output voltage source. 
The input current is driven by an integral controller observing the power balance.
</p>
</html>"));
end IdealDcDcInverter;
