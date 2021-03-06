use <../atis_lib.scad>
include <../duplo/duplo-block-lib.scad>
include <../../dotscad/pie.scad>

cube_side=3*duploRaster-gapBetweenBricks;
r_run=9;
w_run = 2*r_run;
quality=100;

scaling_factor = 2;

/*place() cuboro_No2();
place(x=1, r=90) cuboro_NoD15();
place(z=top
oro_No3();
place(x=1, y=-1, r=-90) cuboro_NoD8();*/
//cuboro_No41();



module golyok(n){ // makeme
    for(x = [-n:n]){
        for(y = [-2*n:2*n]){
            translate([x*(2*w_run),y*w_run,0]) golyo();
        }
    }
}
module golyo(){ // make me
    translate([-r_run+1,0,0])rotate([180,0,0])felgolyo();
    translate([r_run-1,0,0])rotate([180,0,0])felgolyo();
}

module felgolyo(){
    difference(){
        sphere(r=r_run-3, $fn=quality/3);
        translate([0,0,(r_run)])cube(2*r_run,center=true, $fn=quality/3);
        cylinder(r=2.1,h=r_run, center=true, $fn=quality/3);
        translate([0,0,-0.5])cylinder(r2=3, r1=2.1, h=1.5, center=true, $fn=quality/3);
    }
}

module hullam(r, d){
    //echo((2*r-d)/(2*r));
    alfa = acos((2*r-d)/(2*r));
    //echo(alfa);
    translate([-r*cos(alfa), -r*sin(alfa)]){
        iv(r, angle=alfa);
        translate([2*r-d,2*r*sin(alfa),0])
            rotate([0,0,180])
                iv(r, angle=alfa);
    }
}

module hullam_alfa(r, alfa){
    //echo((2*r-d)/(2*r+2*r_run));
    //alfa = acos((2*r-d)/(2*r+2*r_run));
    d=2*r-cos(alfa)*2*r;
    iv(r, angle=alfa);
    translate([2*r-d,(2*r)*sin(alfa),0])
        rotate([0,0,180])
            iv(r, angle=alfa);
}

module place(x=0, y=0, z, r=0){
    translate([x*cube_side, y*cube_side, z*cube_side]) rotate(r) children();
}

module cuboro_No(){
    cuboro(n="", n_rot=0, is_n_side=false){
        
    }

}

module cuboro_NoMa(){
    cuboro(n="Ma", n_rot=[0, 90, 180, 270], is_n_side=true,
           bf=false, jf=false, ba=false, ja=false, kell_also=false){
        Kozepen() translate([0,0,-22])#cylinder(r2=w_run+4.5, r1=w_run+3.5, h=51, $fn=12*(w_run+5));
    }

}


module cuboro_No1(){ // makeme
    cuboro(n="1", n_rot=[0, 90, 180, 270], is_n_side=true){
    }

}
module cuboro_NoD69(){ // makeme
    cuboro(n="D69", n_rot=[0, 90, 180], is_n_side=true, bf=false){
        Kozepen(){
            Felul() balKanyar();
            alfa=atan(fely()/cube_side);
            translate([0, fely()/2,0])rotate(alfa) lejtosAlagut();
            translate([0, -fely()/2,0])rotate(-alfa) lejtosAlagut();
        }
    }
}

module cuboro_NoD59(){ // makeme
    cuboro(n="D59", n_rot=[0, 90, 180], is_n_side=true, ba=false){
        Kozepen(){
            Felul() jobbKanyar();
            alfa=atan(fely()/cube_side);
            translate([0, fely()/2,0])rotate(alfa) lejtosAlagut();
            translate([0, -fely()/2,0])rotate(-alfa) lejtosAlagut();
        }
    }
}

module cuboro_NoD22(){ // makeme
    cuboro(n="D22", is_n_side=true, n_rot=[0,180],bf=false, ba=false, ja=false, jf=false){
        Felul() duplaAlagut();
        for (y=[fely(), -fely()])
        translate([0, y,0])rotate([0,0,90])translate([0,0, 11]) Alul() Felfele() jobbKanyar();
       
    }
}


