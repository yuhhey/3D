use <atis_lib.scad>

vastagsag = 15;
agy_szelesseg=900;
agy_magassag=250;
agy_hossz=2000;
tamla_magassag=100;
tamla_atfedes=50;
tamla_hossz=1200;


difference(){
    deszka(agy_hossz,agy_szelesseg,agy_magassag, vastagsag, "");
    translate([0,0,-vastagsag/2-0.1])deszka(agy_hossz-2*vastagsag,agy_szelesseg-2*vastagsag,agy_magassag-vastagsag, vastagsag, "");
    for(x = [-agy_hossz/2+120:160:agy_hossz/2-80]){
        translate([x,0,0])deszka(80, agy_szelesseg-2 * vastagsag, agy_magassag+30, vastagsag, "rács");
    }
}
translate([(agy_hossz-tamla_hossz)/2,(agy_szelesseg+vastagsag)/2,(agy_magassag+tamla_magassag)/2-tamla_atfedes])deszka(tamla_hossz, vastagsag, tamla_magassag, vastagsag, "oldaltámla");
translate([(agy_hossz+vastagsag)/2,vastagsag/2,(agy_magassag+tamla_magassag)/2-tamla_atfedes])deszka(vastagsag, agy_szelesseg+vastagsag, tamla_magassag, vastagsag, "fejtámla");

//cube([2000,agy_magassag,agy_szelesseg]);