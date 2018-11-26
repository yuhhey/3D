//GardenaTarto();

locsolo_tarto();

//rotate([90,0,0])sullyesztett_furat();

rahagyas=0.5;
nyakatmero = 15;
fejatmero = 20;

module design_locsolo_tarto(){
    difference(){
        translate([-20,0,0])cube(40,40,40);
        for(y = [0:1:10]){
            translate([0,y,0])gardena_negative_apa_csatlakozo();
        }
    }
}

module locsolo_tarto(nyakszelesseg=nyakatmero+2*rahagyas, fejszelesseg=fejatmero+2*rahagyas){
    nysz=nyakszelesseg;
    fsz=fejszelesseg;
    
    
    //minkowski()
    {
        difference(){
            translate([1,1,1])minkowski(){
                cube([248,25,30]);
                difference(){
                    sphere(r=1, $fn=12);
                    translate([0,1,0])cube([2,2,2], center=true);
                }
            }
            for(x =[25-fsz/2:50:300]){
                translate([x,0,0]){
                    translate([0,0,2]) cube([fsz,fsz-2,fsz/2]);
                    translate([(fsz-nysz)/2,0,0])cube([nysz,fsz/2,10]);
                    translate([fsz/2,0,0]){
                        translate([0,0, fsz/2+2])rotate([-90,0,0])cylinder(r=fsz/2, h=fsz-2, $fn=12*fsz/2);
                        translate([0,fsz/2,0])cylinder(r=nysz/2, h=2, $fn=12*nysz/2);
                    }
                }
                
            }
            translate([25,21,fsz/2+2])rotate([90,0,0]){
                #sullyesztett_furat();
            }
            translate([225,21,fsz/2+2])rotate([90,0,0]){
                sullyesztett_furat();
            }
        }
        
    }
}

module sullyesztett_furat(){
    cylinder(r=6,h=21, $fn=6*12);
    //translate([0,6,10])cube([12,12,21], center=true);
    translate([0,0,-5.5])#furat();
}

module GardenaTarto(){ //make me
    for(y = [0:50:100]){
        for(x = [0:50:100]){
            translate([x+25,y+25,10])gardena_apa_csatlakozo();
        }
    }

    difference(){
        translate([3,3,0])minkowski(){
            cube([144,144,7]);
            //cylinder(r=3,h=1,$fn=12*3);
            difference(){
                sphere(r=3, $fn=24*3,center=true);
                translate([-3,-3,-3])cube([6,6,3]);
            }
        }
        translate([50,50,0])furat();
        translate([50,100,0])furat();
        translate([100,100,0])furat();
        translate([100,50,0])furat();
    }
}

module gardena_apa_csatlakozo(){
    translate([-15,-15,-47.5]) difference(){
        import("Gardena_Spout_Circle.STL");
        cube([30,30,47.5]);
    }
}

module gardena_anya(){
    hull() gardena_apa_csatlakozo();
}

module gardena_negative_apa_csatlakozo(){ // Ezt ki kell vonni abból a formából, amibe anya csatlakozót akarunk rakni.
    translate([0,0,-0.01])gardena_apa_csatlakozo();
    translate([0,0,-0.01])difference(){
        cylinder(r1=8, r2=5, h=28);
        gardena_apa_csatlakozo();
    }
}

module furat(){
    cylinder(r=3.5,h=20,$fn=12*3.5);
    translate([0,0,5])cylinder(r=6,h=5, $fn=12*5);
}
