$fn=100;
difference(){
    linear_extrude(height=210)
        minkowski()
        {
            difference(){
                square([62,56], center=true);
                union (){
                    translate([22,28,0])circle(r=8, center=true);
                    translate([-7,24,0])square([57,8],center=true);
                    translate([22,-18,0])circle(r=8, center=true);
                    translate([22,10,0])circle(r=8, center=true);
                    translate([22,-5,0])square([16,28],center=true);
                    translate([-11,-8,0])square([48,52],center=true);
                    translate([13,0,0])square([18,36],center=true);
                    translate([23,-19,0])difference(){
                        circle(r=14,center=true);
                        circle(r=10,center=true);
                        translate([0,-20,0])square([40,40]);
                    }            
                }
            }
            circle(r=1.5);
        }
    for (z = [105/2, 105*3/2]){
        translate([29,8,z])rotate([0,90,0]) cylinder(r1=3, r2=1.5, h=2,center=true);
        translate([31,8,z])rotate([0,90,0]) cylinder(r=1.5, h=3,center=true);
    }
    translate([-30,22,2.5])rotate(-3) cube([58,15,205]);
    for (z = [0:30:210]){
        translate([14.5,-20,z])cube([28,24,24],center=true);
    }
}