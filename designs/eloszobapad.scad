use <atis_lib.scad>

//minden adat mm-ben
pad_szelesseg = 1800;
pad_magassag = 400;
pad_melyseg = 360; // Ez csak egy maximum
av=35;
lab_vastagsag = 25;
lec_vastagsag = 25  ;
gap_equals_to_lec = false;

//pad_model(true);

/* Az ülőrészen lécből mindig 1-gyel több kell mint résből, ezért a pad mélységét mindig páratlan részre kell felosztani. A szélén éppen fedésben kell lennie a lécnek, ezért a pad_melyseg paramétert csak maximális értékként kezeljük. A pm lesz a kalkulált mélység, amivel a pad normálisan néz ki.
   A páratlanság miatt legrosszabb esetben a pad majdnem 2 lec_vastagsággal  lesz keskenyebb mint a pad_melyseg.
*/
pm = gap_equals_to_lec ? (round(pad_melyseg/lec_vastagsag/2)*2-1)*lec_vastagsag: pad_melyseg;;


/* Az ülőrész lécei közötti réseket lehet csökkenteni. Általában néhány mm elég. Ebben az esetben a pad mélysége a megadott méret lesz.
*/
lec_no = ceil(pm/2/lec_vastagsag);

res_sz = (pm - lec_no*lec_vastagsag)/(lec_no-1);

//pad_robbantott_abra(true, rf=[1.2, 1, 1.8]);

pad_model(true);
translate([lec_vastagsag/2+3, -pad_melyseg/2, -pad_magassag/2])lada();
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
    echo("Padláb");
    echo("Magasság:", pad_magassag);
    echo("Vastagság:", lab_vastagsag);
    echo("Mélység:", pm);
    echo("Hézag szélesség:", res_sz);
    echo("Hézeg mélység:", av);
    echo("Kivágás szélesség:", lec_vastagsag);
    rfx=rf[0];
    rfy=rf[1];
    rfz=rf[2];
    translate([-(pad_szelesseg-lab_vastagsag)/2*rfx,0,0])pad_lab();
    if (kozepso_lab){
        // 2 középső lábbal
        //translate([pad_szelesseg/6,0,0])pad_lab();
        //translate([-pad_szelesseg/6,0,0])pad_lab();
        // 1 középső lábbal
        translate([0,0])pad_lab();
    }
    translate([(pad_szelesseg-lab_vastagsag)/2*rfx, 0, 0])pad_lab();
    for(y = [-pm/2:lec_vastagsag+res_sz:pm/2-1]){
        translate([0, (y+lec_vastagsag/2)*rfy, (pad_magassag-av)/2*rfz]) pad_lec();
    }
}  

module lada(){
    l_sz=855;
    l_mag=360;
    l_mely=330;
    sarok_vastagsag = lec_vastagsag;
    sarkok = [[0,0],
               [l_sz - sarok_vastagsag, 0],
               [0, l_mely - sarok_vastagsag],
               [l_sz - sarok_vastagsag, l_mely - sarok_vastagsag],
               [(l_sz - sarok_vastagsag)/2, 0],
               [(l_sz - sarok_vastagsag)/2, l_mely - sarok_vastagsag]];
    for(s = sarkok){
        translate([s[0], s[1], 0]) cube([sarok_vastagsag, sarok_vastagsag, l_mag]);
    }
    cube([l_sz, l_mely, lec_vastagsag]);
    lec_v = 10;
    lec_sz = 30;
    n_lec = 7;
    dz = ((l_mag - lec_vastagsag)-n_lec*lec_sz)/n_lec+lec_sz;
    echo(dz);
    for(z = [lec_vastagsag+ res_sz : dz : l_mag]){
        echo(z);
        translate([0,0,z]){
            cube([l_sz, lec_v, lec_sz]);
            translate([0, l_mely - lec_v, 0])cube([l_sz, lec_v, lec_sz]);
            rotate(-0)cube([lec_v, l_mely, lec_sz]);
            translate([l_sz-lec_v, 0, 0])rotate(-0)cube([lec_v, l_mely, lec_sz]);
        }
    }
   
}