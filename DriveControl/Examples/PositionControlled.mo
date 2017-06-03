within DriveControl.Examples;
model PositionControlled "Position controlled drive"
  extends Interfaces.PartialExample(load(startTime=2, speedDependency=
          DriveControl.Types.SpeedDependency.Unidirectional));
  import Modelica.SIunits.Conversions.from_deg;
  Blocks.CurrentController currentController(data=data)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-60,0})));
  Blocks.SpeedController speedController(data=data)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-60,30})));
  Blocks.PositionController positionController(data=data)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-60,60})));
  Modelica.Blocks.Sources.KinematicPTP2
                               referencePosition(
    startTime=0.1,
    q_end={from_deg(10*360)},
    qd_max={data.wMax},
    qdd_max={data.aMax})
    annotation (Placement(transformation(extent={{-70,-40},{-50,-20}})));
equation
  connect(currentController.driveBus, driveBus) annotation (Line(
      points={{-50,0},{0,0}},
      color={255,204,51},
      thickness=0.5));
  connect(speedController.driveBus, driveBus) annotation (Line(
      points={{-50,30},{-40,30},{-40,0},{0,0}},
      color={255,204,51},
      thickness=0.5));
  connect(positionController.driveBus, driveBus) annotation (Line(
      points={{-50,60},{-40,60},{-40,0},{0,0}},
      color={255,204,51},
      thickness=0.5));
  connect(referencePosition.q[1], driveBus.phiRef) annotation (Line(points={{
          -49,-22},{-24,-22},{0.05,-22},{0.05,0.05}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(                                initialScale=0.1)),
    Icon(coordinateSystem(                                initialScale=0.1)),
    experiment(StopTime=2.5, Interval=0.001),
    Documentation(info="<html>
<p>
See: <a href=\"modelica://DriveControl.UsersGuide.PositionController\">User's guide, Position controller</a>
</p>
</html>"));
end PositionControlled;
