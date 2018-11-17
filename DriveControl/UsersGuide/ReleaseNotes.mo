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
<h5>Version 3.0.0, 2017-06-03</h5>
<ul>
<li>Use Modelica.Blocks.Sources.KinematicP2P2 as reference position source</li>
</ul>
<h5>Version 3.1.0, 2017-06-06</h5>
<ul>
<li>Use own P2P as reference position source</li>
<li>Moved tuning factors of proportional gains of controllers from data record to controller</li>
</ul>
<h5>Version 4.0.0, 2018-11-17</h5>
<p>
<b>Note:</b> This is a non backward compatible enhancement of the library.
</p>
<ul>
<li>Renamed some sub-packages and models, preparing switching inverters with same partial model as ideal inverters</li>
<li>Removed smoothing from current controller, implemented smoothing of source and motor voltages and currents in partial inverter instead.</l>
<li>Changed naming of drive bus variables iBat, vBat to iSrc, vSrc preparing AC/DC inverters<li>
<li>Added source and motor voltages and currents averaged over one switching period to drive bus<li>
<li>Implemented DC smoothing inductor</li>
<li>Implemented optional friction losses</li>
<li>Implemented additional parameter records</li>
<li>Implemented parameter switching frequency of inverter, subsequently calculation of deadtime and smoothing time constant</li>
</ul>
</html>"));
end ReleaseNotes;
