use <atis_lib.scad>;

w = 180; // előlap élhossza
rl = 10; //lap sarkának gömbölyítése
ww = 5; // anyagvastagság

hezag=0.5;
difference(){
    kurtobe();
//    translate([-100,0,0])cube([200,100,100]);
}

elolap();

module kurtobe(){
    //translate([0,0,ww])
//    gyuru(85,85, 5, 13);
    gyuru(77, 72, 60, ww, $fn=77*6);
    //#gyuru(77-ww/2-hezag, 77-ww/2-hezag, ww, ww/2, $fn=77*6);
}


module elolap(){
    difference(){
        minkowski(){
            wc = w-2*rl;
            cube([wc,wc,ww], center=true);
            cylinder(r=rl,h=0.1);    
        }
        csx = w/2 - 15;
        csy = w/2 - 15;
        l = [[csx, csy],
             [csx, -csy],
             [-csx, -csy],
             [-csx, csy]];

        for(c = l){
            translate([c[0], c[1],0]){
                cylinder(r=2.5,h=60, center=true, $fn=2.5*12);
                translate([0,0,-ww/2])cylinder(r=5, h=ww/2, $fn=5*12);
            }
        }
        cylinder(r=77-ww/2, h=22, center=true, $fn=77*6);
    }
}
