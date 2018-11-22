use <atis_lib.scad>;


// ezeket a méreteket nyomtattam a CB-vel.
//kulso_meret=170; 
//belso_kivagas=107;
//L_szelesseg=40;
//oldalfal_vastagsag=10;
//magassag=60;

kulso_meret=100; 
belso_kivagas=60;
magassag=40;
oldalfal_vastagsag=magassag/3-10;
L_szelesseg=magassag/3*2;

pontok=[[0,0],
        [kulso_meret,0],
        [kulso_meret,L_szelesseg],
        [belso_kivagas,L_szelesseg],
        [L_szelesseg,belso_kivagas],
        [L_szelesseg,kulso_meret],
        [0,kulso_meret],
        [0,0]];

/*minkowski(){
    square(20,20);
    circle(r=5);
}*/

sarok2();

module sarok(){
// BB-hez ezt kell kitörölni.     
inset_first_layer(inset_height=0.31, inset_width=0.5, render=true)     
    translate([5,5,0])linear_extrude(height=30)        
        difference(){
            minkowski(){
                polygon(pontok);
                circle(r=2.5, $fn=5*12);
            }
            translate([70,30,0])square([40,30]);
            translate([30,70,0])square([30,40]);
        }
}

module sarok2(){
// BB-hez ezt kell kitörölni.     
    inset_first_layer(inset_height=0.31, inset_width=0.5, render=true) 
        difference(){
            translate([5,5,0])
                minkowski(){
                    union(){
                        translate([0,0,0])linear_extrude(height=15) polygon(pontok);
                        cube([kulso_meret,oldalfal_vastagsag,magassag]);
                        translate([0,60,0])cube([oldalfal_vastagsag,kulso_meret-60,magassag]);
                    }
                    cylinder(r=5, $fn=30);
                } //Minkowski
                // Lyukasztgatás nem éri meg: 118/105 x több anyagot használ és 2 órával tovább tart a nyomtatás is.
            /*for(x =[10:15:170]){
                for(y = [10:15:170]){
                    translate([x,y,0])cylinder(r=4, h = 70);
                }
            }*/
        }
}

alacsony_y = 2*(1-35/180);
ek_pontok = [[0,0],
             [0,2],
             [35, alacsony_y],
             [35,0],
             [0,0]];

module KorFureszEk(){
    difference(){
        linear_extrude(height=50) polygon(ek_pontok);
        translate([15,1.5,40])rotate([0,90,0])rotate([-90,0,0])linear_extrude(height=20) #text ("teteje");
    }
}
