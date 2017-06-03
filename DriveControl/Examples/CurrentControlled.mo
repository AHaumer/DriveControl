within DriveControl.Examples;
model CurrentControlled "Current controlled drive"
  extends Interfaces.PartialExample;
  Blocks.CurrentController currentController(data=data, kFF_InducedVoltage=1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-60,0})));
  Modelica.Blocks.Sources.Step referenceTorque(             height=data.tauNom,
    offset=0,
    startTime=0.1)
    annotation (Placement(transformation(extent={{-70,-40},{-50,-20}})));
equation
  connect(referenceTorque.y, driveBus.tauRef) annotation (Line(points={{-49,-30},
          {0.05,-30},{0.05,0.05}},   color={0,0,127}));
  connect(currentController.driveBus, driveBus) annotation (Line(
      points={{-50,0},{-50,0},{0,0}},
      color={255,204,51},
      thickness=0.5));
  annotation (
    Diagram(coordinateSystem(                                initialScale=0.1)),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, initialScale=0.1)),
    experiment(Interval=0.001),
    Documentation(info="<html>
<p>
See: <a href=\"modelica://DriveControl.UsersGuide.CurrentController\">User's guide, Current controller</a>
</p>
</html>"));
end CurrentControlled;
