r_polo_bogre = 38;
r_nagy_feher_bogre = 118/2;

r_bogre_kulso = r_nagy_feher_bogre; // a tűrést ehhez hozzá kell adni
w_bogre_fal = 5;
r_tea_szuro = 36; // a tűrést ehhez hozzá kell adni
w_tarto = 3;
r_gombolyites=1;

R = r_bogre_kulso+w_tarto+r_gombolyites;
r_teaszuro_kivagas= r_tea_szuro+r_gombolyites;
minkowski(){
    difference(){
        cylinder(r=R, h=2*w_tarto, $fn=12*R);
        translate([0,0,w_tarto])cylinder(r=r_teaszuro_kivagas, h=w_tarto+1, $fn=12*r_teaszuro_kivagas);
        translate([0,0,-.5])cylinder(r=r_bogre_kulso+r_gombolyites, h=w_tarto+1, $fn=12*(r_bogre_kulso+r_gombolyites));
        for(sz = [0 : 120 : 359])
            rotate(sz)translate([2*R+w_tarto+r_teaszuro_kivagas+w_tarto,0,-.5])cylinder(r=2*R, h=2*w_tarto+1, $fn=12*2*R);
    }
    sphere(r=r_gombolyites, $fn=12*r_gombolyites);
}