module cuboro_NoD18(){ // makeme
    cuboro(n="D18", n_rot=[90,180], is_n_side=true, bf=false, ba=false){
        Felul(){
            felesEgeszBal();
            felesEgeszJobb();
        }
        Kozepen() lejtosAlagut();
        Alul() rotate(90) FerdeAlagutBalra();
    }

}

module cuboro_NoD17(){ // makeme
    cuboro(n="D17", is_n_side=true, n_rot=[90,0], bf=false, ba=false, ja=false, jf=false){
        Felul(){
            felesEgeszJobb();
            felesEgeszBal();
        }
        Kozepen() balKanyar();
    }
}




module cuboro_NoD16(){ // makeme
    cuboro(n="D16", is_n_side=true, n_rot=[90,180], bf=false, ba=false, ja=false, jf=false){
        Kozepen() jobbKanyar();
        /*translate([-cube_side/2, cube_side/2,0])Felul()rotate_extrude($fn=quality)
            translate([r_run+4,0,0]) circle(r=r_run, $fn=quality);*/
        Felul(){
            felesEgeszJobb();
            felesEgeszAlagut();
        }
        
    }
}

module cuboro_NoD15(){ // makeme
    cuboro(n="D15", n_rot=[0,90], is_n_side=true, bf=false, ba=false){
        Felul(){
           mirror([0,1,0]) felesEgeszAlagut();
           felesEgeszBal();
        }
        Kozepen() balKanyar();
    }

}
module cuboro_NoD9(){ // makeme
    cuboro(n="D9", n_rot=[0,180], is_n_side=true, ba=false, bf=false){
        Felul(){
            felesEgeszAlagut();
            mirror([0,1,0])felesEgeszAlagut();
        }
        Kozepen() alagut();
    }

}
module cuboro_NoD8(){ // makeme
    cuboro(n="D8", is_n_side=true, n_rot=[0,90,180],bf=false, ba=false, ja=false, jf=false){
        Felul(){
            rotate(-90) iv_180fokos(fely());
            translate([-cube_side/2-6,0,0])duplaAlagut();
        }
        rotate(180) Alul() FerdeAlagutJobbra();
    }
}

module cuboro_NoD7(){ // makeme
    cuboro(n="D7", is_n_side=true, n_rot=[0,90,180], bf=false, ba=false, ja=false, jf=false){
        Felul(){
            rotate(-90) iv_180fokos(fely());
            translate([-cube_side/2-6,0,0])duplaAlagut();
        }
        Alul() FerdeAlagutBalra();
    }
}

module cuboro_NoD6(){ // makeme
    cuboro(n="D6", is_n_side=true, n_rot=[180, 270], bf=false, ba=false, ja=false, jf=false){
        Felul() duplaJobbKanyar();
        rotate(90) Kozepen() jobbKanyar();
        rotate(90) Alul() balKanyar();
    }
}
module cuboro_NoD5(){ // makeme
    cuboro(n="D5", is_n_side=true, n_rot=[180, 270], bf=false, ba=false, ja=false, jf=false){
        Felul()duplaJobbKanyar();
        rotate(90) Kozepen() jobbKanyar();
    }
}

module cuboro_NoD4(){ //makeme
    cuboro(n="D4", n_rot=[90, 270], is_n_side=true, z_pos=-20, bf=false, ba=false, ja=false, jf=false){
        Felul(){
            duplaAlagut();
            rotate(90) alagut();
        }
        Kozepen() kereszt();
        rotate(90) Alul() alagut();
    }

}

module cuboro_NoD3(){ // makeme
    cuboro(n="D3", n_rot=[0,180], is_n_side=true, bf=false, ba=false, ja=false, jf=false){
        Felul() duplaAlagut();
        Kozepen() alagut();
        rotate(90) Alul() alagut();
    }

}
module cuboro_NoAtis1(){ // makeme
    cuboro(n="A1", n_rot=[0,180]){
        Alul() alagut();
        Kozepen() alagut();
        Felul() alagut();
    }
}

module cuboro_No2(){ // makeme
    cuboro(n="2", n_rot=[0,180]){
        Kozepen() alagut();
        Felul() alagut();
    }
}
module cuboro_No3(){ // makeme
    cuboro(n="3", n_rot=[0,180]){
        rotate([0,0,90]) Alul() alagut();
        Kozepen() alagut();
        Felul() alagut();
    }
}

