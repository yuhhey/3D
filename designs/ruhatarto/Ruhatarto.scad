use <atis_lib.scad>;

$fn = 5;
ww = 6; // elválasztó falak vastagsága
dwtw = 85; // falak közti távolság
nslot = 5; // fakkok száma
gombolyites=2;


csm=[15,40,50,8,5,5];
gap=0.3;
gap_v = [gap, 2*gap, gap, gap, 2*gap, gap];

csatlakozoproba();
//translate([0,-0-ww-dwtw,-5])
//kezdoelem();
//kozepelem();
//translate([0,0,-00])vegelem();
module csatlakozoproba(){
    translate([17.5,0,-2.5])csatlakozo(csm);
    difference(){
        cube([20,45,55], center=true);
        //2.35=10-(15+0.3)/2
        translate([-2.35,0,-2.75])csatlakozo(csm + gap_v);
    }
}

module duplacsatlakozoproba(){
    translate([17.5,37.5,-2.5])csatlakozo(csm);
    translate([17.5,-37.5,-2.5])csatlakozo(csm);
    difference(){
        cube([20,150,55], center=true);
        translate([-2.25,37.5,-2.75])csatlakozo(csm + gap_v);
        translate([-2.25,-37.5,-2.75])csatlakozo(csm + gap_v);
    }
}

module kezdoelem(){ // makeme
    elem(cs1=false);
}

module kozepelem(){ // makeme
    elem();
}

module vegelem(){ // makeme
    elem(cs2=false);
}


module elem(cs1=true, cs2=true){
    csm=[15,40,50,8,5,5];
    ew = cs1 ? 0:ww/2;
    w = cs2 ? 0:ww/2;
    difference(){
        translate([gombolyites,gombolyites,gombolyites])
            minkowski(){
                difference(){
                
                    cube([150-2*gombolyites, ww+dwtw+w+ew-2*gombolyites, 100-2*gombolyites]);
                    translate([0,(ww+dwtw)/2+ew-gombolyites,100+ww])
                        rotate([0,90,0])
                            scale([2*100/dwtw,1,1])
                                cylinder(r=dwtw/2, h=150, $fn=200);
                }
            rotate([90,0,0])cylinder(r=gombolyites, h=2*gombolyites, center=true,$fn=32);
        }
        
        for (y = [22+ww:24:100-8-ww]){
            for (x = [12+ww:23:150-ww]){
                translate([x,y,0])cylinder(r=9, h=100,$fn=60);
            }
        }
        if (cs1){
            //ha a két oldalon ugyanakkor rést akarok, mint felül, akkor a felső rés kétszeresével nagyobb idomot kell kivágnom.
            translate([37.5,(csm[0]+gap)/2,csm[2]/2+gap/2])
                rotate([0,0,90]) csatlakozo(csm + gap_v); 
            translate([112.5,(csm[0]+gap)/2,csm[2]/2+gap/2])
                rotate([0,0,90]) csatlakozo(csm + gap_v);
        }
    }
    if (cs2){
        translate([37.5,ww+dwtw+csm[0]/2+w+ew,csm[2]/2])
            rotate([0,0,90])csatlakozo(csm);
        translate([112.5,ww+dwtw+csm[0]/2+w+ew,csm[2]/2])
            rotate([0,0,90])csatlakozo(csm);
    }
}

