difference(){
    cube([30,70,25]);
    translate([15,-0.5,5])cube([30,71,30]);
    translate([5, 6, 5])cube([5,58,30]);
    translate([5, 25, -0.5])cube([5,20,30]);
    translate([22.5,0,0]){
        translate([0,15,-.1])csavarfurat();
        translate([0,55,-.1])csavarfurat();
    }
}

module csavarfurat(){
    cylinder(r=2, h=4,$fn=24);
    translate([0,0,3])cylinder(r=5,h=2.2,$fn=60);
}
    
      