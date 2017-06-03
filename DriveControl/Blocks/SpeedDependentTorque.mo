within DriveControl.Blocks;
block SpeedDependentTorque "Load torque dependent on speed"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter DriveControl.Types.SpeedDependency speedDependency=DriveControl.Types.SpeedDependency.Linear "Speed dependency of torque";
  parameter Modelica.SIunits.Torque tauN "Nominal torque at nominal speed";
  parameter Modelica.SIunits.AngularVelocity wN(displayUnit="rpm")=1 "Nominal speed"
    annotation(Dialog(enable=(speedDependency==DriveControl.Types.SpeedDependency.Linear or speedDependency==DriveControl.Types.SpeedDependency.Quadratic)));
  parameter Modelica.SIunits.AngularVelocity w0(displayUnit="rpm")=1e-3 "Minimum speed for regularization"
    annotation(Dialog(enable=speedDependency==DriveControl.Types.SpeedDependency.Constant, tab="Advanced"));
  parameter Modelica.SIunits.Time startTime=0 "Start time";
equation
  y = (if time<startTime then 0 else 1)*tauN*(
    if speedDependency==DriveControl.Types.SpeedDependency.Quadratic then smooth(1, if u>=0 then (u/wN)^2 else -(u/wN)^2)
    elseif speedDependency==DriveControl.Types.SpeedDependency.Linear then u/wN
    elseif speedDependency==DriveControl.Types.SpeedDependency.Constant then (if abs(u)>=w0 then sign(u) else (u/w0))
    else 1);
  annotation (                     Documentation(info="<html>
<p>
Model of a speed dependent load torque. It is zero for time &lt; startTime, i.e. it can be switched on at startTime producing a torque step. 
</p>
<p>
Speed dependency of torque can be choosen from:
</p>
<ul>
<li>Unidirectional ... same direction of constant torque in both directions of rotation</li>
<li>Constant ... constant torque with linear regularization around zero speed</li>
<li>Linear ... linearly speed dependent torque</li>
<li>Quadratic ... quadratic speed dependent torque</li>
</ul>
</html>"), Icon(graphics={
        Text(
          extent={{-100,-30},{100,-50}},
          lineColor={28,108,200},
          textString="start: %startTime")}));
end SpeedDependentTorque;