module cuboro_No4(){  // makeme
    cuboro(n="4", n_rot=[0,180], is_n_side=true){
        Kozepen() alagut();
        Felul() kereszt();
    }
}

module cuboro_No5(){ // makeme
    cuboro(n="5",n_rot=[-90, 180], bf=false){
        Kozepen() alagut();
        Felul() balKanyar();
    }
}

module cuboro_No6(){ // makeme
    cuboro(n="6",n_rot=[0,270], ba=false){
        Kozepen() alagut();
        Felul() jobbKanyar();
    }
}


module cuboro_No7(){ // makeme
    cuboro(n="7",n_rot=[180,270], bf=false){
        Felul() balKanyar();
        Alul() FerdeAlagutBalra();
    }
}


module cuboro_No8(){ // makeme
    cuboro(n="8",n_rot=[180,270], bf=false){
        Felul() balKanyar();
        Alul() FerdeAlagutJobbra();
    }
}

module cuboro_No9(){ // makeme
    cuboro(n="9", n_rot=[0,180]){
        Felul() alagut();
        Alul() FerdeAlagutBalra();
    }
}

module cuboro_No10(){ // makeme
    cuboro(n="10", n_rot=[0,180]){
        Felul() alagut();
        Alul() FerdeAlagutJobbra();
    }
}

module cuboro_No11(){ // makeme
    cuboro(n="11", n_rot=[90, 180, 270], is_n_side=true){
        Felul() kereszt();
        Kozepen() Felfele() jobbKanyar();
    }
}


module cuboro_No12(){ // makeme
    cuboro(n="12", n_rot=[90, 180, 270, 360], is_n_side=true){
        Felul() kereszt();
        translate([0,0, 11]) Alul() Felfele() jobbKanyar();
    }
}

module cuboro_No13(){ // makeme
    cuboro(n="13",is_n_side=true, n_rot=[0,180], bf=false, ja=false){
        Felul(){
            balKanyar();
            rotate([0,0,90]) jobbKanyar();
        }
        Kozepen() alagut();
    }
}


module cuboro_No14(){ // makeme
    cuboro(n="14", n_rot=[0,90,180,270], is_n_side=true, z_pos=-20){
        Felul() kereszt();
        Kozepen() kereszt();
    }
}

module cuboro_No15(){ // makeme
    cuboro(n="15", n_rot=[180,270], bf=false){
        Felul() balKanyar();
        Kozepen() lejtosAlagut();
    }
}

module cuboro_No16(){ // makeme
    cuboro(n="16",n_rot=[-90,0],ba=false){
        Felul() jobbKanyar();
        Kozepen() lejtosAlagut();
    }
}


module cuboro_No17(){ // makeme
    cuboro(n="17",n_rot=[0,270],ba=false){
        Felul() jobbKanyar();
        rotate([0,0,0])Alul() FerdeAlagutBalra();
    }
}

module cuboro_No18(){ // makeme
    cuboro(n="18",n_rot=[180,270], bf=false){
        Felul() balKanyar();
        rotate([0,0,0])Alul() FerdeAlagutJobbra();
    }
}

module cuboro_No21(){ // makeme
    cuboro(n="21", n_rot=[90,180,270], is_n_side=true){
        Felul() kereszt();
        Kozepen() Felfele() jobbKanyar();
        Alul() alagut();
    }
}

module cuboro_No22(){ // makeme
    cuboro(n="22", n_rot=[0,180]){
        Felul() alagut();
        //translate([0,gapBetweenBricks,0])
        rotate([0,0,90])translate([0,0, 11]) Alul() Felfele() jobbKanyar();
    }
}

module cuboro_No23(){ // makeme
    cuboro(n="23", n_rot=[0,180]){
        Felul(){ alagut();
        translate([cube_side/2,0,0])
            scale([2*cube_side/(cube_side+w_run),1,1])
                hull()
                    rotate([90,0,0])
                        rotate_extrude(convexity = 10)
                            translate([cube_side/2, 0, 0])
                                circle(r = r_run);
        }
    }
}

module cuboro_No24(){ // makeme
    cuboro(n="24", n_rot=[180,0]){
        Felul() alagut();
        rotate(90)Kozepen() lejtosAlagut();
    }
}

