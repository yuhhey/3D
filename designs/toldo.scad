use <atis_lib.scad>

//HA kellene a menet
//use <../Threaded_Library/Thread_Library.scad>
//gyuru module: minden sugár külső sugár

q=60;



w=2;
gombolyites=2;
hezag=0.3;
r1=36;
r2=33;
r3=37;
r4=38;
W=w-2*gombolyites;
R1=r1/2+gombolyites+hezag;
R2=r2/2+gombolyites+hezag;
R3=r3/2+gombolyites+hezag;

//KregBosch();
//Bosch();
//translate([0,0,25])gyuru(19, 16, 20,2,$fn=104);
//translate([0,0,45]) Kreg();
//BEH600_GAF25();
//BoschScheppachToldo();
//FelsomaroElszivoCsonk();
//PVC110es_flexicsoToldo();
//PVC110es_belso_tomiteshez_flexicsoToldo();
//PVC110es_GAF25_belso_kulso();

//Y_PVC110_belso_tomiteshez_flexi_flexi();

module Kreg(){
    R1_kreg= 14.5;
    R2_kreg= 16;
    translate([0,0,0]) gyuru(R2_kreg,R1_kreg, 20, 2, $fn=104);
}

module Bosch(){
    translate([0,0,0])gyuru(20.5, 19, 25,2, $fn=120);
}

module KregBosch(){ // make me
    //Kreg csonk belső átmérője: 30mm.
    //translate([0,0,gombolyites])minkowski()
    {
        union(){
            R1_kreg= 16.5;
            R2_kreg= 15.5;
            translate([0,0,40])gyuru(R2, R1, 25,2, $fn=q);
            translate([0,0,20]) gyuru(R1_kreg,R2, 20, 2, $fn=q);
            translate([0,0,0]) gyuru(R2_kreg,R1_kreg, 20, 2, $fn=q);
        }
       //sphere(gombolyites, $fn=16);
    }
}

module MakitaBosch(){ // make me
    translate([0,0,gombolyites])minkowski(){
        union(){
            translate([0,0,20])gyuru(R2, R1, 45,W);
            translate([0,0,15]) gyuru(R3,R2,5,W);
            translate([0,0,0]) gyuru(R4,R3,15,W);
        }
        sphere(gombolyites);
    } 
}

module KompresszorKerekmedence(){
    gyuru(8,8.5,10,4);
    translate([0,0,-10])gyuru(10,8,10,4);
    translate([0,0,-20])gyuru(8.5,10,10,4);
}

//BEH600_GAF25();

module BEH600_GAF25(){
    
    difference(){
        union(){
            hull(){
                linear_extrude(height=1, scale=0.9) scale(1.1) translate([21.5,-17,0]) polygon([[0,0],[-17,34],[-43,34],[-26,0],[0,0]]);
                translate([0,0,15]) cylinder(r=R2, h= 2, center=true, $fn=q);//gyuru(R2, R1, 2,2, center=true);
            }
            translate([0,0,-30])linear_extrude(height=30,scale=1.1/0.9) scale(0.9) translate([21.5,-17,0])polygon([[0,0],[-17,34],[-43,34],[-26,0],[0,0]]);
        }
        union(){
            hull(){
                scale([0.7,0.8,1])linear_extrude(height=10, scale=0.8) scale(1.1) translate([21.5,-17,0]) polygon([[0,0],[-17,34],[-43,34],[-26,0],[0,0]]);
                translate([0,0,15])cylinder(r=R2-w,h=2, $fn=q);
            }
            scale([0.7,0.8,1])translate([0,0,-30])linear_extrude(height=31,scale=1.1/0.9) scale(0.9) translate([21.5,-17,0])polygon([[0,0],[-17,34],[-43,34],[-26,0],[0,0]]);
        }
    }
    translate([0,0,16+22.5])gyuru(R2, R1, 45,w, center=true);
    //translate([0,0,80])cylinder(r=R1-w,height=20,center=true);
}

