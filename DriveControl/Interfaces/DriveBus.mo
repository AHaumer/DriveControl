within DriveControl.Interfaces;
expandable connector DriveBus "Signal bus"
  extends Modelica.Icons.SignalBus;
  Modelica.SIunits.Angle phiRef(displayUnit="deg") "Reference position";
  Modelica.SIunits.Angle phiRefLim(displayUnit="deg") "Limited reference position";
  Modelica.SIunits.Angle phiAct(displayUnit="deg") "Actual position";
  Modelica.SIunits.AngularVelocity wRef(displayUnit="rpm") "Reference speed";
  Modelica.SIunits.AngularVelocity wRefLim(displayUnit="rpm") "Limited reference speed";
  Modelica.SIunits.AngularVelocity wAct(displayUnit="rpm") "Actual speed";
  Modelica.SIunits.Torque tauRef "Reference torque";
  Modelica.SIunits.Torque tauRefLim "Limited reference torque";
  Modelica.SIunits.Current iRef "Reference current";
  Modelica.SIunits.Current iAct "Actual current";
  Modelica.SIunits.Voltage vRef "Reference voltage";
  Modelica.SIunits.Voltage vAct "Actual voltage";
  Modelica.SIunits.Current iBat "Battery current";
  Modelica.SIunits.Voltage vBat "Battery voltage";
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
