r_iv = 8;
minkowski()
{
    cube([48-r_iv,69.5-2*r_iv,28]);
    difference(){
       cylinder(r=r_iv, h=.00001, $fn=r_iv*12);
       translate([0,-r_iv,0])cube([r_iv,2*r_iv,1]);
    }
}