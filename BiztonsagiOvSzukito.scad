$fn=100;

scale(0.9)gombolyitett();

module szogletes(){
    scale(0.7){
        minkowski(){
            difference(){
                cube([150,80,2], center=true);
                translate([0,35,0])cube([30,20,3], center=true);
                translate([0,-35,0])cube([30,20,3], center=true);
                translate([0,20,0]) cube([110,20,3], center=true);
                translate([0,-20,0]) cube([110,20,3], center=true);
            }
            sphere(r=3);
        }
    }
}

module oval(x, y, z=1, h,center){
    scale([1, y/x,z/x]) cylinder(r=x,h=h, center=center); 
}

module gombolyitett(){
    scale(1){
        minkowski(){
            difference(){
                union(){
                    translate([35,0,0])cylinder(r=40, h=2, center=true);
                    translate([-35,0,0])cylinder(r=40, h=2, center=true);
                    cube([70,80,2], center=true);
                }
                //oval(75,35,h=2, center=true);
                translate([0,33,0])cube([30,20,3], center=true);
                translate([0,-33,0])cube([30,20,3], center=true);
                translate([0,17,0]) cube([90,15,3], center=true);
                translate([0,-17,0]) cube([90,15,3], center=true);
            }
            sphere(r=3);
        }
    }
}