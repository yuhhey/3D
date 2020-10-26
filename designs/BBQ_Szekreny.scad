
// A tömbök elemei: szélesség, mélység, magasság
munkalap = [1950, 650, 30]; 
tarolo = [1600, 610, 800];
fiok_elolap_v = 15;
korpusz_eltolas = (munkalap[1]-tarolo[1]-fiok_elolap_v)/2+fiok_elolap_v;
difference(){
    union(){
        translate([0,0,800])cube(munkalap); // asztallap
        translate([munkalap[0]-60, (munkalap[1]-490)/2, 800-60]) rotate([-90,0,0])alufolia();
        translate([100,korpusz_eltolas,0])cube(tarolo); // Pakoló rész egy tömegben. Szándékosan aszimetrikus. A 800mm alacsony lesz. Még ki kell találni mennyi legyen
    }    
    translate([200+385,65,100])faszen();
    translate([200+385,373,100])faszen();
    translate([200+365,160,430])rotate(90)translate([0,0,0])hutotaska_helyenek();
    translate([200,75,100])cube([365,600,300]); // Alsó pakoló. Ide beférhet még a tárcsa, gázégő (ez akár lóghat is valahol, tárcsa, bogrács
    translate([1000-200,75,100])cube([550, 620,130]); // Vágódeszka helye.  TODO: fiókot neki, hogy ne piszkolódjon.
    #translate([1600-230,65,100])cube([200, 620, 650]); // Inkább fiókos irányban
}
translate([200+170+20, 75,100])rotate(90)faszengyujtokemeny();
translate([1070,260+75,100])vagodeszka(); 
// Mellette elférhet a sütőlap, a bogrács, gázégőfej, 
// fakanál hosszában az asztallap alatt


module alufolia(){
    //cube([490, 140, 90]);
    cylinder(r = 45, h = 490);
}

module vagodeszka(){
    cylinder(r=260, h= 115);
}

module homero6os(){
    cube([200,140,55]);
}

module gumikesztyu(){
    cube([220, 120, 60]);
}

module landliebe(){
    cylinder(r=43, h=125);
}

module kotanyiuveg(){
    cylinder(r=25, h=150);
}

module faszengyujto(){
    cube([205, 70,45]);
}

module faszengyujtokemeny(){
    //cylinder(r=125, h=280);
    cube([280, 170, 280]);
}

module faforgacsosdobos(){
    cube([210, 230, 75]);
}

module hutotaska(){
    cube([420, 285, 380]);
}

module hutotaska_helyenek(){
    cube([500, 365, 430]);  // széltében és hosszában 4 centivel nagyobb oldalanként mint a táska és 5cm-rel magasabb
}

module faszen(){
    cube([190, 310, 650]); // Az eredeti szélesség és mélység + 2 centi a kényelmes pakoláshoz
}
