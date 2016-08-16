$fa=1;
$fs=0.5;

//tartalyvagon();
//szenesvagon();
//mozdony();
//szemelyvagon();
//NagyTartalyVagon();


module NagyTartalyVagon(){ // makeme
    difference(){
        tz = -11;
        tx = 25;
        union(){
            difference(){
                
                        union(){
                            intersection(){
                                translate([0,0,17])sphere(r=48, center=true);
                                translate([0,0,17])rotate([0,90,0])cylinder(r=15, h=100, center=true);
                            }
                            minkowski(){
                                translate([0,0,-5])cube([90,20,18], center=true);
                                cylinder(r=3, h=1, center=true);
                        } 
                }
                translate([tx, 14.5, tz]) rotate([90,0,0])cylinder(r1=16, r2=11, h=10, center=true);
                translate([tx, -14.5, tz]) rotate([90,0,0])cylinder(r1=11, r2=16, h=10, center=true);
                translate([-tx, 14.5, tz]) rotate([90,0,0])cylinder(r1=16, r2=11, h=10, center=true);
                translate([-tx, -14.5, tz]) rotate([90,0,0])cylinder(r1=11, r2=16, h=10, center=true);
                
            }
            tengely(tx,tz);
            tengely(-tx, tz);
            translate([-45,0,tz+3]) utkozo();
            translate([45,0, tz+3]) utkozo();
        }
        tengelyfurat(tx, tz);
        tengelyfurat(-tx, tz);
        
        translate([-44,0,-9.1])magnestarto();
        translate([44,0,-9.1])magnestarto();       
    }
}

