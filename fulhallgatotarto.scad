$fn=40;

melyseg=20;
szelesseg=70;
magassag=szelesseg/2;
gombolyites=2;
falvastagsag=7;
pontok=[[0,0],
        [0,falvastagsag],
        [falvastagsag-2*gombolyites,falvastagsag],
        [falvastagsag-2*gombolyites,falvastagsag-2*gombolyites],
        [szelesseg/2-(falvastagsag-2*gombolyites)/2-gombolyites,falvastagsag-2*gombolyites],
        [szelesseg/2-(falvastagsag-2*gombolyites)/2-gombolyites,magassag-falvastagsag],
        [0.6*(szelesseg/2-(falvastagsag-2*gombolyites)/2-gombolyites),magassag-falvastagsag],
        [0.6*(szelesseg/2-(falvastagsag-2*gombolyites)/2-gombolyites),magassag-2*gombolyites],
        [szelesseg/2-gombolyites,magassag-2*gombolyites],
        [szelesseg/2-gombolyites,0],
        [0,0]];
   
//keresztmetszet();

// Ez nincs skálázva a tartó méretével. Mindig ugyanakkora.
module kisSarok(){
        translate(pontok[3])rotate(180)difference(){
        square(3);
        translate([-1.7,-1.7,0])circle(r=5);
    }
}

module nagySarok(){
    scale([(szelesseg-falvastagsag)/110, (magassag-falvastagsag)/50, 1])translate([-15,-15,0])difference(){
        square(15);
        translate([-2,-2,0])circle(r=17, $fn=100);
    }
}

module felidom(){
    polygon(pontok);
    
    translate(pontok[5])nagySarok();
    translate(pontok[4])mirror([0,1,0]) nagySarok();
    translate(pontok[3])kisSarok();

}

module keresztmetszet(){
        union(){
            felidom();
            translate([2*(szelesseg/2-gombolyites),0,0])mirror()felidom();;
        }
    
}

minkowski(){        
    linear_extrude(height=melyseg-gombolyites) keresztmetszet();
    sphere(r=gombolyites);
}