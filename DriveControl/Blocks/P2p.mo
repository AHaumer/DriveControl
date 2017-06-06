within DriveControl.Blocks;
block P2p "Movement point-to-point"
  extends Modelica.Blocks.Interfaces.SO;
  import Modelica.Constants.small;
  output Real v "Velocity";
  output Real a "Acceleration";
  Modelica.Blocks.Interfaces.BooleanOutput moving annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-110})));
  parameter Modelica.SIunits.Time t0=0 "Movement starts t0 after start of simulation";
  parameter Real yIni=0 "Initial position (at start of simulation)";
  parameter Real yEnd "Desired end position";
  parameter Real vIni(final min=vMin, final max=vMax)=0 "Initial speed [vMin..vMax] 1/s";
  parameter Real vEnd(final min=vMin, final max=vMax)=0 "Desired end speed [vMin..vMax] 1/s";
  parameter Real vMax(min= small) "Maximum positive velocity [+small..+vMax) 1/s";
  parameter Real vMin(max=-small)=-vMax "Maximum negative velocity ( vMin..-small] 1/s";
  parameter Real aMax(min= small) "Maximum positive acceleration [+small..+inf) 1/s2";
  parameter Real aMin(max=-small)=-aMax "Maximum negative acceleration (-inf..-small] 1/s2";
protected
  parameter Modelica.SIunits.Time tS(fixed=false) "Start time of simulation";
  parameter Modelica.SIunits.Time tA(fixed=false) "Time span of accelecration";
  parameter Modelica.SIunits.Time tC(fixed=false) "Time span of constant speed";
  parameter Modelica.SIunits.Time tD(fixed=false) "Time span of deceleration";
  parameter Real y0 = yIni + vIni*t0 "Position when movement starts";
  parameter Real vLim(fixed=false) "Speed limit depending on direction of movement";
  parameter Real aA = if yEnd>y0 then aMax elseif yEnd<y0 then aMin else 0 "Acceleration";
  parameter Real aD = if yEnd>y0 then aMin elseif yEnd<y0 then aMax else 0 "Deceleration";

initial equation
  tS = time;
  y = yIni;
  if yEnd - y0 >= (vMax^2 - vIni^2)/(2*aMax) + (vEnd^2 - vMax^2)/(2*aMin) then
    vLim = vMax;
    tA = (vLim - vIni)/aMax;
    tC = (yEnd - y0 - (vLim^2 - vIni^2)/(2*aMax) - (vEnd^2 - vLim^2)/(2*aMin))/vLim;
    tD = (vEnd - vLim)/aMin;
  elseif yEnd - y0 >= 0 then
    vLim = sqrt((yEnd - y0 + vIni^2/(2*aMax) - vEnd^2/(2*aMin))*2*(aMin - aMax)/(aMin*aMax));
    tA = (vLim - vIni)/aMax;
    tC = 0;
    tD = (vEnd - vLim)/aMin;
  elseif yEnd - y0 >= (vMin^2 - vIni^2)/(2*aMin) + (vEnd^2 - vMin^2)/(2*aMax) then
    vLim = sqrt((yEnd - y0 + vIni^2/(2*aMin) - vEnd^2/(2*aMax))*2*(aMin - aMax)/(aMin*aMax));
    tA = (vLim - vIni)/aMin;
    tC = 0;
    tD = (vEnd - vLim)/aMax;
  else
    vLim = vMin;
    tA = (vLim - vIni)/aMin;
    tC = (yEnd - y0 - (vLim^2 - vIni^2)/(2*aMin) - (vEnd^2 - vLim^2)/(2*aMax))/vLim;
    tD = (vEnd - vLim)/aMax;
  end if;
equation
  der(y) = v;
  moving = time >= tS + t0 and time <= tS + t0 + tA + tC + tD;
  if time < tS + t0 then
    a = 0;
    v = vIni;
  elseif time < tS + t0 + tA then
    a = aA;
    v = vIni + aA*(time - tS - t0);
  elseif time < tS+ t0 + tA + tC then
    a = 0;
    v = vLim;
  elseif time < tS + t0 + tA + tC + tD then
    a = aD;
    v = vLim + aD*(time - tS - t0 - tA - tC);
  else
    a = 0;
    v = vEnd;
  end if;
  annotation (Icon(graphics={
          Line(
            visible=true,
            points={{-80,78},{-80,-90}},
            color={192,192,192}),
          Line(
            visible=true,
            points={{-90,0},{100,0}},
            color={192,192,192}),
        Line(points={{-80,-60},{-60,-60},{-50,-58},{-40,-52},{40,50},{50,58},{60,
              60},{80,60}},
            color={255,0,0}),
          Polygon(
            visible=true,
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid,
            points={{-80,90},{-88,68},{-72,68},{-80,90}}),
        Line(points={{-80,0},{-80,60},{-40,60},{-40,0},{40,0},{40,-60},{80,-60},
              {80,0}}, color={0,140,72}),
        Line(points={{-80,0},{-40,40},{40,40},{80,0}}, color={28,108,200})}),
      Documentation(info="<html>
<p>
The P2P block calculates an optimal point-to-point trajectory.
</p>
<h4>Note:</h4>
<p>
If intial position yIni and intitial speed vIni (at start of simulation) are specified, and the movement starts time span t0 after start of simulation, 
the movement starts from position y0 = yIni + vIni*t0.
</p>
<p>
If initial speed vIni moves in the opposite direction as desired, i.e. sign(vIni) &lt;&gt; sign (yEnd - yIni), 
the movement starts in the \"wrong\" direction until deceleration to zero and acceleration into then \"right\" direction is achieved.
</p>
<p>
If desired end position yEnd and desired end speed vEnd (at the end of the movement) are specified, 
the position is extrapolated linearly from yEnd with vEnd after end of the movement.
</p>
<p>
If desired end speed vEnd moves in the opposite direction of the movement, i.e. sign(vEnd) &lt;&gt; sign (yEnd - yIni), 
the movement shows an overshot over the desired end position yEnd. 
However, when the desired end speed vEnd is met, the desired end position yEnd is reached.
</p>
</html>"));
end P2p;
