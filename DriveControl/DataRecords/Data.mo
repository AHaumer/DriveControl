within DriveControl.DataRecords;
record Data "Data of the whole drive, including load and controller"
  extends Modelica.Icons.Record;
  import Modelica.Constants.inf;
  constant String drive="fictious";
  parameter Modelica.SIunits.Inertia Jtot=Jr + JL "Inertia machine + load"
    annotation(Dialog(enable=false));
  parameter Modelica.SIunits.Time Tm=Jtot*wNom/tauNom "Mechanical time constant"
    annotation(Dialog(enable=false));
  //Load
  parameter Modelica.SIunits.Inertia JL=0.05 "Inertia load"
    annotation(Dialog(group="Load"));
  parameter Modelica.SIunits.Torque tauL=tauNom "Load torque"
    annotation(Dialog(group="Load"));
  parameter Modelica.SIunits.AngularVelocity wL=wNom "Load speed"
    annotation(Dialog(group="Load"));
  //Inverter
  parameter Modelica.SIunits.Time Td=0.005 "Deadtime inverter"
    annotation(Dialog(group="Inverter"));
  //Machine
  parameter Modelica.SIunits.Voltage VNom=105 "Nominal voltage"
    annotation(Dialog(tab="Machine"));
  parameter Modelica.SIunits.Current INom=100 "Nominal current"
    annotation(Dialog(tab="Machine"));
  parameter Modelica.SIunits.Resistance Ra=0.05 "Armature resistance"
    annotation(Dialog(tab="Machine"));
  parameter Modelica.SIunits.Inductance La=0.001 "Armature inductance"
    annotation(Dialog(tab="Machine"));
  parameter Modelica.SIunits.Time Ta=La/Ra "Armature time constant"
    annotation(Dialog(tab="Machine", enable=false));
  parameter Modelica.SIunits.MagneticFlux kPhi=(VNom - Ra*INom)/wNom "Flux constant"
    annotation(Dialog(tab="Machine", enable=false));
  parameter Modelica.SIunits.Torque tauNom=kPhi*INom "Nominal torque"
    annotation(Dialog(tab="Machine", enable=false));
  parameter Modelica.SIunits.AngularVelocity wNom=100 "Nominal speed"
    annotation(Dialog(tab="Machine"));
  parameter Modelica.SIunits.Inertia Jr=0.05 "Inertia of machine rotor"
    annotation(Dialog(tab="Machine"));
  //Limits
  parameter Modelica.SIunits.Voltage VMax=kPhi*wMax + Ra*IMax "Maximum voltage >= kPhi*wMax + Ra*IMax"
    annotation(Dialog(tab="Limits", group="Limits"));
  parameter Modelica.SIunits.Current IMax=1.2*INom "Maximum current <= (VMax - kPhi*wMax)/Ra"
    annotation(Dialog(tab="Limits", group="Limits"));
  parameter Modelica.SIunits.Torque tauMax=kPhi*IMax "Maximum torque"
    annotation(Dialog(tab="Limits", group="Limits", enable=false));
  parameter Modelica.SIunits.AngularAcceleration aMax=tauMax/Jtot "Maximum acceleration"
    annotation(Dialog(tab="Limits", group="Limits", enable=false));
  parameter Modelica.SIunits.AngularVelocity wMax=wNom "Maximum speed <= (VMax - Ra*IMax)/kPhi"
    annotation(Dialog(tab="Limits", group="Limits"));
  parameter Modelica.SIunits.Angle phiMax= inf "Maximum position"
    annotation(Dialog(tab="Limits", group="Limits"));
  parameter Modelica.SIunits.Angle phiMin=-inf "Minimum position"
    annotation(Dialog(tab="Limits", group="Limits"));
  //Current controller: absolute optimum
  parameter Real kTuneI=1 "Tune gain current controller"
    annotation(Dialog(tab="Controller", group="Current controller"));
  parameter Modelica.SIunits.Resistance kpI=kTuneI*Ra*Ta/(2*Ts) "Propotional gain current controller"
    annotation(Dialog(tab="Controller", group="Current controller"));
  parameter Modelica.SIunits.Time TiI=Ta "Integral time constant current controller"
    annotation(Dialog(tab="Controller", group="Current controller"));
  parameter Modelica.SIunits.Time Ts=Td + TsI "Sum of small time constants"
    annotation(Dialog(tab="Controller", group="Current controller", enable=false));
  parameter Modelica.SIunits.Time TsI=Td "Smoothing time constant current controller"
    annotation(Dialog(tab="Controller", group="Current controller"));
  parameter Modelica.SIunits.Time TfI=TsI "Prefilter current controller"
    annotation(Dialog(tab="Controller", group="Current controller"));
  parameter Modelica.SIunits.Time Tsub=2*Ts "Substitute time constant current controlled drive"
    annotation(Dialog(tab="Controller", group="Current controller", enable=false));
  //Speed controller: symmetrical optimum
  parameter Real a=2 "Symmetrical optimum"
    annotation(Dialog(tab="Controller", group="Speed controller"));
  parameter Real kTuneW=1 "Tune gain current controller"
    annotation(Dialog(tab="Controller", group="Speed controller"));
  parameter Modelica.SIunits.Inertia kpW=kTuneW*tauNom/wNom*Tm/(a*Tsub) "Propotional gain speed controller"
    annotation(Dialog(tab="Controller", group="Speed controller"));
  parameter Modelica.SIunits.Time TiW=a^2*Tsub "Integral time constant speed controller"
    annotation(Dialog(tab="Controller", group="Speed controller"));
  parameter Modelica.SIunits.Time TfW=TiW "Prefilter speed controller"
    annotation(Dialog(tab="Controller", group="Speed controller"));
  //Position controller
  parameter Real kTuneP=1.2 "Tune gain position controller"
    annotation(Dialog(tab="Controller", group="Position controller"));
  parameter Modelica.SIunits.DampingCoefficient kpP=kTuneP/(16*Tsub) "Propotional gain position controller"
    annotation(Dialog(tab="Controller", group="Position controller"));
annotation(defaultComponentPrefixes="parameter", defaultComponentName="data", Icon(graphics={   Text(
          extent={{-100,-14},{100,-36}},
          lineColor={28,108,200},
          textString="%drive")}),
    preferredView="info", Documentation(info="<html>
<p>
Data record, summarizing all parameters of:
<ul>
<li>the machine</li>
<li>the inverter</li>
<li>the mechanical load</li>
<li>the limitations</li>
<li>the current controller</li>
<li>the speed controller</li>
<li>the position controller</li>
</ul>
Parameters calculated unambiguously from previously given parameters are disabled for input, just shown.
</p>
</html>"));
end Data;
