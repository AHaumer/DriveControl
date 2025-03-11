within DriveControl.Examples.DcDc;
model PositionControlled "Position controlled drive"
  extends Interfaces.PartialExampleIdealDcDc(load(startTime=2,
    speedDependency=DriveControl.Types.SpeedDependency.Unidirectional));
  import Modelica.Units.Conversions.from_deg;
  Blocks.CurrentController currentController(data=data)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-60,0})));
  Blocks.SpeedController speedController(data=data, w0=referencePosition.vIni)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-60,30})));
  Blocks.PositionController positionController(data=data,
    phi0=referencePosition.yIni,
    kFF_Speed=0.5)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-60,60})));
  Blocks.P2p referencePosition(
    yEnd=from_deg(10*360),
    vMax=data.wMax,
    aMax=data.aMax)
    annotation (Placement(transformation(extent={{-70,-40},{-50,-20}})));
equation
  connect(currentController.driveBus, driveBus) annotation (Line(
      points={{-50,0},{-26,0},{0,0}},
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
  connect(referencePosition.y, driveBus.phiRef) annotation (Line(points={{-49,
          -30},{-24,-30},{0.05,-30},{0.05,0.05}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(                                initialScale=0.1)),
    Icon(coordinateSystem(                                initialScale=0.1)),
    experiment(StopTime=2.5, Interval=0.0001),
    Documentation(info="<html>
<p>
See: <a href=\"modelica://DriveControl.UsersGuide.PositionController\">User's guide, Position controller</a>
</p>
<p>
Additionally, you may try to set speed feed forward kFF_Speed of position controller to reduce dynamic control error.
</p>
</html>"));
end PositionControlled;
