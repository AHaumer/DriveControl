within DriveControl.Examples.DcDc;
model VoltageSupplied "Voltage supplied drive"
  extends Interfaces.PartialExampleIdealDcDc;
  Modelica.Blocks.Sources.Ramp referenceVoltage(             height=data.VNom,
    offset=0,
    startTime=0.1,
    duration=0.01)
    annotation (Placement(transformation(extent={{-70,-40},{-50,-20}})));
equation
  connect(referenceVoltage.y, driveBus.vRef) annotation (Line(points={{-49,-30},
          {0.05,-30},{0.05,0.05}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(                                initialScale=0.1)),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, initialScale=0.1)),
    experiment(Interval=0.0001),
    Documentation(info="<html>
<p>
See: <a href=\"modelica://DriveControl.UsersGuide.Drive\">User's guide, Machine and inverter</a>
</p>
</html>"));
end VoltageSupplied;
