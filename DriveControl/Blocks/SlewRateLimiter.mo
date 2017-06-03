within DriveControl.Blocks;
block SlewRateLimiter "Limits the slew rate of a signal"
  extends Modelica.Blocks.Interfaces.SISO(y(start=y_start));
  import Modelica.Constants.small;
  //[DampingCoeffcient]=1/s leads to problems
  parameter Real Rising(min= small) = 1
    "Maximum rising slew rate [+small..+inf) 1/s";
  parameter Real Falling(max=-small) = -Rising
    "Maximum falling slew rate (-inf..-small] 1/s";
  parameter Modelica.SIunits.Time Td(min=small) = 1e-6
    "Derivative time constant";
  parameter Modelica.Blocks.Types.Init initType=Modelica.Blocks.Types.Init.SteadyState
    "Type of initialization (SteadyState implies y = u)"
    annotation (Evaluate=true, Dialog(group="Initialization"));
  parameter Real y_start=0 "Initial or guess value of output (= state)"
    annotation (Dialog(group="Initialization"));
  parameter Boolean strict=true "= true, if strict limits with noEvent(..)"
    annotation (Evaluate=true, choices(checkBox=true), Dialog(tab="Advanced"));
protected
  Real val=(u-y)/Td;
initial equation
  if initType == Modelica.Blocks.Types.Init.SteadyState then
    y = u;
  elseif initType == Modelica.Blocks.Types.Init.InitialState
      or initType == Modelica.Blocks.Types.Init.InitialOutput then
    y = y_start;
  end if;
equation
  if strict then
    der(y) = smooth(1, (if noEvent(val<Falling) then Falling else if noEvent(val>Rising) then Rising else val));
  else
    der(y) = smooth(1, (if (val<Falling) then Falling else if (val>Rising) then Rising else val));
    //smooth(1, min(max(val, Falling), Rising));
  end if;
  annotation (Icon(graphics={
    Line(points={{-90,0},{68,0}}, color={192,192,192}),
    Line(points={{0,-90},{0,68}}, color={192,192,192}),
    Polygon(
      points={{0,90},{-8,68},{8,68},{0,90}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Polygon(
      points={{90,0},{68,-8},{68,8},{90,0}},
      lineColor={192,192,192},
      fillColor={192,192,192},
      fillPattern=FillPattern.Solid),
    Line(visible=not strict,
      points={{-50,-70},{50,70}},
      color={0,0,255}),
    Line(visible=strict,
      points={{-50,-70},{50,70}},
      color={255,0,0})}),
Documentation(info="<html>
<p>The <code>SlewRateLimiter</code> block limits the slew rate of its input signal in the range of <code>[Falling, Rising]</code>.</p>
<p>To ensure this for arbitrary inputs and in order to produce a differential output, the input is numerically differentiated
with derivative time constant <code>Td</code>. Smaller time constant <code>Td</code> means nearer ideal derivative.</p>
<p><em>Note: The user has to choose the derivative time constant according to the nature of the input signal.</em></p>
</html>",
revisions="<html>
<table cellspacing=\"0\" cellpadding=\"2\" border=\"1\"><tr>
<th>Revision</th>
<th>Date</th>
<th>Author</th>
<th>Comment</th>
</tr>
<tr>
<td valign=\"top\">4954</td>
<td valign=\"top\">2012-03-02</td>
<td valign=\"top\">A. Haumer &amp; D. Winkler</td>
<td valign=\"top\"><p>Initial version based on discussion in <a href=\"https://trac.modelica.org/Modelica/ticket/529/Modelica\">#529</a></p></td>
</tr>
</table>
</html>"));
end SlewRateLimiter;
