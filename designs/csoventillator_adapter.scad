use <atis_lib.scad>;

lyuk_atmero = 117;
d_cso_ventillator = 105;
teljes_magassag = 30;
kup_delta = 2;
arany = .3; // lyuk_atmero távolsága a nagyobb átmérőtől így aránylik a teljes magassághoz

r_n = (lyuk_atmero + kup_delta*arany)/2;
r_k = (lyuk_atmero - kup_delta*(1-arany))/2;
r_csv = d_cso_ventillator / 2;

echo("d_nagy = ", 2*r_n);
echo("d_kicsi = ", 2*r_k);

csv_adapter_104_117();
//rotate([180,0,90])shelly1L_foglalat();


module csv_adapter_104_117(){
    gyuru_fixrb(r_n,r_k, teljes_magassag,r_csv);
}

module dugo(){
    csv_adapter_100_115();
    translate([0,0,-2])cylinder(r=r_n, h=2, $fn = 12*r_n);
}

module shelly1L_foglalat(){
    sb = shelly1L_befoglalo();
    difference(){
        cube(shelly1L_befoglalo()+[4,2,2]);
        translate([2, 2, 2 ])shelly1L();
    }
    
    translate([0,0,sb[2]+2])difference(){
        cube(shelly1L_befoglalo()+[4,2, -12]);
        translate([4+4/2,4+2,0])cube([sb[0]-8, sb[1]-4,sb[2]]);
        
    }
        
}