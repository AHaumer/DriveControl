within DriveControl.Interfaces;
partial model PartialExample "Partial example"
  extends Modelica.Icons.Example;
  replaceable parameter DataRecords.DataReal data
    annotation (Placement(transformation(extent={{50,22},{70,42}})));
  Components.Load load(
    JL=data.JL,
    tauN=data.tauL,
    wN=data.wL)
     annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={60,0})));
  Components.IdealMotor motor(
    data=data,
    phi(fixed=true, start=0),
    w(fixed=true, start=0))
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
protected
  Interfaces.DriveBus driveBus annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,0})));
public
  Components.IdealInverter inverter(data=data) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,30})));
  Components.IdealBattery battery(V0=data.VMax, Ri=0)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
equation
  connect(motor.flange, load.flange)
    annotation (Line(points={{40,0},{50,0}},        color={0,0,0}));
  connect(motor.driveBus, driveBus) annotation (Line(
      points={{20,0},{0,0}},
      color={255,204,51},
      thickness=0.5));
  connect(inverter.mot_p, motor.mot_p)
    annotation (Line(points={{10,36},{36,36},{36,10}}, color={0,0,255}));
  connect(inverter.mot_n, motor.mot_n) annotation (Line(points={{10,24},{10,24},
          {24,24},{24,10}}, color={0,0,255}));
  connect(inverter.driveBus, driveBus) annotation (Line(
      points={{0,20},{0,0}},
      color={255,204,51},
      thickness=0.5));
  connect(battery.bat_p, inverter.bat_p)
    annotation (Line(points={{-20,36},{-15,36},{-10,36}}, color={0,0,255}));
  connect(battery.bat_n, inverter.bat_n)
    annotation (Line(points={{-20,24},{-15,24},{-10,24}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(initialScale=0.1)),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, initialScale=0.1)),
    experiment(Interval=0.001),
    Documentation(info="<html>
<p>
Partial model; common components for all examples.
</p>
</html>"));
end PartialExample;
