difference(){
    sphere(r=75, $fn=1000);
    translate([-80,-80,-80])cube([160,160,80]);
    translate([0,0,-0.1])cylinder(r=5.1,h=60, $fn=72);
}