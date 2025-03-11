within DriveControl.Interfaces;
expandable connector DriveBus "Signal bus"
  extends Modelica.Icons.SignalBus;
  Modelica.Units.SI.Angle phiRef(displayUnit="deg") "Reference position";
  Modelica.Units.SI.Angle phiRefLim(displayUnit="deg")
    "Limited reference position";
  Modelica.Units.SI.Angle phiAct(displayUnit="deg") "Actual position";
  Modelica.Units.SI.AngularVelocity wRef(displayUnit="rpm") "Reference speed";
  Modelica.Units.SI.AngularVelocity wRefLim(displayUnit="rpm")
    "Limited reference speed";
  Modelica.Units.SI.AngularVelocity wAct(displayUnit="rpm") "Actual speed";
  Modelica.Units.SI.Torque tauRef "Reference torque";
  Modelica.Units.SI.Torque tauRefLim "Limited reference torque";
  Modelica.Units.SI.Current iRef "Reference current";
  Modelica.Units.SI.Current iAct "Actual current (filtered)";
  Modelica.Units.SI.Current iActAv "Actual current (average)";
  Modelica.Units.SI.Voltage vRef "Reference voltage";
  Modelica.Units.SI.Voltage vAct "Actual voltage (filtered)";
  Modelica.Units.SI.Voltage vActAv "Actual voltage (average)";
  Modelica.Units.SI.Current iSrc "Source current (filtered)";
  Modelica.Units.SI.Current iSrcAv "Source current (average)";
  Modelica.Units.SI.Voltage vSrc "Source voltage (filtered)";
  Modelica.Units.SI.Voltage vSrcAv "Source voltage (average)";
  annotation (preferredView="info", Documentation(info="<html>
<p>
Signal bus (i.e. an expandable connector) summarizing the values communicated between components. 
</p>
<p>
A signal may be written by only one component, but read by all components. 
</p>
<p>
Note: Predefined signals are removed if they are not accessed by any component. 
</p>
</html>"));
end DriveBus;
