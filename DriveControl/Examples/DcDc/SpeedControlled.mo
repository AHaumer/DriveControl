within DriveControl.Examples.DcDc;
model SpeedControlled "Speed controlled drive"
  extends Interfaces.PartialExampleIdealDcDc(load(startTime=0.7));
  Blocks.CurrentController currentController(data=data)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-60,0})));
  Blocks.SpeedController speedController(data=data, w0=referenceSpeed.offset)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-60,30})));
  Modelica.Blocks.Sources.Step referenceSpeed(
    height=data.wNom,
    offset=0,
    startTime=0.1)
    annotation (Placement(transformation(extent={{-70,-40},{-50,-20}})));
equation
  connect(referenceSpeed.y, driveBus.wRef) annotation (Line(points={{-49,-30},{
          0.05,-30},{0.05,0.05}}, color={0,0,127}));
  connect(currentController.driveBus, driveBus) annotation (Line(
      points={{-50,0},{0,0}},
      color={255,204,51},
      thickness=0.5));
  connect(speedController.driveBus, driveBus) annotation (Line(
      points={{-50,30},{-40,30},{-40,0},{0,0}},
      color={255,204,51},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(                                initialScale=0.1)),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, initialScale=0.1)),
    experiment(Interval=0.0001),
    Documentation(info="<html>
<p>
See: <a href=\"modelica://DriveControl.UsersGuide.SpeedController\">User's guide, Speed controller</a>
</p>
</html>"));
end SpeedControlled;
