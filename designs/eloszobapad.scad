use <atis_lib.scad>

//minden adat mm-ben
pad_szelesseg = 1800;
pad_magassag = 400;
pad_melyseg = 360; // Ez csak egy maximum
av=35;
lab_vastagsag = 25;
lec_vastagsag = 25  ;

//pad_model(true);

/* Az ülőrészen lécből mindig 1-gyel több kell mint résből, ezért a pad mélységét mindig páratlan részre kell felosztani. A szélén éppen fedésben kell lennie a lécnek, ezért a pad_melyseg paramétert csak maximális értékként kezeljük. A pm lesz a kalkulált mélység, amivel a pad normálisan néz ki.
   A páratlanság miatt legrosszabb esetben a pad majdnem 2 lec_vastagsággal  lesz keskenyebb mint a pad_melyseg.

pm = (round(pad_melyseg/lec_vastagsag/2)*2-1)*lec_vastagsag;
*/

/* Az ülőrész lécei közötti réseket lehet csökkenteni. Általában néhány mm elég. Ebben az esetben a pad mélysége a megadott méret lesz.
*/

pm=pad_melyseg;
lec_no = ceil(pad_melyseg/2/lec_vastagsag);

res_sz = (pad_melyseg - lec_no*lec_vastagsag)/(lec_no-1);
echo(res_sz);



//pad_lab();

pad_robbantott_abra(true, rf=[1.1, 1, 1.4]);

module pad_model(kozepso_lab=false){
    pad_robbantott_abra(kozepso_lab);
}

module pad_lab(){
    difference(){
        cube([lab_vastagsag, pm, pad_magassag], center=true);
        for(y = [-(pm-lec_vastagsag)/2:lec_vastagsag+res_sz:pm/2]){
            translate([0, y, (pad_magassag-av)/2])cube([av, lec_vastagsag,av], center=true);
        }
    }
}

module pad_lec(){
    cube([pad_szelesseg, lec_vastagsag, av], center=true);
}

module pad_robbantott_abra(kozepso_lab=false, rf=[1,1,1])
{
    rfx=rf[0];
    rfy=rf[1];
    rfz=rf[2];
    translate([-(pad_szelesseg-lab_vastagsag)/2*rfx,0,0])pad_lab();
    if (kozepso_lab){
        translate([pad_szelesseg/6,0,0])pad_lab();
        translate([-pad_szelesseg/6,0,0])pad_lab();
    }
    translate([(pad_szelesseg-lab_vastagsag)/2*rfx, 0, 0])pad_lab();
    for(y = [-pm/2:lec_vastagsag+res_sz:pm/2-1]){
        translate([0, (y+lec_vastagsag/2)*rfy, (pad_magassag-av)/2*rfz]) pad_lec();
    }
}   