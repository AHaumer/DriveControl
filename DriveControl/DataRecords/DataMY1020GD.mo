within DriveControl.DataRecords;
record DataMY1020GD "Unite MY1020GD"
  extends DriveControl.DataRecords.Data(
    drive="MY1020GD",
    fS=1000,
    VNom=36,
    INom=18,
    Ra=1/3,
    La=1/300,
    wNom=from_rpm(2500),
    Jr=0.0005,
    PFric=40,
    IMax=1.5*INom,
    VMax=42);
  import Modelica.SIunits.Conversions.from_rpm;
  import Modelica.Constants.pi;
annotation(defaultComponentPrefixes="parameter",  defaultComponentName="data", preferredView="info", Documentation(info="<html>
<p>
Data for a real drive: Unite MY1020GD.
</p>
</html>"));
end DataMY1020GD;
