DOC_SCALING_FACTOR = 1;
DOC_HEIGHT=25;
use <../dimlines/scad/dimlines.scad>;

lemez_vastagsag = 25;
vekony_lemez_vastagsag = 10;

polcnut_melyseg = 8;
polcnut_magassag = 12;
polckoz = 120;
doboz_melysege = 420;
doboz_szelessege = 300;
szekreny_melyseg = doboz_melysege + 16;
oszlopok_szama = 3;
szekreny_magassag = 680;

szelsolap_magassag = szekreny_magassag - vekony_lemez_vastagsag;

polcok_szama = floor(szelsolap_magassag / polckoz);
echo("Polcok száma: ", polcok_szama);





szekreny_szelessege = lemez_vastagsag * 
                        (oszlopok_szama + 1) + 
                        oszlopok_szama * 
                        (doboz_szelessege - 2 * polcnut_melyseg);
echo("Szekrény szélessége: ",  szekreny_szelessege);
echo("Szekrény magassága: ", szekreny_magassag);
echo("Szekrény mélysége", szekreny_melyseg);


kimarado = szelsolap_magassag - (10 + polcok_szama * polckoz);  // A legalsó polchely magasság 10mm-rel nagyobb mint a többié

kimarado_felul = (kimarado - vekony_lemez_vastagsag)/2;

kimarado_alul =  kimarado - kimarado_felul;

echo("Szekrény oldallap magassága: ", szelsolap_magassag);
echo("Kivagni felül: ", kimarado_felul);
echo("Kivagni alul: ", kimarado_alul);

echo("Szekrény köztes elválasztó magassága: ", szelsolap_magassag - kimarado_alul);

szelso_lap();

module szelso_lap(){
   translate([0,0,szelsolap_magassag]) rotate([180,0,0])
        difference(){
            cube([lemez_vastagsag,
                  szekreny_melyseg,
                  szelsolap_magassag]);
            echo("Polchelyek az oldallap tetejétől mérve");
            for(i = [1:polcok_szama]){
                k = kimarado_felul + polckoz * (i - 1);
                echo("Polchely: ", k);
                translate([0,0,k]){
                    cube([polcnut_melyseg,
                          szekreny_melyseg,
                          polcnut_magassag]);
                   translate([9,szekreny_melyseg/2,0]) rotate([-90,0,90])
                        linear_extrude(height=10)text(text=str(k));
                }
            }
            cube([lemez_vastagsag,
                  lemez_vastagsag,
                  kimarado_felul]);
            translate([0,szekreny_melyseg - lemez_vastagsag,0])
                cube([lemez_vastagsag,
                      lemez_vastagsag,
                      kimarado_felul]);
            translate([0,
                      szekreny_melyseg - lemez_vastagsag,
                      szelsolap_magassag-kimarado_alul])
                cube([lemez_vastagsag,
                      lemez_vastagsag,
                      kimarado_alul]);
            translate([0,0,szelsolap_magassag-kimarado_alul]){
                cube([lemez_vastagsag,
                      lemez_vastagsag,
                      kimarado_alul]);
                cube([10, szekreny_melyseg,10]);
                rotate([-90,0,90])#linear_extrude(height=10)
                    text(text=str(szelsolap_magassag-kimarado_alul));
            }
        }
}