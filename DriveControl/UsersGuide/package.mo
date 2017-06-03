within DriveControl;
package UsersGuide "User's Guide"
   extends Modelica.Icons.Information;









   annotation (DocumentationClass=true, Documentation(info="<html>
<p>
The structure and parameterization of <b>cascaded controller</b> for electric drives are explained, 
for simplicity reasons using a <a href=\"modelica://DriveControl.UsersGuide.Drive\">permanent magnet DC machine</a>.
</p>
<p>
In a cascaded control structure, the control loops are designed and put into operation, 
starting with the innermost <a href=\"modelica://DriveControl.UsersGuide.CurrentController\">current contoller</a>, 
followed by the (optional) <a href=\"modelica://DriveControl.UsersGuide.SpeedController\">speed contoller</a>, 
and on top the (optional) <a href=\"modelica://DriveControl.UsersGuide.PositionController\">position contoller</a>. 
</p>
<p>
In general we have to bear in mind that control states need an appropriate control reserve exceeding nominal values for short time control operations, especially:
<ul>
<li>armature voltage: maximum &gt; nominal</li>
<li>armature current: maximum &gt; nominal resp. permanent thermal admissible</li>
</ul>
</p>
<p>
The concepts are demonstrated in the <a href=\"modelica://DriveControl.Examples\">examples</a>.
</p>
<p>
Parameters are collected and computed in a <a href=\"modelica://DriveControl.DataRecords\">data record</a>. 
To try another drive i.e. another set of parameters, just replace the <i>data</i> record instance in the example by another data record. <br>
<b>Note:</b> The controller parameters are calculated in the data record, and therfore updated automatcally.
</p>
<p>
To avoid lots of signal connections between the controllers, a <a href=\"modelica://DriveControl.Interfaces.DriveBus\">drive bus</a> is used. 
This is an expandable connector. One signal may be written only by one source, by can be read by any component. 
Signals not accessed in a model are removed from the bus. 
</p>
</html>"));
end UsersGuide;
