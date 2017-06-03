within DriveControl.UsersGuide;
class ReleaseNotes "Release notes"
extends Modelica.Icons.ReleaseNotes;

annotation (Documentation(info="<html>
<h5>Version 2.4.0, 2017-04-30</h5>
<ul>
<li>Improved version for Modelica Conference</li>
</ul>
<h5>Version 2.5.0, 2017-05-08</h5>
<ul>
<li>Limitations internally implemented in the controllers</li>
</ul>
<h5>Version 2.7.0, 2017-05-09</h5>
<ul>
<li>Separate motor and inverter + battery model</li>
</ul>
<h5>Version 2.9.0, 2017-05-19</h5>
<ul>
<li>Load torque: choose from Unidirectional / Constant (with regularization around 0) / Linear / Quadratic</li>
<li>Partial models to easen implementation of advanced models of battery, inverter, motor, controller.</li>
<li>Use the same LimPI block in each controller (position contoller with integral part switched off)</li>
<li>Factor kTune for tuning proportional gain of controllers</li>
<li>Optional switch off the reference pre-filters</li>
<li>Optional feed-forward of speed and acceleration</li>
</ul>
<h5>Version 2.9.5, 2017-05-19</h5>
<ul>
<li>Measurement of battery voltage and current</li>
<li>Improvement of LimPI block with variable limits</li>
<li>Output of current controller limited by variable battery voltage</li>
</ul>
<h5>To Do, 2017-05-19</h5>
<ul>
<li>Clean implementation of Der2Limiter</li>
</ul>
</html>"));
end ReleaseNotes;
