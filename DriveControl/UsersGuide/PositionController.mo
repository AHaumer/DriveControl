within DriveControl.UsersGuide;
class PositionController "Position controller"
  extends Modelica.Icons.Information;

  annotation (Documentation(info="<html>
<p>Simplifying the transfer function of the <a href=\"modelica://DriveControl.UsersGuide.SpeedController\">speed controlled drive</a>, 
multiplied by the integrator &phi; = &omega; / s, we start with:</p>
<p><img src=\"modelica://DriveControl/Resources/Images/PositionController/301.png\"></p>
<p>Since the drive has integral behaviour, we choose a simple proportioanl controller:</p>
<p><img src=\"modelica://DriveControl/Resources/Images/PositionController/302.png\"></p>
<p>resulting in a transfer function of the closed loop:<p>
<p><img src=\"modelica://DriveControl/Resources/Images/PositionController/303.png\"></p>
<p>We see second order behaviour with a time constant<p>
<p><img src=\"modelica://DriveControl/Resources/Images/PositionController/304.png\"></p>
<p>To avoid overshot of the end position, we demand damping &theta;&gt;1, getting an upper boundary for the proportional gain of the position controller:<p>
<p><img src=\"modelica://DriveControl/Resources/Images/PositionController/305.png\"></p>
<b>Note:</b> 
Since we simplified the transfer function of the speed controlled drive, we have to adapt the proportional gain k<sub>p</sub> of the position controller, 
using the parameter k<sub>Tune</sub>&lt;1 in the <a href=\"modelica://DriveControl.DataRecords.Data\">data record</a>, to avoid overshot of the end position. 
Since maximum speed and maximum acceleration (defined by maximum torque) are limited, a <a href=\"modelica://DriveControl.Blocks.Ptp\">point-to-point source block</a> 
can be used to calculate an optmal reference trajectory.
</p>
<p>
The example <a href=\"modelica://DriveControl.Examples.PositionControlled\">PositionControlled</a>
applies a reference position trajectory to the position controlled drive at stand still, 
the load torque is linearly dependent on speed switched on after no-load positioning to demonstrate the effect of a disturbance.
</p>
<p>
The position controller demands reference speed in order to follow the reference position trajectory. 
With optimal controller parameterization, the desired end position at the end of the reference trajectory is met without overshot.  
</p>
</html>"));
end PositionController;
