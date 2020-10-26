$fn=100;


tarto();

//csavar_lyuk(r=1.5, v=10);

module tarto(){
    tarto_sz = 300;
    rotate([0,90,0])
    difference(){
        linear_extrude(height=tarto_sz)
            minkowski()
            {
                difference(){
                    translate([0,-3,0])square([62,50], center=true);
                    union (){
                        //translate([22,28,0])circle(r=8, center=true);
                        //translate([-7,24,0])square([57,8],center=true);
                        translate([22,-18,0])circle(r=8, center=true, $fn=12*8);
                        translate([22,10,0])circle(r=8, center=true, $fn=12*8);
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
                union(){
                    circle(r=1.5, $fn=12*1.5);
                    translate([0,-1.5,0])square([1.5,1.5]);
                }
            }
        for (z = [tarto_sz/4, tarto_sz*3/4]){
            translate([31.6,0,z])rotate([0,-90,0])csavar_lyuk(r=2, v=5);
            #translate([0,21.25,z])rotate([90,0,0])csavar_lyuk(r=2, v=8);
        }
        //translate([-30,22,2.5])rotate(-3) cube([58,15,205]);
        for (z = [0:30:tarto_sz]){
            translate([14.5,-20,z])cube([28,24,24],center=true);
        }
    }
}

module csavar_lyuk(r, v){
    translate([0,0, (v-1.5)/2])cylinder(r2=r+1.5, r1=r, h=1.5, $fn=12*(r+1.5));
    cylinder(r=r, h=v-1.5,center=true,$fn=r*12);
}