module cuboro_No25(){ // makeme
    cuboro(n="25",n_rot=[0,270],ba=false){
        Felul() jobbKanyar();
        Kozepen() alagut();
        rotate(90) Alul() alagut();
    }
}

module cuboro_No26(){ // makeme
    cuboro(n="26",n_rot=[180, 270], bf=false){
        Felul() balKanyar();
        Kozepen() alagut();
        rotate(90) Alul() alagut();
    }
}

module cuboro_No27(){ // makeme
    cuboro(n="27",n_rot=180, bf=false){
        Felul(){ balKanyar();
            alagut();
        }
        Kozepen() alagut();
    }
}

module cuboro_No28(){ // makeme
    cuboro(n="28",n_rot=0, ba=false){
        Felul(){ jobbKanyar();
            alagut();
        }
        Kozepen() alagut();
    }
}

module cuboro_No29(){ // makeme
    cuboro(n="29", n_rot=[0,180]){
        Felul() alagut();
        Alul(){
            FerdeAlagutBalra();
            rotate(180)FerdeAlagutJobbra();
        }
    }
}

module cuboro_No30(){ // makeme
    cuboro(n="30", n_rot=[0,180]){
        Felul() alagut();
        Kozepen() alagut();
        Alul() alagut();
    }
}

module cuboro_No31(){ // makeme
    cuboro(n="31", is_n_side=true, n_rot=[90,0,270]){
        Felul() kereszt();
        Felfele() Kozepen() balKanyar();
        Alul() jobbKanyar();
    }
}

module cuboro_No33(){ // makeme
    cuboro(n="33", n_rot=[0,180]){
        Felul() alagut();
        rotate(90) Kozepen() alagut();
        Alul() alagut();
    }
}



module cuboro_No35(){ // makeme
    cuboro(n="35", n_rot=[0,180], is_n_side=false){
        Felul() alagut();
        Kozepen() alagut();
        Alul() balKanyar();
    }
}

module cuboro_No36(){ // makeme
    cuboro(n="36", n_rot=[0,180]){
        Felul() alagut();
        Kozepen() alagut();
        Alul() jobbKanyar();
    }
}

module cuboro_No37(){ // makeme
    cuboro(n="37", n_rot=[0,270], ba=false){
        Felul() jobbKanyar();
        Kozepen() alagut();
        rotate(180) Alul() jobbKanyar();
    }
}

module cuboro_No38(){ // makeme
    cuboro(n="38", n_rot=[180, 270], bf=false){
        Felul() balKanyar();
        Kozepen() alagut();
        rotate(180) Alul() jobbKanyar();
    }
}

module cuboro_No39(){ // makeme
    cuboro(n="39", n_rot=[0,270], ba=false){
        Felul() jobbKanyar();
        Kozepen() alagut();
        rotate(90) Alul() jobbKanyar();
    }
}


module cuboro_No40(){ // makeme
    cuboro(n="40", n_rot=[180, 270], bf=false){
        Felul() balKanyar();
        Kozepen() alagut();
        rotate(0) Alul() balKanyar();
    }
}


module cuboro_No41(){ // makeme
    cuboro(n="41", n_rot=[90,0,270], is_n_side=true){
        Felul() kereszt();
        Felfele() Kozepen() balKanyar();
        Alul() jobbKanyar();
    }
}


module cuboro_No42(){ // makeme
    cuboro(n="42", n_rot=[0, 90, 180, 270], is_n_side=true, ba=false, bf=false, ja=false, jf=false){
        Felul() translate([0,0,-10])cylinder(r2=w_run+5, r1=r_run, h=11, $fn=12*(w_run+5));
        translate([0,0, 11]) Alul() Felfele() jobbKanyar();
    }
}


module cuboro_No43(){ // makeme
    cuboro(n="43", n_rot=[0, 180], is_n_side=false){
        Felul() alagut();
        Kozepen() jobbKanyar();
        Alul() alagut();
    }
}

module cuboro_No44(){ // makeme
    cuboro(n="44", n_rot=[0, 270], ba=false){
        Felul() jobbKanyar();
        Kozepen() jobbKanyar();
        rotate(180) Alul() jobbKanyar();
    }
}

