within DriveControl.Components;
model IdealBattery "Ideal linear DC source"
  extends DriveControl.Interfaces.PartialBattery;
  Modelica.Electrical.Analog.Basic.Resistor ri(final R=data.Ri)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,40})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=data.Vdc0)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,0})));
equation
  connect(constantVoltage.p, ri.p)
    annotation (Line(points={{0,10},{0,16},{0,30},{-4.44089e-016,30}},
                                                       color={0,0,255}));
  connect(bat_n, constantVoltage.n) annotation (Line(points={{100,-60},{100,-60},
          {0,-60},{0,-10}}, color={0,0,255}));
  connect(ri.n, currentSensor.p) annotation (Line(points={{6.66134e-016,50},{0,
          50},{0,60},{40,60}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
The IdealBattery consists of a constant voltage source and an inner resistance.
</p>
</html>"));
end IdealBattery;
