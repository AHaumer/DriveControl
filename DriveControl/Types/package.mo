within DriveControl;
package Types "Type definitions"
extends Modelica.Icons.TypesPackage;


  type Limitation = enumeration(
    Constant   "Constant upper and lower limit",
    Unidirectional   "Variable upper limit, lower limit = 0",
    Symmetrical   "Variable upper limit = - lower limit",
    Variable   "Variable limits")
    "Speed dependency of load torque";

  annotation (Documentation(info="<html>
<p>
Just a collection of type defintions used in this library.
</p>
</html>"));
end Types;