// Elszívó - Bosch porszívócső
//97-99 külső átmerő
//57-58 belső átmérő

module BoschScheppachToldo(){  // make me
    rotate([180,0,0 ]){
        translate([0,0,50])Scheppach();
        translate([0,0,30])gyuru((58+2*4)/2, 99/2, 20,4);
        gyuru((59+2*4)/2, (58+2*4)/2, 30, 4);
    }
}

module Scheppach(){
    gyuru(99/2, 97/2, 40, 2);
}

module FelsomaroElszivoCsonk(){
    translate([0,0,4])SchY_PVC110_belso_tomiteshez_flexi_flexi()eppach();
    w = 158;
    h = 146; // teglalap esetén mindig h legyen a nagyobb, hogy a lyukakat megfelelően pozícionálja
    wl = 15; //oldalfal szélessége
    difference(){
        minkowski(){
            translate([0,0,1]) cube([w-20, h-20,2], center=true);
            cylinder(r=10, h=2);
        }
        translate([0,0,-1])cylinder(r=99/2-2, h=5, $fn=12*(99/2-2));
        xh = w/2;
        yh = h/2;
        d = wl/2;
        cornerholes = [[xh-d-5, yh-d],
                       [-xh+d+5, yh-d],
                       [-xh+d+5, -yh+d],
                       [xh-d-5, -yh+d]];
       for ( coords = cornerholes){
           echo(coords[0], coords[1]);
          translate([coords[0], coords[1],-1]) #cylinder(r=2, h=10, $fn=12*2);
       }
       sz = 50;
       translate([w/2, -h/2-10, 0])rotate([0,-sz,0])cube([10,h+20,10]);
       translate([-w/2, -h/2-10, 0])rotate([0,-sz,0])cube([10,h+20,10]);
    }
}


/* Module ötlet: felso_kulso, also_kulso, falvastagsag, kupossag. Ez utolsó mm-ben megadja a toldó 2 végének a szükölését a külső átmérők körül.
   összesen 4 különböző kombináció van:
   1. Felső kívül, alsó belül - alsó kívül, felső belül --> ez egy esetként kezelhető a felső alsó felcserélésével
   2. Felső kívül, alsó kívül
   3. Felső belül, alsó belül

A flexibilis cső felöli végére van karima a bilincses rögzítéshez.
*/


module PVC110es_flexicsoToldo(){
     PVC110_r_kulso = 55;   //110mm a külső átmérő
     flexicso_r_belso = 51;   // a gyári galléros műanyag elem átmérője 102mm
     fal_d = 2;
     
     felso_kulso = PVC110_r_kulso+fal_d;
     
