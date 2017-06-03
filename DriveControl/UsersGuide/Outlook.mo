within DriveControl.UsersGuide;
class Outlook "Outlook"
  extends Modelica.Icons.Information;

  annotation (Documentation(info="<html>
<p>
The control of rotatory field machines (induction machine with squirrel cage rotor, permanent magnet synchronous machine, synchonous reluctance machine) may follow the same principles, 
if we use <a href=\"http://www.haumer.at/refimg/SpacePhasors.pdf\">space phasors</a>.
The components of the current space phasor in a coordinate system aligned with the rotating magnetic field are d- and q-component:
<ul>
<li><b>d</b>irect axis aligned with the magentic field: The d-axis current controls the magnetic field.</li>
<li><b>q</b>uadrature axis perpendicular to the magnetic field: The q-axis current controls the torque; this is the same as the armature current.</li>
</ul>
</p>
<p>
Additional necessary prerequisites:
<ul>
<li>Determining the amplitude and the position of the magnetic field, 
    i.e. a position encoder for synchronous machines and a field model for induction machines.</li>
<li>A strategy for determing the reference magnetizing current, especially in the field weakening region, 
    and a d-axis current contoller following the same principles as the q-axis currrent controller.
</ul>
</p>
</html>"));
end Outlook;
