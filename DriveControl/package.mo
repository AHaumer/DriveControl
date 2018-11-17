within ;
package DriveControl "Library to demonstrate control of electrical drives"















   annotation (uses(Modelica(version="3.2.2")), version="4.0.0", versionDate="2018-11-17",
    preferredView="info", Documentation(info="<html>
<p><a href=\"https://www.oth-regensburg.de/en/faculties/electrical-engineering-and-information-technology.html\"><img src=\"modelica://DriveControl/Resources/Images/OTH_EI.png\" align=\"middle\"></a> 
   <a href=\"http://www.edrives.eu/\"><img src=\"modelica://DriveControl/Resources/Images/EDrives.png\" align=\"middle\"></a></p>
<p>
This library demonstrates the <b>control of electric drives</b>.<br> 
It is an improved version used for the <a href=\"modelica://DriveControl/Resources/DriveControl2p.pdf\">tutorial</a> 
held at the <a href=\"https://modelica.org/events/modelica2017\">12<sup>th</sup> Modelica Conference 2017</a> in Prague.
</p>
</html>"),
  Icon(graphics={                      Rectangle(
              extent={{-60,60},{-90,-60}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={128,128,128}),
                                    Rectangle(
              extent={{-40,70},{40,50}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
                             Rectangle(
              extent={{-60,60},{60,-60}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={255,0,0}),    Rectangle(
              extent={{60,10},{100,-10}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={95,95,95}),         Polygon(
              points={{-70,-90},{-60,-90},{-30,-20},{30,-20},{60,-90},{70,
              -90},{70,-100},{-70,-100},{-70,-90}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}));
end DriveControl;
