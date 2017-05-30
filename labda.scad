difference(){
    sphere(r=75, $fn=1000);
    translate([-80,-80,-80])cube([160,160,80]);
    translate([0,0,-0.1])cylinder(r1=5.25, r2=5,h=50, $fn=72);
}