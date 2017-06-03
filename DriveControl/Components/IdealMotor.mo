within DriveControl.Components;
model IdealMotor "Ideal DC motor"
  extends DriveControl.Interfaces.PartialMotor;
  Modelica.Electrical.Analog.Basic.Resistor ra(final R=data.Ra)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={50,30})));
  Modelica.Electrical.Analog.Basic.Inductor la(           i(fixed=true,
        start=0), L=data.La)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=0,
        origin={20,30})));
  Modelica.Electrical.Analog.Basic.EMF emf(final useSupport=true, k=data.kPhi)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(final J=data.Jr)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  connect(ra.n, la.p)
    annotation (Line(points={{40,30},{30,30}},       color={0,0,255}));
  connect(la.n, emf.p)
    annotation (Line(points={{10,30},{10,30},{10,20},{10,10}},
                                                       color={0,0,255}));
  connect(emf.flange, inertia.flange_a)
    annotation (Line(points={{20,0},{20,0},{40,0}}, color={0,0,0}));
  connect(ra.p, mot_p)
    annotation (Line(points={{60,30},{60,100},{60,100}}, color={0,0,255}));
  connect(internalSupport, emf.support)
    annotation (Line(points={{0,-80},{0,-80},{0,0}}, color={0,0,0}));
  connect(flange, inertia.flange_b)
    annotation (Line(points={{100,0},{80,0},{60,0}}, color={0,0,0}));
  connect(emf.n, mot_n) annotation (Line(points={{10,-10},{10,-10},{-10,-10},{
          -10,30},{-60,30},{-60,100}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>
Model of a DC motor, as explained in the <a href=\"modelica://DriveControl.UsersGuide.Drive\">user's guide, Machine and inverter</a>, 
consisting of armature resistance and inductance, induced voltage, torque calculation and rotor's inertia.
</p>
</html>"));
end IdealMotor;
