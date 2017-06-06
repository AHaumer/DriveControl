within DriveControl.Interfaces;
partial block PartialController "Partial controller block"
  extends Modelica.Blocks.Icons.Block;
  parameter DataRecords.Data data
    annotation (Placement(transformation(extent={{-90,70},{-70,90}})));
  parameter Real kTune=1 "Tune proportional gain of controller"
    annotation(Dialog(group="Advanced"));
  parameter Boolean use_preFilter=true "Use reference pre-filter?"
    annotation(Dialog(group="Advanced"), choices(checkBox=true), Evaluate=true);
  Interfaces.DriveBus driveBus annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={100,0})));
  Modelica.Blocks.Nonlinear.Limiter referenceLimiter
    annotation (Placement(transformation(extent={{20,40},{0,60}})));
  Modelica.Blocks.Continuous.FirstOrder preFilter(
    final k=1,
    initType=Modelica.Blocks.Types.Init.InitialOutput) if use_preFilter
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Math.Feedback controlError
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Blocks.LimPI controller(
    initType=Modelica.Blocks.Types.Init.InitialState,
    kFF=1)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
protected
  Modelica.Blocks.Interfaces.RealInput u "Connector of Real input signal"
    annotation (Placement(transformation(extent={{-54,-4},{-46,4}})));
equation
  if not use_preFilter then
    connect(controlError.u1, u) annotation (Line(points={{2,0},{-10,0},{-10,-20},{
          -50,-20},{-50,0}}, color={0,0,127}));
  end if;
  connect(controlError.y, controller.u)
    annotation (Line(points={{19,0},{38,0}}, color={0,0,127}));
  connect(preFilter.y,controlError. u1)
    annotation (Line(points={{-19,0},{-19,0},{2,0}},    color={0,0,127}));
  connect(preFilter.u, u)
    annotation (Line(points={{-42,0},{-50,0}}, color={0,0,127}));

  annotation (                     Documentation(info="<html>
<p>
<p>
Partial model of a controller with commonly used control blocks, bus, data record and icon.
</p>
</html>"));
end PartialController;