module cuboro_No45(){ // makeme
    cuboro(n="45", n_rot=[0, 270], ba=false){
        Felul() jobbKanyar();
        Kozepen() jobbKanyar();
        Alul() balKanyar();
    }
}

module cuboro_No46(){ // makeme
    cuboro(n="46", n_rot=[180, 270], bf=false){
        Felul() balKanyar();
        Kozepen() balKanyar();
        Alul() jobbKanyar();
    }
}

module cuboro_No50(){ // makeme
    cuboro(n="50", n_rot=[0, 270], ba=false){
        Felul() jobbKanyar();
        Kozepen() jobbKanyar();
        Alul() jobbKanyar();
    }
}

module cuboro_No51(){ // makeme
    cuboro(n="51", n_rot=[90, 180, 270], is_n_side=true){
        Felul() kereszt();
        Kozepen() Felfele() jobbKanyar();
        Alul() jobbKanyar();
    }
}


module cuboro_No53(){ // makeme
    cuboro(n="53", n_rot=[0,180]){
        Felul(){
            alagut();
            translate([cube_side/2,0,0])
                scale([2*cube_side/(cube_side+w_run),1,1])
                    hull()
                        rotate([90,0,0])
                            rotate_extrude(convexity = 10)
                                translate([cube_side/2, 0, 0])
                                    circle(r = r_run);
        }
        Alul() alagut();
    }
}

module cuboro_No54(){ // makeme
    cuboro(n="54", n_rot=[0, 180], is_n_side=false){
        Felul() vegzodes();
        rotate(180) Alul() FerdeAlagutBalra();
    }
}

module cuboro_No55(){ // makeme
    cuboro(n="55", n_rot=[0, 180], is_n_side=false){
        Felul() vegzodes();
        Alul() FerdeAlagutJobbra();
    }
}

module cuboro_No57(){ // makeme
    cuboro(n="57",n_rot=180, bf=false){
        Felul(){ balKanyar();
            alagut();
        }
        Kozepen() alagut();
        rotate(180)Alul() balKanyar();
    }
}

module cuboro_No58(){ // makeme
    cuboro(n="58",n_rot=0, ba=false){
        Felul(){ jobbKanyar();
            alagut();
        }
        Kozepen() alagut();
        rotate(180)Alul() jobbKanyar();
    }
}

module cuboro_No61(){ // makeme
    cuboro(n="61", n_rot=[90, 180, 270], is_n_side=true){
        Felul() kereszt();
        Kozepen() Felfele() jobbKanyar();
        rotate(90) Alul() jobbKanyar();
    }
}


module cuboro_No65(){ // makeme
    cuboro(n="65", n_rot=[0, 270], ba=false){
        Felul() jobbKanyar();
        Kozepen() balKanyar();
        Alul() jobbKanyar();
    }
}

module cuboro_No66(){ // makeme
    cuboro(n="66", n_rot=[0, 270], ba=false){
        Felul() jobbKanyar();
        rotate(-90)Kozepen() balKanyar();
        Alul() jobbKanyar();
    }
}

module cuboro_No71(){ // makeme
    cuboro(n="71", n_rot=[270,180, 90], is_n_side=true){
        Felul() kereszt();
        Kozepen() Felfele() jobbKanyar();
        rotate(90) Alul() alagut();
    }
}

module cuboro_No92(){ // makeme
    cuboro(n="92", n_rot=[270, 90]){
        Felul() alagut();
        translate([0,0,15]){
            Alul() Felfele() #jobbKanyar();
            Alul() Felfele() #balKanyar();
        }
    }
}
module cuboro_No93(){ // makeme
    cuboro(n="93", n_rot=[0,180]){
        Felul(){
            alagut();
            nagyKivagas();
        }
        rotate(90) Alul() alagut();
    }
}


module cuboro_No94(){ // makeme
    cuboro(n="94", n_rot=[0, 180], is_n_side=false){
        Felul() alagut();
        Kozepen() lejtosAlagut();
    }

}

module cuboro_No95(){ // makeme
    cuboro(n="95", n_rot=[0, 180]){
        Felul(){
            alagut();
            nagyKivagas();
        }
        Alul() balKanyar();
    }
}

