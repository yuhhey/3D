$fn = 5;
ww = 10; // elválasztó falak vastagsága
dwtw = 85; // falak közti távolság
nslot = 5; // fakkok száma
gombolyites=2;


csm=[15,40,50,8,5,5];

duplacsatlakozoproba();

module csatlakozoproba(){
    translate([17.5,0,-2.5])csatlakozo(csm);
    difference(){
        cube([20,45,55], center=true);
        translate([-2.25,0,-2.75])csatlakozo(csm + [0.5, 1, 0.5, 0.5, 1, 0.5]);
    }
}

module duplacsatlakozoproba(){
    translate([17.5,37.5,-2.5])csatlakozo(csm);
    translate([17.5,-37.5,-2.5])csatlakozo(csm);
    difference(){
        cube([20,150,55], center=true);
        translate([-2.25,37.5,-2.75])csatlakozo(csm + [0.5, 1, 0.5, 0.5, 1, 0.5]);
        translate([-2.25,-37.5,-2.75])csatlakozo(csm + [0.5, 1, 0.5, 0.5, 1, 0.5]);
    }
}

//kozepelem();
//vegelem();

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
        gap = 0.5;
        
        difference(){
            cube([150, ww+dwtw, 100]);
            translate([0,ww/2-2*gombolyites+(ww+dwtw)/2,100+ww])rotate([0,90,0])scale([2*100/dwtw,1,1])cylinder(r=dwtw/2, h=150, $fn=100);
                //translate([10,y+ww/2,-1]) cube([60,dwtw-ww,150]);
                //translate([80,y+ww/2,-1]) cube([60,dwtw-ww,150]);
            if (cs1){
                //ha a két oldalon ugyanakkor rést akarok, mint felül, akkor a felső rés kétszeresével nagyobb idomot kell kivágnom.
                translate([37.5,(csm[0]+gap)/2,csm[2]/2+gap/2])rotate([0,0,90])csatlakozo(csm+[gap,2*gap,gap,gap,2*gap,gap]); 
                translate([112.5,(csm[0]+gap)/2,csm[2]/2+gap/2])rotate([0,0,90])csatlakozo(csm+[gap,2*gap,gap,gap,2*gap,gap]);
            }
        }
        if (cs2){
            translate([37.5,ww+dwtw+csm[0]/2,csm[2]/2])rotate([0,0,90])csatlakozo(csm);
            translate([112.5,ww+dwtw+csm[0]/2,csm[2]/2])rotate([0,0,90])csatlakozo(csm);
        }
}

module csatlakozo(csm)
{
    cw = csm[0];
    sz = csm[1];
    h = csm[2];
    ch = csm[3];
    ny = csm[4];
    R=csm[5];
    translate([-cw/2, -sz/2, -h/2]){
        cube([cw,sz,ch]);
        translate([0,sz,ch])rotate([90,0,0])linear_extrude(height=sz)polygon([[0,0], [cw, 0], [0,cw+1], [0,0]]);
        translate([0,(sz-ny)/2,0])
        intersection()
        {
            //R=(sz/4+1)/2;
            translate([0,R+ny/2,0])rotate([90,0,0])linear_extrude(height=2*R)polygon([[0,0], [cw, 0], [cw, h-cw-1], [0,h], [0,0]]);
            union(){
                cube([ny, ny,h]);
                translate([cw-R-0.7,ny/2,0]) cylinder(r=R, h=h,$fn=80);
            }
        }
    }
}

module TartoEgyben(){
    difference(){
        minkowski(){
            difference(){
                cube([150, nslot*dwtw+(nslot+1/2)*ww, 100]);
                for (s = [0:nslot-1]){
                    y=ww-2*gombolyites+s*(ww+dwtw);
                    //translate([0,y,ww])cube([150,dwtw,150]);
                    translate([0,y+(ww+dwtw)/2,100+ww])rotate([0,90,0])scale([2*100/dwtw,1,1])cylinder(r=dwtw/2, h=150, $fn=20);
                    //translate([10,y+ww/2,-1]) cube([60,dwtw-ww,150]);
                    //translate([80,y+ww/2,-1]) cube([60,dwtw-ww,150]);
                }
            }
            sphere(r=0);
            
        }
        nevek=["Bulcsú", "Hanga", "Kamilla", "Olívia", "Zille"];
        
        for (i=[0:nslot]){
            translate([150,(i)*(ww+dwtw)+ww/2,30])rotate([0,90,0])linear_extrude(height=2)text(text=nevek[i], font="Courier Bold", size=10, halign="center");
        }
    }
}

