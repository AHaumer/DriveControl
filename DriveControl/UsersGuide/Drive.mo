within DriveControl.UsersGuide;
class Drive "Machine and inverter"
  extends Modelica.Icons.Information;

  annotation (Documentation(info="<html>
<p>
The equations of a <b>permanent magnet DC machine</b> read as follows (Laplace operator s denotes differentiation with respect to time):
<pre>
Armature voltage loop    : V<sub>A</sub> - V<sub>i</sub> = R<sub>A</sub>(1 + s T<sub>A</sub>)I<sub>A</sub>
Armature time constant   : T<sub>A</sub> = L<sub>A</sub> / R<sub>A</sub>
Induced voltage          : V<sub>i</sub> = k&Phi; &omega;
Flux constant            : k&Phi; = (V<sub>A,Nom</sub> - R<sub>A</sub>I<sub>A,Nom</sub>) / &omega;<sub>Nom</sub>
Torque                   : &tau; = k&Phi; I<sub>A</sub>
Equation of motion       : s J<sub>tot</sub> &omega; = &tau; - &tau;<sub>Load</sub>
Moment of inertia        : J<sub>tot</sub> = J<sub>r</sub> + J<sub>Load</sub>
Mechanical time constant : T<sub>m</sub> = J<sub>total</sub> &omega;<sub>Nom</sub> / &tau;<sub>Nom</sub>
Position                 : s &phi; = &omega;
</pre>
</p>
<p>
The <b>inverter</b> applies the reference voltage to the machine, but normally we have to take a dead time into account. 
The inverter's dead time is approximated by a first order block with time constant = dead time <b>T<sub>d</sub></b>.
</p>
<p>
The example <a href=\"modelica://DriveControl.Examples.VoltageSupplied\">VoltageSupplied</a>
applies a step voltage to the machine at stand still, the load torque is linearly dependent on speed. 
</p>
<p>
Speed will rise up to that point of operation, where the difference between armature voltage and induced voltage 
drives an armature current which causes a torque that is in balance with the load torque at that speed.
</p>
</html>"));
end Drive;
