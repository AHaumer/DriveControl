within DriveControl.Blocks;
block LimPI "limited PI-controller with anti-windup and feedforward"
  extends Modelica.Blocks.Interfaces.SISO;
  import Modelica.Blocks.Types.Init;
  import Modelica.Constants.inf;
  parameter Boolean useI=true "PI else P" annotation(Evaluate=true);
  parameter Real k(unit="1")=1 "Gain";
  parameter Modelica.Units.SI.Time T(min=Modelica.Constants.small) = 1
    "Time Constant (T>0 required)" annotation (Dialog(enable=useI));
  parameter Boolean FeedForward=true "Use FeedForward?"
    annotation(Dialog(group="FeedForward"), Evaluate=true);
  parameter Real kFF(unit="1")=1 "FeedForward gain"
    annotation(Dialog(group="FeedForward", enable=FeedForward));
  parameter DriveControl.Types.Limitation limitation=DriveControl.Types.Limitation.Constant "Type of limits"
    annotation(Dialog(group="Limitation"), Evaluate=true);
  parameter Real YMax = inf "Upper limit of output"
    annotation(Dialog(group="Limitation", enable=limitation==DriveControl.Types.Limitation.Constant));
  parameter Real YMin=-YMax "Lower limit of output"
    annotation(Dialog(group="Limitation", enable=limitation==DriveControl.Types.Limitation.Constant));
  parameter Modelica.Blocks.Types.Init initType=Modelica.Blocks.Types.Init.NoInit
    "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)"
    annotation(Evaluate=true,
      Dialog(group="Initialization"));
  parameter Real x_start=0 "Initial or guess value of state"
    annotation (Dialog(group="Initialization"));
  parameter Real y_start=0 "Initial value of output"
    annotation(Dialog(enable=initType == Init.SteadyState or initType == Init.InitialOutput, group=
          "Initialization"));
  Modelica.Blocks.Interfaces.RealInput feedForward if  FeedForward annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  Modelica.Blocks.Math.Add addAntiWindup(k1=1, k2=-1/k)
    annotation (Placement(transformation(extent={{-80,-30},{-60,-10}})));
  Modelica.Blocks.Continuous.Integrator integrator(k=1/T, initType=Modelica.Blocks.Types.Init.NoInit) if useI
    annotation (Placement(transformation(extent={{-50,-30},{-30,-10}})));
  Modelica.Blocks.Math.Add3 add3(
    k1=k,
    k2=k,
    k3=kFF)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Blocks.Nonlinear.VariableLimiter limiter
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={30,-30})));
  Modelica.Blocks.Interfaces.RealInput yMax if limitation<>DriveControl.Types.Limitation.Constant "Upper limit of output"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput yMin if limitation==DriveControl.Types.Limitation.Variable "Lower limit of output"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
protected
  Modelica.Blocks.Sources.Constant zeroFF(k=0) if not FeedForward
    annotation (Placement(transformation(extent={{30,-90},{10,-70}})));
  Modelica.Blocks.Sources.Constant zeroI(k=0) if not useI
    annotation (Placement(transformation(extent={{-50,-90},{-30,-70}})));
  Modelica.Blocks.Math.Gain negate(final k=-1) if limitation==DriveControl.Types.Limitation.Symmetrical
    annotation (Placement(transformation(
        extent={{-4,-4},{4,4}},
        rotation=270,
        origin={40,48})));
  Modelica.Blocks.Sources.Constant constantUpperLimit(k=YMax) if limitation==DriveControl.Types.Limitation.Constant
    annotation (Placement(transformation(extent={{80,50},{60,70}})));
  Modelica.Blocks.Sources.Constant constantLowerLimit(k=YMin) if limitation==DriveControl.Types.Limitation.Constant
    annotation (Placement(transformation(extent={{80,-70},{60,-50}})));
  Modelica.Blocks.Sources.Constant zeroLowerLimit(k=0) if limitation==DriveControl.Types.Limitation.Unidirectional
    annotation (Placement(transformation(extent={{80,-100},{60,-80}})));