module SzemelyVagon(){ // makeme
    difference(){
        tz = -11;
        tx = 25;
        union(){
            difference(){
                minkowski(){
                    minkowski(){
                        minkowski(){
                            union(){
                                cube([96,20,20], center=true);
                                translate([0,0,9])rotate([0,90,0])cylinder(r=10, h=96, center=true);
                                
                            }
                            rotate([0,90,0])cylinder(r=2, h=1, center=true);
                            //translate([42,0,-40])sphere(r=100);
                            //translate([-42,0,-40])sphere(r=100);
                           
                        }
                        rotate([90,0,0])cylinder(r=2, h=1, center=true);
                    }
                    cylinder(r=2, h=1, center=true);
                }
                translate([tx, 14.5, tz]) rotate([90,0,0])cylinder(r1=16, r2=11, h=10, center=true);
                translate([tx, -14.5, tz]) rotate([90,0,0])cylinder(r1=11, r2=16, h=10, center=true);
                translate([-tx, 14.5, tz]) rotate([90,0,0])cylinder(r1=16, r2=11, h=10, center=true);
                translate([-tx, -14.5, tz]) rotate([90,0,0])cylinder(r1=11, r2=16, h=10, center=true);
                //Ajtók
                translate([45,-14.5,0])cube([7,1.6,20], center=true);
                translate([-45,-14.5,0])cube([7,1.6,20], center=true);
                translate([45,14.5,0])cube([7,1.6,20], center=true);
                translate([-45,14.5,0])cube([7,1.6,20], center=true);
                //Ablakok
                for(x = [-35:10:35]){
                    translate([x,14.5,6.5]) minkowski(){
                        cube([6,1.6,6], center=true);
                        rotate([90,0,0])cylinder(r=1,h=1);
                    }
                    translate([x,-14.5,6.5]) minkowski(){
                        cube([6,1.6,6], center=true);
                        rotate([90,0,0])cylinder(r=1,h=1);
                    }
                }
            }
            tengely(tx,tz);
            tengely(-tx, tz);
            translate([-50,0,tz+3]) utkozo();
            translate([50,0, tz+3]) utkozo();
        }
        tengelyfurat(tx, tz);
        tengelyfurat(-tx, tz);
        
        translate([-47.5,0,-9])magnestarto();
        translate([47.5,0,-9])magnestarto();       
    }
}
module Mozdony(){ // makeme
    difference(){
        tz = -16;
        tx = 25;
        union(){
            difference(){
                minkowski(){
                    minkowski(){
                        intersection(){
                            minkowski(){
                                cube([96,20,30], center=true);
                                rotate([0,90,0])cylinder(r=2, h=1, center=true);
                            }
                            translate([42,0,-40])sphere(r=100);
                            translate([-42,0,-40])sphere(r=100);
                        }
                        rotate([90,0,0])cylinder(r=2, h=1, center=true);
                    }
                    cylinder(r=2, h=1, center=true);
                }
                translate([tx, 14.5, tz]) rotate([90,0,0])cylinder(r1=16, r2=11, h=10, center=true);
                translate([tx, -14.5, tz]) rotate([90,0,0])cylinder(r1=11, r2=16, h=10, center=true);
                translate([-tx, 14.5, tz]) rotate([90,0,0])cylinder(r1=16, r2=11, h=10, center=true);
                translate([-tx, -14.5, tz]) rotate([90,0,0])cylinder(r1=11, r2=16, h=10, center=true);

                //Ajtók
                translate([20,-14.5,7])cube([7,1,19], center=true);
                translate([20,14.5,7])cube([7,1,19], center=true);
            }
            tengely(tx,tz);

            tengely(-tx, tz);
            translate([-50,0,tz+3]) utkozo();
            translate([50,0, tz+3]) utkozo();
            //lampak
            translate([-52,9,-4])rotate([0,90,0]) cube([6,4,2.5], center=true);
            translate([-52,-9,-4])rotate([0,90,0]) cube([6,4,2.5], center=true);
            translate([52,9,-4])rotate([0,90,0]) cube([6,4,2.5], center=true);
            translate([52,-9,-4])rotate([0,90,0]) cube([6,4,2.5], center=true);
        }
        tengelyfurat(tx, tz);
        tengelyfurat(-tx, tz);
        //ablak
        translate([50,0,9])rotate([0,-29,0])cube([5,22,15],center=true);
        translate([-50,0,9])rotate([0,29,0])cube([5,22,15],center=true);
        
        translate([-47,0,-14])magnestarto();
        translate([47,0,-14])magnestarto();
        for(s = [14, -14]){
            for(i = [-1:2:15]){
                translate([-15, s, i]) cube([40,1,1], center=true);
            }
        }
        
    }
}
module TartalyVagon(){ // makeme
    translate([0,0,14.5])barrel();
    translate([0,0,-4.5])chassis();
}
module SzenesVagon(){ //makeme
    difference(){
        union(){
            translate([0,0,21])szenes();

            chassis();
        }
        translate([0,0,10])cube([48,16,12], center=true);
    }
}


module steps(r, angle){
    lr = r+0.5;
    for (s = [angle: 10: 60]){ 
        translate([11, -lr*cos(s), lr*sin(s)]) cube([6, 2*lr*cos(s),0.6]);
        //translate([-17, -16*cos(s), 13+16*sin(s)]) cube([6, 32*cos(s),0.6]);
    }
}

module arcs(angle){
    translate([18, 0, 13]) rotate(170, [1,0,0]) rotate(270, [0, 1 , 0]) arc(1,1, 16, 100);
    //translate([21, 0, 13]) rotate([0, 270 , 160]) arc(1,1, 16, 110);
    translate([18, 0, 13]) rotate(270, [1,0,0]) rotate(270, [0, 1 , 0]) arc(1,1, 16, 100);
    translate([13, 0, 13]) rotate(170, [1,0,0]) rotate(270, [0, 1 , 0]) arc(1,1, 16, 100);
    translate([13, 0, 13]) rotate(270, [1,0,0]) rotate(270, [0, 1 , 0]) arc(1,1, 16, 100);
}

module ladder(r, angle=-30){
    //arcs(angle);
    steps(r, angle);

}



module barrel(){
    r=13;
    ladder(r=r);
    union()
    {
        intersection()
        {
            rotate([0, 90,,0])cylinder(r=r,h=60, center = true);
            sphere(r=30);
        }
        translate([-15,0,0]) rotate([0,90,0]) cylinder(r=r,h=30);

        translate([15,0,0]) sphere(r=r);

