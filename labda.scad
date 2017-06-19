difference(){
    sphere(r=75, $fn=240);
    translate([-80,-80,-80])cube([160,160,80]);
    translate([0,0,-0.1])cylinder(r=5.3,h=60, $fn=72);
}