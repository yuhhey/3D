v = 20;
perem = 20;
marando_sz = 195;
marando_h = 57;

// Számítógép asztal nagyobb téglalap lyukhoz
//sablon(20, 20, 195, 57);

// Számítógép asztal nagyobb téglalap lyukhoz
sablon(20,20, 135, 40);
module sablon(v, perem, marando_sz, marando_h){
    difference(){
        cube([marando_sz+2*perem, marando_h+2*perem, v]);
        translate([perem, perem, -0.1])cube([marando_sz, marando_h, v+0.2]);
    }
    translate([v/2+marando_sz/2,v,0])cube([v, marando_h,8]);
}