within DriveControl.UsersGuide;
class CurrentController "Current controller"
  extends Modelica.Icons.Information;

  annotation (Documentation(info="<html>
<p>Considering the equations shown in <a href=\"modelica://DriveControl.UsersGuide.Drive\">User's Guide, Machine and inverter</a>, 
we can write the transfer function of the drive as:</p>
<p><img src=\"modelica://DriveControl/Resources/Images/CurrentController/101.png\">.</p>
<p>Note: To avoid influence of the current ripple on control, the measured current is filtered. 
The small time constants of the inverter and the smoothing filter are summed up: T<sub>&sigma;</sub>=T<sub>d;</sub>+T<sub>sI</sub></p>
<p>Choosing a PI-controller</p>
<p><img src=\"modelica://DriveControl/Resources/Images/CurrentController/102.png\">.</p>
<p>we get the transfer function of the open loop:</p>
<p><img src=\"modelica://DriveControl/Resources/Images/CurrentController/103.png\">.</p>
<p>Compensating the bigger time constant T<sub>a</sub>, i.e. <b>T<sub>i</sub>=T<sub>a</sub></b>, the transfer function of the closed loop gets:</p>
<p><img src=\"modelica://DriveControl/Resources/Images/CurrentController/104.png\">.</p>
<p>According to the absolute optimum, we check the absolute of this transfer function, trying to keep it = 1 for a wide frequency range:</p>
<p><img src=\"modelica://DriveControl/Resources/Images/CurrentController/105.png\"></p>
<p>Comparing the coefficients in numerator and denominator, we find:</p>
<ul>
<li>&omega;<sup>0</sup>: always fulfilled</li>
<li>&omega;<sup>2</sup>: allows to calculate optimal k<sub>p</sub></li>
<li>&omega;<sup>4</sup>: not possible to fulfill, results in limited bandwith of the controller</li>
</ul>
<p>The optimal proportional gain is found as <b>k<sub>p</sub> = R<sub>a</sub> T<sub>a</sub> / (2 T<sub>&sigma;</sub>)</b>.</p>
<p>The transfer function of the current controlled drive gets:<p>
<p><img src=\"modelica://DriveControl/Resources/Images/CurrentController/106.png\"></p>
<p>The numerator's zero can be compensated by a first order filter of the reference, resulting in:</p>
<p><img src=\"modelica://DriveControl/Resources/Images/CurrentController/107.png\"></p>
<p>The first order with substitute time constant <b>T<sub>sub</sub> = 2 T<sub>&sigma;<sub></b> is an approximation used for the design of the further controllers.</p>
<p>
<b>Note:</b> 
The induced voltage V<sub>i</sub> = k&phi; &omega; can be calculated from measured speed and acts like a disturbance. 
Therefore V<sub>i</sub> should be used as a feed-forward for the current controller. 
Furthermore, the voltage that can be applied to the drive is limited. 
Therefore we use a <br><a href=\"modelica://DriveControl.Blocks.LimPI\">limited PI controller with feed-forward and anti-windup</a>.
</p>
<p>
The example <a href=\"modelica://DriveControl.Examples.CurrentControlled\">CurrentControlled</a> 
applies a reference torque step to the torque controlled drive at stand still, the load torque is linearly dependent on speed. 
</p>
<p>
The current controller causes a constant armature current, that causes constant torque delivered by the machine. 
Speed will rise up to that point of operation, where that torque is in balance with the load torque. 
</p>
</html>"));
end CurrentController;
