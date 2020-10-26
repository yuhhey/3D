use <atis_lib.scad>


//fogascimke("Hanga");
//fogascimke("Kamilla");
//fogascimke("Bulcsú");
//fogascimke("Olívia");
//fogascimke("Anya");
//fogascimke("Apa");

//ApaPolcCimke();
//AnyaPolcCimke();
//HangaPolcCimke();
//KamillaPolcCimke();
//OliviaPolcCimke();
BulcsuPolcCimke();

module BulcsuPolcCimke(){ // make me
    polccimke("Bulcsú");
}

module HangaPolcCimke(){ // make me
    polccimke("Hanga");
}

module KamillaPolcCimke(){ // make me
    polccimke("Kamilla");
}

module OliviaPolcCimke(){ // make me
    polccimke("Olívia");
}

module AnyaPolcCimke(){ // make me
    polccimke("Anya");
}

module ApaPolcCimke(){ // make me
    polccimke("Apa");
}

module fogascimke(t){
    v = "2.0";
    r_rud = 4; //a rudazatt sugara.

    inset_first_layer(inset_height=0.31,inset_width=0.3, render=true)difference(){
        cube([67, 12, 30]);
        r = 4.2;
        x = (67-41)/2-r_rud; 
        y=2.2;
        translate([x,y,0])cylinder(r=r, h=30, $fn=r*12);
        translate([67-x,y,0])cylinder(r=r, h=30, $fn=r*12);
        translate([67/2,9.5,20])rotate([-90,0,0])linear_extrude(height=3)text(t, size=10, halign="center", font="Purisa:style=Bold");
        translate([67/2,0,20])rotate([-90,0,0])linear_extrude(height=3)mirror([0,1,0])text(v, size=5, halign="center", font="Purisa:style=Bold");
    }
}

module polccimke(t){
    pw=15; //shelf width in mm
    w = 2;
    v = "v2";
    inset_first_layer(inset_height=0.31,inset_width=0.3, render=true)difference(){
        difference(){
            hull(){
                cube([50, pw+2*w, pw]);
                translate([0,-25+pw/2,0])rotate(90) cube([50, pw+2*w, pw]);
            }
            translate([-5,2,w])cube([51+5, pw,pw]);
            translate([0,-25+pw/2-0.5,0])rotate(90) translate([0,2,w])cube([51, pw,pw]);
            translate([-pw, pw/2, 0])linear_extrude(height=3)mirror([0,1,0])text(t, size=10, valign="center",halign="", font="Purisa:style=Bold");
            translate([10,0,pw])rotate([-0,180,0])linear_extrude(height=3)mirror([0,1,0])text(v, size=7, halign="center", font="Purisa:style=Bold");
        }
    }
}