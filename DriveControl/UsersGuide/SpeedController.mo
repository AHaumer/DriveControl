within DriveControl.UsersGuide;
class SpeedController "Speed controller"
  extends Modelica.Icons.Information;

  annotation (Documentation(info="<html>
<p>The speed controller acts on the <a href=\"modelica://DriveControl.UsersGuide.CurrentController\">current control drive</a>, 
multiplied by the <a href=\"modelica://DriveControl.UsersGuide.Drive\">equation of motion</a>:</p>
<p><img src=\"modelica://DriveControl/Resources/Images/SpeedController/201.png\"></p>
<p>Choosing a PI-controller</p>
<p><img src=\"modelica://DriveControl/Resources/Images/SpeedController/202.png\"></p>
<p>we obtain the transfer function of the open loop:</p>
<p><img src=\"modelica://DriveControl/Resources/Images/SpeedController/203.png\"></p>
<p>Since load torque acts as a disturbance, a controller setting robust against disturbances is choosen, i.e. the symmetrical optimum. 
The naming \"symmetrical optimum\" indicates that the phase response is symmetrical with respect to the gain crossover frequency:</p>
<p><img src=\"modelica://DriveControl/Resources/Images/SpeedController/204.png\"></p>
<p>Caculating the phase at the gain crossover frequency and maximizing the phase reserve to stability margin, 
the gain crossover frequency is the geometric mean of T<sub>i</sub> and T<sub>sub</sub>:</p>
<p><img src=\"modelica://DriveControl/Resources/Images/SpeedController/205.png\"></p>
<p><img src=\"modelica://DriveControl/Resources/Images/SpeedController/206.png\"></p>
<p>Choosing a parameter a = 2, according to [Schroeder09] resulting in a transfer function = 1 over a wide frequency range, we obtain the integral time constant:</p>
<p><img src=\"modelica://DriveControl/Resources/Images/SpeedController/207.png\"></p>
<p>The proportional gain we get from:</p>
<p><img src=\"modelica://DriveControl/Resources/Images/SpeedController/208.png\"></p>
<p>This results in a transfer function of the closed loop with a numerator zero:</p>
<p><img src=\"modelica://DriveControl/Resources/Images/SpeedController/209.png\"></p>
<p>To avoid the resulting large overshot, it is possible to compensate the numerator's zero with a prefilter:<p>
<p><img src=\"modelica://DriveControl/Resources/Images/SpeedController/210.png\"></p>
<p>The transfer function of the speed controlled drive gets:</p>
<p><img src=\"modelica://DriveControl/Resources/Images/SpeedController/211.png\"></p>
<b>Note:</b> 
The load torque acts as a disturbance, but cannot be compensated by a feed-forward.  
The speed that can be demanded to the drive is limited. 
Therefore we use a <br><a href=\"modelica://DriveControl.Blocks.LimPI\">limited PI controller with feed-forward = 0 and anti-windup</a>. 
Since maximum acceleration (defined by maximum torque) is limited, a <a href=\"modelica://DriveControl.Blocks.SlewRateLimiter\">SlewRateLimiter block</a> 
can be used to limit torque.
</p>
<p>
The example <a href=\"modelica://DriveControl.Examples.SpeedControlled\">SpeedControlled</a>
applies a reference speed step (which is unphysical!) to the speed controlled drive at stand still, 
the load torque is linearly dependent on speed switched on after no-load start to demonstrate the effect of a disturbance. 
</p>
<p>
The speed controller demands a limited machine torque accelerating the drive (including the load) until the reference speed is met. 
When a load torque step is applied, speed drops and the speed controller reacts on that change with a change in the reference torque restoring reference speed.   
</p>
</html>"));
end SpeedController;