module cuboro_No96(){ // makeme
    cuboro(n="96", n_rot=[0, 180]){
        Felul(){
            alagut();
            nagyKivagas();
        }
        Alul() jobbKanyar();
    }
}

module cuboro_No97(){ // makeme
    cuboro(n="97", n_rot=[0, 180]){
        Felul(){
            alagut();
            nagyKivagas();
        }
        rotate(180)Alul() jobbKanyar();
    }
}

module cuboro_No98(){ // makeme
    cuboro(n="98", n_rot=[0, 180]){
        Felul(){
            alagut();
            nagyKivagas();
        }
        rotate(180)Alul() balKanyar();
    }
}

module cuboro_No104(){ // makeme
    cuboro(n="104", n_rot=[0, 180], is_n_side=true, z_pos=-20){
        Felul() kereszt();
        Kozepen() kereszt();
        Alul() alagut();
    }

}

module cuboro_No105(){ // makeme
    cuboro(n="105", n_rot=[90,180], jf= false, is_n_side=false){
        rotate(-90) Felul() balKanyar();
        Kozepen() lejtosAlagut();
    }

}

module cuboro_No106(){ // makeme
    cuboro(n="106", n_rot=[0, 90], ja=false, is_n_side=false){
        rotate(180) Felul() balKanyar();
        Kozepen() lejtosAlagut();
    }

}

module cuboro_No107(){ // makeme
    cuboro(n="107", n_rot=[0, -90], ba=false, is_n_side=false){
        rotate(90) Felul() balKanyar();
        Alul() FerdeAlagutBalra();
    }

}

module cuboro_No108(){ // makeme
    cuboro(n="108", n_rot=[0, 90], ja=false, is_n_side=false){
        rotate(180) Felul() balKanyar();
        Alul() FerdeAlagutJobbra();
    }

}

module cuboro_No113(){ // makeme
    cuboro(n="113", n_rot=[0, 180], bf=false, ja=false, is_n_side=true){
        Felul(){
            balKanyar();
            rotate(90) jobbKanyar();
        }
        Kozepen() alagut();
        Alul() alagut();
    }

}


module cuboro(n,
              n_rot = [0], 
              is_n_side=false,
              z_pos=0,
              bf=true, jf=true, ba=true, ja=true,
              kell_also=true){
    sf = scaling_factor;
    k=sf*48/2-8;
    bks = [[k,k,0],
           [k,-k,0],
           [-k,k,0],
           [-k,-k,0]];
    gombolyites=1;
    translate([0,0,k+8-gombolyites/2])
        difference(){
            minkowski(){
                inner_cube_side = sf*cube_side-2*gombolyites-gapBetweenBricks;
                color([1,0,0])cube(inner_cube_side, center=true);
                sphere(r=gombolyites, $fn=gombolyites*24); // 0.3mm resolution due to being at the bottom too.
            }
            scale(sf) children();            
            if (kell_also) translate([0,0,-23.8*sf+duploHeight/2]) also_csatlakozo();
            for(a=n_rot){
                rotate(a) 
                    if (is_n_side){
                       translate([0, -cube_side/2*sf+2, sf*z_pos])
                           rotate([90,0,0]) 
                               linear_extrude(height=2)
                                   scale(sf)text(text=n, font="Courier Bold", size=8, halign="center");
                    }
                    else{   
                       translate([0,sf*12,(cube_side/2)*sf-2])
                           linear_extrude(height=2.2) 
                               scale(sf)text(text=n, font="Courier Bold", size=8, halign="center");
                    }
            }
        }       
    translate([0,0,(2*(k+8)-1)]){
        if (bf) translate([-k, k, 0]) csatlakozo();
        if (jf) translate([k, k, 0]) csatlakozo();
        if (ba) translate([-k, -k, 0]) csatlakozo();
        if (ja) translate([k, -k, 0]) csatlakozo();
    }
}

module Felul(){
    //translate([-gapBetweenBricks, 0,cube_side/2])
    translate([0, 0,cube_side/2])
        children();
}

module Kozepen(){
    //translate([-gapBetweenBricks, 0,0])
    translate([0, 0,0])
        children();
}

module Alul(){
    //translate([-gapBetweenBricks, 0, -cube_side/2])
    translate([0, 0, -cube_side/2])
        children();
}

