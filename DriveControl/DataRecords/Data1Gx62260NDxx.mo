within DriveControl.DataRecords;
record Data1Gx62260NDxx "1Gx6 226-0NDxx"
  extends DriveControl.DataRecords.Data(
    drive="1Gx6 226-0NDxx",
    fS=6*50,
    VNom=470,
    INom=406,
    Ra=0.074,
    La=1.91E-3,
    wNom=from_rpm(1420),
    Jr=2.2,
    PFric=3150,
    IMax=1.5*INom,
    VMax=3/pi*sqrt(2)*400);
  import Modelica.SIunits.Conversions.from_rpm;
  import Modelica.Constants.pi;
annotation(defaultComponentPrefixes="parameter",  defaultComponentName="data", preferredView="info", Documentation(info="<html>
<p>
Data for a real drive: Siemens 1Gx6 226-0NDxx, 2016-12-15 read from
<a href=\"http://w3app.siemens.com/mcms/infocenter/dokumentencenter/ld/Documentsu20Catalogs/dc-motor/da12-2008-de.pdf\">Siemens.de</a>.
</p>
</html>"));
end Data1Gx62260NDxx;
