within DriveControl.Types;
type SpeedDependency = enumeration(
    Unidirectional "Unidirectional constant torque",
    Constant "Constant torque",
    Linear "Linear speed dependent torque",
    Quadratic "Quadratic speed dependent torque")
  "Speed dependency of load torque";
