within DriveControl.Components;
model DcDcHbridge "DC/DC H-bridge"
  extends DriveControl.Interfaces.PartialDcDcInverter;
  Modelica.Electrical.PowerConverters.DCDC.HBridge hBridge
    annotation (Placement(transformation(extent={{-10,40},{10,60}})));
  Modelica.Electrical.PowerConverters.DCDC.Control.SignalPWM signalPWM(
      useConstantDutyCycle=false, f=data.fS)
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Modelica.Electrical.PowerConverters.DCDC.Control.VoltageToDutyCycle
    voltageToDutyCycle(vMax=data.VMax) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-20})));
equation
  connect(hBridge.fire_p, signalPWM.fire)
    annotation (Line(points={{-6,38},{-6,31}}, color={255,0,255}));
  connect(hBridge.fire_n, signalPWM.notFire)
    annotation (Line(points={{6,38},{6,31}}, color={255,0,255}));
  connect(src_p, hBridge.dc_p1) annotation (Line(points={{-100,60},{-20,60},{
          -20,56},{-10,56}}, color={0,0,255}));
  connect(hBridge.dc_p2, mot_p) annotation (Line(points={{10,56},{20,56},{20,60},
          {100,60}}, color={0,0,255}));
  connect(hBridge.dc_n1, currentSrc.p) annotation (Line(points={{-10,44},{-20,
          44},{-20,40},{-50,40},{-50,-40}}, color={0,0,255}));
  connect(voltageToDutyCycle.dutyCycle, signalPWM.dutyCycle) annotation (Line(
        points={{0,-9},{0,0},{-20,0},{-20,20},{-12,20}},      color={0,0,127}));
  connect(voltageToDutyCycle.v, driveBus.vRef) annotation (Line(points={{0,-32},
          {0,-99.9},{0.1,-99.9}},         color={0,0,127}));
  connect(hBridge.dc_n2, ldc.n) annotation (Line(points={{10,44},{20,44},{20,40},
          {50,40},{50,0}}, color={0,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-100,130},{100,100}},
          lineColor={28,108,200},
          textString="%name"),
        Line(
          points={{-20,30},{-20,-30}},
          color={255,0,128}),
        Line(
          points={{-20,0},{20,0}},
          color={255,0,128}),
        Line(
          points={{20,30},{20,-30}},
          color={255,0,128})}),
                              Diagram(coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>
The H-bridge consists of 4 powerelectronic switches, e.g. MosFets.
</p>
</html>"));
end DcDcHbridge;
