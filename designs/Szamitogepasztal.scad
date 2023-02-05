use <atis_lib.scad>

// Paraméterek
vastagsag = 20;
fiok_belso_magassag = 100;
fal_magassag = 500;
szelesseg = 2*650;
asztal_melyseg = 500;

// Számított méretek
teljes_magassag = 2 * vastagsag + fal_magassag + fiok_belso_magassag;
teljes_melyseg = 2 * vastagsag + asztal_melyseg;
//deszka(10,20,30,vastagsag,"próba");

translate([0,vastagsag/2,teljes_magassag/2]){
    szel();
    translate([0,-vastagsag,0])szel();
    translate([0,-2*vastagsag,0])szel();
    translate([0, szelesseg-vastagsag, 0])szel();
    translate([0, szelesseg, 0])szel();
    translate([0, szelesseg+vastagsag, 0])szel();
    
}
translate([teljes_melyseg/2-vastagsag,(szelesseg-2*vastagsag)/2+vastagsag, vastagsag/2]){
    asztallap();
    #translate([0, 0, fiok_belso_magassag+vastagsag])asztallap();
}

module szel(){
    deszka(2*vastagsag, vastagsag, teljes_magassag, vastagsag, "Szél Függőleges");
    translate([vastagsag+asztal_melyseg/2, 0, -fal_magassag/2])deszka(asztal_melyseg, vastagsag, 2*vastagsag+fiok_belso_magassag, vastagsag, "Szél vízszintes");
}

module asztallap(){
    deszka(teljes_melyseg, szelesseg-2*vastagsag, vastagsag, vastagsag, "asztallap");
}