initial equation
  if initType == Init.SteadyState and useI then
    der(add3.u2) = 0;
  elseif initType == Init.InitialState and useI then
    add3.u2 = x_start;
  elseif initType == Init.InitialOutput then
    add3.y = y_start;
  end if;












equation
  connect(addAntiWindup.y, integrator.u) annotation (Line(points={{-59,-20},{-55.5,
          -20},{-52,-20}}, color={0,0,127}));
  connect(integrator.y, add3.u2) annotation (Line(points={{-29,-20},{-20,-20},{-20,
          0},{-2,0}}, color={0,0,127}));
  connect(u, add3.u1) annotation (Line(points={{-120,0},{-120,0},{-90,0},{-90,8},
          {-2,8}}, color={0,0,127}));
  connect(u, addAntiWindup.u1) annotation (Line(points={{-120,0},{-120,0},{-90,0},
          {-90,-14},{-82,-14}}, color={0,0,127}));
  connect(add3.y, limiter.u)
    annotation (Line(points={{21,0},{58,0}},        color={0,0,127}));
  connect(limiter.y, y)
    annotation (Line(points={{81,0},{110,0}},         color={0,0,127}));
  connect(add3.u3, zeroFF.y) annotation (Line(points={{-2,-8},{-10,-8},{-10,-80},
          {9,-80}},
                 color={0,0,127}));
  connect(add3.y, feedback.u1)
    annotation (Line(points={{21,0},{30,0},{30,-22}}, color={0,0,127}));
  connect(limiter.y, feedback.u2) annotation (Line(points={{81,0},{81,0},{90,0},
          {90,-30},{38,-30}}, color={0,0,127}));
  connect(feedback.y, addAntiWindup.u2) annotation (Line(points={{30,-39},{30,-39},
          {30,-50},{-90,-50},{-90,-26},{-82,-26}}, color={0,0,127}));
  connect(add3.u2, zeroI.y) annotation (Line(points={{-2,0},{-20,0},{-20,-80},{-29,
          -80}}, color={0,0,127}));
  connect(yMax, limiter.limit1) annotation (Line(points={{-120,60},{-36,60},{48,
          60},{48,8},{58,8}}, color={0,0,127}));
  connect(add3.u3, feedForward) annotation (Line(points={{-2,-8},{-2,-8},{-10,-8},
          {-10,-80},{0,-80},{0,-120}}, color={0,0,127}));
  connect(yMin, limiter.limit2) annotation (Line(points={{-120,-60},{-32,-60},{48,
          -60},{48,-8},{58,-8}}, color={0,0,127}));
  connect(yMax, negate.u) annotation (Line(points={{-120,60},{-40,60},{40,60},{40,
          52.8}}, color={0,0,127}));
  connect(limiter.limit2, negate.y)
    annotation (Line(points={{58,-8},{40,-8},{40,43.6}}, color={0,0,127}));
  connect(limiter.limit1, constantUpperLimit.y)
    annotation (Line(points={{58,8},{48,8},{48,60},{59,60}}, color={0,0,127}));
  connect(limiter.limit2, constantLowerLimit.y) annotation (Line(points={{58,-8},
          {48,-8},{48,-60},{59,-60}}, color={0,0,127}));
  connect(limiter.limit2, zeroLowerLimit.y) annotation (Line(points={{58,-8},{48,
          -8},{48,-90},{59,-90}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
        Line(points={{-80,-80},{-80,-20},{60,80}},               color = {0,0,127}),
        Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
        Polygon(
          points={{90,-80},{68,-72},{68,-88},{90,-80}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{0,6},{60,-56}},
          lineColor={192,192,192},
          textString="PI")}),                                    Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
Proportional - Integral - controller with optional feed-foward and limitation at the output.
</p>
<p>
When the ouput is limited, the controller cannot bring the control error to zero and the integrator will not stop integrating. 
To avoid thie <b>WindUp</b> - effect, an <b>Anti-WindUp</b> loop is implemented: 
The difference between unlimited and limited output is fed back to the integrator's input.
</p>
<p>
The integral part can be switched off to obtain a limited P-controller.
</p>
</html>"));
end LimPI;