        translate([0,0,r])  sphere(r=3);
            
        translate([-3,-3,r-2]) cube([20,6,3]); // walk path
        translate([16,0,0.5]) rotate([0,90,0]) cylinder(r=r+.5,h=1);   // outer circle
        translate([11,0,0.5]) rotate([0,90,0]) cylinder(r=r+.5,h=1);   // outer circle

    } // union
}


module szenes(){
    translate([-27,0,0])rotate([0,0,90]){
        difference(){
            rotate([90,0,0]) linear_extrude(54) polygon([[9.5,-13],[13,-8],[13,5],[-13,5],[-13,-8], [-9.5,-13]]);
            translate([-10,-51,-9.5])cube([20,48,21]);
            translate([-11,-0.5,-8.1])cube([22,1,20]);
            translate([-11,-54.5,-8.1])cube([22,1,20]);
        
            translate([-13.6,-7,-8.1])cube([1,5,20]);
            translate([-13.6,-13,-8.1])cube([1,5,20]);
            translate([-13.6,-19,-8.1])cube([1,5,20]);
            translate([-13.6,-40,-8.1])cube([1,5,20]);
            translate([-13.6,-46,-8.1])cube([1,5,20]);
            translate([-13.6,-52,-8.1])cube([1,5,20]);
            translate([-13.6,-34,-8.1])cube([1,14,20]);
            translate([12.6,-7,-8.1])cube([1,5,20]);
            translate([12.6,-13,-8.1])cube([1,5,20]);
            translate([12.6,-19,-8.1])cube([1,5,20]);
            translate([12.6,-40,-8.1])cube([1,5,20]);
            translate([12.6,-46,-8.1])cube([1,5,20]);
            translate([12.6,-52,-8.1])cube([1,5,20]);
            translate([12.6,-34,-8.1])cube([1,14,20]);
        }
        translate([-12,-1,-8])rotate([0,60.5,0])cube([1,1,26.4]);
        translate([11,-54,-8.5])rotate([0,-61,0])cube([1,1,25.6]);
    }
}


module kerekcsonk(o){
    rotate([o*90,0,0])cylinder(r1=3.5, r2=1.3, h=3, center=true);
}

module tengely(x,z){
    translate([x, 9, z])kerekcsonk(-1);
    translate([x,-9, z])kerekcsonk(1);
}

module tengelyfurat(x,z){
      translate([x, 0,z])rotate([90,0,0])cylinder(r=0.9, h=23, center=true);
}

module magnestarto(){
    cube([5.15,11,11], center=true);
}

module utkozo(){
    sphere(r=6);
}

module chassis(){
    csp = 15; // kerekcsonk helye
    fy = -2; //furat y
    difference(){
        union(){
            translate([0,0,6]) cube([54 ,19,4], center=true);
            minkowski(){
                g = 3;
                cube([60-2*g ,19-2*g,10], center=true);
                cylinder(r=g, h=2, center=true);
            }
            tengely(csp, fy);
            tengely(-csp, fy);

 
            translate([-26,0,0]) utkozo();
            
             translate([26,0,0]) utkozo();
             translate([csp, -12, -2])rotate([90,0,0])cylinder(r=10,h=3, center=true);
        }
        tengelyfurat(-csp, fy);
        tengelyfurat(csp, fy);
        translate([25,0,-0.6]) magnestarto();
        translate([-25,0,-0.6]) magnestarto();
    }
}

module arc( height, depth, radius, degrees ) {
    // This dies a horible death if it's not rendered here 
    // -- sucks up all memory and spins out of control 
    render() {
        difference() {
            // Outer ring
            rotate_extrude()
                translate([radius - height, 0, 0])
                    square([height,depth]);
         
            // Cut half off
            translate([0,-(radius+1),-.5]) 
                cube ([radius+1,(radius+1)*2,depth+1]);
         
            // Cover the other half as necessary
            rotate([0,0,180-degrees])
            translate([0,-(radius+1),-.5]) 
                cube ([radius+1,(radius+1)*2,depth+1]);
         
        }
    }
}