module Felfele(){
    //translate([cube_side/2, cube_side/2, cube_side])
    rotate([0,90,0]) children();
}

module Lefele(){
    translate([cube_side/2, cube_side/2, -0])rotate([0,90,0]) children();
}

module vegzodes(){
    translate([cube_side/2,0,0])scale([4,1,1])sphere(r=r_run, center=true, $fn=r_run*12);
}

module nagyKivagas(){
    translate([cube_side/2,0,0])
                scale([2*cube_side/(cube_side+w_run),1,1])
                    hull()
                        rotate([90,0,0])
                            rotate_extrude($fn=quality)
                                translate([cube_side/2, 0, 0])
                                    circle(r = r_run,$fn=r_run*12);
}
    
function fely(n=1) = r_run+n*(cube_side-2*w_run)/3/2;

// Curve out blocks
module duplaAlagut(){
    translate([0,fely()])alagut();
    translate([0,-fely()])alagut();    
}

module alagut(){
        rotate([0,90,0])
            cylinder(r=r_run, h=60, center=true,$fn=r_run*12);
}

module lejtosAlagut(){
    translate([0,0,-6.1])rotate([0,15,0]) alagut();
}

module kereszt(){
    alagut();
    translate([0, cube_side/2+1,0])
        rotate([90,0,0])
            cylinder(r=r_run, h=50, $fn=r_run*12);
}

module jobbKanyar(){
     translate([-cube_side/2,-cube_side/2,0])
         intersection(){
             rotate_extrude($fn=quality) translate([cube_side/2,0,0]) circle(r=r_run, $fn=r_run*12);
             translate([0,0,-cube_side/2])cube(cube_side, center=false);
         }
     translate([-cube_side/2-20,0,0])rotate([0,90,0])cylinder(r=r_run,h=20, $fn=r_run*12);
}

module balKanyar(){
    mirror([0,1,0]) jobbKanyar();
}

module FerdeAlagutBalra(){
    mirror([1,0,0]) FerdeAlagutJobbra();
}

/*module FerdeAlagutJobbra(){
    import("FerdeAlagutJobbra.stl");
}*/

module FerdeAlagutJobbra(){
    s=220/quality;
    translate([cube_side/2,-cube_side/2,cube_side/2])
        for ( z = [-20:s:200]) {
            rotate(z*0.5)
                translate([0,cube_side/2,-z/179*duploHeight*.8])
                    rotate([0,79,0])rotate([0,0,z*1.41])cylinder(r=r_run, h=70/quality, $fn=r_run*12);
        }
}

module csatlakozo(){
    scale([0.95, .95, 1])duplo(1,1,0,true,true);
}

module also_csatlakozo(){
    difference(){
        scale([scaling_factor,scaling_factor, 1])cube([47,47,9.6],center=true);
        translate([0,0,1.4])scale([1,1,1.3])duplo(3*scaling_factor,3*scaling_factor,1,false,true);
    }
}

module iv_90fokos(r){
    iv(r, 90);
}

module iv_180fokos(r){
    iv(r, 180);
}

module iv(r, angle){
    intersection(){
        rotate_extrude($fn=quality)
            translate([r,0,0]) circle(r=r_run, $fn=r_run*12);
        translate([0,0,-r_run])pie(r+r_run+1, angle, height=2*r_run);
    }
}

module duplaJobbKanyar(){
    rotate(90) translate([-cube_side/2, -cube_side/2,0]){
                iv_90fokos(r=fely(2));
                iv_90fokos(r=cube_side/2+fely());
    }
}

module felesEgeszJobb(){
    translate([-(cube_side-w_run)/2+2, -2*fely(1.5),0]) iv_90fokos(r=fely(2));
            translate([-30-fely(), -fely(),0]) alagut();
}

module felesEgeszBal(){
    mirror([0,1,0]) felesEgeszJobb();
}

module felesEgeszAlagut(){
    translate([-33-fely(), fely(),0]) alagut();
    translate([5,fely()/2,0])rotate(-90)mirror([1,0,0])hullam(r=fely()+25, d=fely());
}

module alternativeKanyar(){
    cylinder(r=r_run, cube_side/2);
    rotate([0,90,0])cylinder(r=r_run, cube_side/2);
    sphere(r=r_run);
}