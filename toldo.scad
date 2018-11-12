use <atis_lib.scad>

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
R4=r4/2+gombolyites+hezag;

//KregBosch();
//Bosch();
//translate([0,0,25])gyuru(19, 16, 20,2,$fn=104);
//translate([0,0,45]) Kreg();
module Kreg(){
    R1_kreg= 14.5;
    R2_kreg= 16;
    translate([0,0,0]) gyuru(R2_kreg,R1_kreg, 20, 2, $fn=104);
}

module Bosch(){
    translate([0,0,0])gyuru(20.5, 19, 25,2, $fn=120);
}

module KregBosch(){
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

module MakitaBosch(){
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

//BoschScheppachToldo();

module BoschScheppachToldo(){  // make me
    rotate([180,0,0 ]){
        translate([0,0,50])gyuru(99/2, 97/2, 40, 4);
        translate([0,0,30])gyuru((58+2*4)/2, 99/2, 20,4);
        gyuru((59+2*4)/2, (58+2*4)/2, 30, 4);
    }
}