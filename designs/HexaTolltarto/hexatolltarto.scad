//kozepes80mm_2helyes();

eredeti_2helyes();

module kozepes80mm_2helyes(){
    difference(){
        eredeti_2helyes();
        translate([0,0,130])cube([200,200,100], center=true);
    }
}

module kozepes50mm_2helyes(){
    difference(){
        eredeti_2helyes();
        translate([0,0,100])cube([200,200,100], center=true);
    }
}

module eredeti_2helyes(){
    translate([16,46.5,0])import("Porta_Lapis_1.0-2p.stl");
}