     gyuru(felso_kulso-1, felso_kulso+fal_d+1,50, fal_d);
     translate([0,0,-10])gyuru(flexicso_r_belso+1, felso_kulso, 10, fal_d);
     translate([0,0,-60])gyuru(flexicso_r_belso-1,flexicso_r_belso+1, 50, fal_d);
 }
 
 
 // Tömítés nélkülio véghez belső
 module PVC110es_belso_flexicsoToldo(){
     PVC110_r_belso = 52.5;   //110mm a külső átmérő
     flexicso_r_belso = 51;   // a gyári galléros műanyag elem átmérője 102mm
     fal_d = 2;
     
     gyuru(PVC110_r_belso+1, PVC110_r_belso-1,50, fal_d);
     translate([0,0,-10])gyuru(flexicso_r_belso+1, PVC110_r_belso+1, 10, fal_d);
     translate([0,0,-60])gyuru(flexicso_r_belso-1,flexicso_r_belso+1, 50, fal_d);
     translate([0,0,-60])gyuru(flexicso_r_belso, flexicso_r_belso,10,fal_d);
 }
 
 
 //Tömítéses véghez belső
 module PVC110es_belso_tomiteshez_flexicsoToldo(){
     PVC110_r_belso = 55;   //110mm a belső átmérő a tömített végen
     flexicso_r_belso = 51;   // a gyári galléros műanyag elem átmérője 102mm
     fal_d = 2;
     
     gyuru(PVC110_r_belso+1, PVC110_r_belso-1,50, fal_d);
     translate([0,0,-10])gyuru(flexicso_r_belso+1, PVC110_r_belso+1, 10, fal_d);
     translate([0,0,-60])gyuru(flexicso_r_belso-1,flexicso_r_belso+1, 50, fal_d);
     translate([0,0,-60])gyuru(flexicso_r_belso, flexicso_r_belso,10,fal_d);
 }
 
 // Tömítéses véghez belső
 module PVC110es_GAF25_belso_kulso(){
     PVC110_r_belso = 55; //110mm a belső átmérő a tömített végen
     GAF_r_kulso = 59/2;
     fal_d = 2;
     
     kulso_r = GAF_r_kulso+fal_d;
     
     gyuru(PVC110_r_belso+1, PVC110_r_belso-1,50, fal_d);
     translate([0,0,-40])gyuru(kulso_r-0.5, PVC110_r_belso+1, 40, fal_d);
     translate([0,0, -70])gyuru(kulso_r, kulso_r-0.5, 30, fal_d);
 }
 
 bestway_medence_gegecso_szivattyu_adapter();
 
 module bestway_medence_gegecso_szivattyu_adapter(){
     gege_kulso_r=34/2;
     fal_d=4;
     szivattyu_kulso_r=82.4/2;
     
     h_gege = 30;
     h_kup = 50;
     h_gyuru = 10;
     translate([0,0,h_gyuru+h_kup])gyuru(gege_kulso_r+2, gege_kulso_r-1, 30,fal_d);
     translate([0,0,h_gyuru])gyuru(szivattyu_kulso_r+fal_d, gege_kulso_r+2, h_kup, fal_d);
     
     gyuru(szivattyu_kulso_r+fal_d, szivattyu_kulso_r+fal_d, h_gyuru, fal_d);
 }
 
 // Y tömítéses véghez
 
 module Y_PVC110_belso_tomiteshez_flexi_flexi(){
     PVC110_r_belso = 55; //110mm a belső átmérő a tömített végen
     flexicso_r_belso = 51; 
     fal_d = 2;
     gyuru(PVC110_r_belso+1, PVC110_r_belso-1,50, fal_d);
     M1 = [ [ 1  , 0  , -70/90  , 0   ],
      [ 0  , 1  , 0 , 0   ],  // The "0.7" is the skew value; pushed along the y axis as z changes.
      [ 0  , 0  , 1  , 0   ],
      [ 0  , 0  , 0  , 1   ] ] ;
     translate([70,0,-90]) difference(){
        multmatrix(M1)gyuru(flexicso_r_belso+1, PVC110_r_belso+1, 90, fal_d);
        translate([-220,-75,0])cube([150,150,150]);
     }
     M2 = [ [ 1  , 0  , 70/90  , 0   ],
      [ 0  , 1  , 0 , 0   ],  // The "0.7" is the skew value; pushed along the y axis as z changes.
      [ 0  , 0  , 1  , 0   ],
      [ 0  , 0  , 0  , 1   ] ] ;
     translate([-70,0,-90])difference(){
         multmatrix(M2)gyuru(flexicso_r_belso+1, PVC110_r_belso+1, 90, fal_d);
         translate([70,-75,0])cube([150,150,150]);
     }
     translate([70,0,-140])flexicso_veg(fal_d);
     translate([-70,0,-140])flexicso_veg(fal_d);
     
 }
 
 module flexicso_veg(fal_d, flexicso_r_belso = 51){
    
 
     gyuru(flexicso_r_belso-1,flexicso_r_belso+1, 50, fal_d);
     gyuru(flexicso_r_belso, flexicso_r_belso,10,fal_d);
 }