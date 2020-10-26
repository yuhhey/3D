a_h = 2500;
a_sz = 900;
a_m = 800; 
v = 25;
sz = 75;

l_v = 75; //láb vastagság. Irányadó érték. Egész számú lécből rakja össze, ezért felfele kerekít
elso_lap_teljes = true;


asztal(retegek);//, rf = [2,1.1,1.1]);
//lab();
module asztal_elemekbol(){
    translate([0,0, a_m - sz])lap();
    translate([0,0,1])lab();
    translate([a_sz-l_v,0,0])lab();
    translate([a_sz-l_v,a_h-l_v,0])lab();
    translate([0,a_h-l_v,0])lab();
}

module lab(){
    l_m = a_m;
    n = ceil(l_v/v);
    
    for(l = [0:2:n-1]){
        translate([l*v,0,0])cube([v-1,sz, l_m]);
    }
    
    for(l = [1:2:n-1]){
        translate([l*v,0,0])cube([v-1,sz, l_m-sz]);
    }
}

module lap(){
    n = ceil(a_sz/v);
    
    for(l = [0:n-1]){
        translate([l*v,0,0])cube([v-1, a_h, sz]);
    }
}

c1_r = 230/255;
c1_g = 173/255;
c1_b = 87/255;
c2 = [c1_r, c1_g, c1_b];

c2_r = 233/255;
c2_g = 225/255;
c2_b = 212/255;

c1 = [c2_r, c2_g, c2_b];

retegek = [[a_m, 25, 0, c2],
           [a_m - sz, 25, 25, c2],
           [a_m, 25, 50, c2],
           [0, 25, 75, c1],
           [0, 25, 100, c1],
           [0, 25, 125, c1],
           [0, 25, 150, c1],
           [0, 25, 175, c1],
           [0, 25, 200, c1],
           [0, 25, 225, c1],
           [0, 25, 250, c1],
           [0, 25, 275, c1],
           [0, 25, 300, c1],
           [0, 25, 325, c1],
           [0, 25, 350, c1],
           [0, 25, 375, c2],
           [0, 25, 400, c2],
           [0, 25, 425, c2],
           [0, 25, 450, c2],
           [0, 25, 475, c2],
           [0, 25, 500, c2],
           [0, 25, 525, c1],
           [0, 25, 550, c1],
           [0, 25, 575, c1],
           [0, 25, 600, c1],
           [0, 25, 625, c1],
           [0, 25, 650, c1],
           [0, 25, 675, c1],
           [0, 25, 700, c1],
           [0, 25, 725, c1],
           [0, 25, 750, c1],
           [0, 25, 775, c1],
           [0, 25, 800, c1],
           [a_m, 25, 825, c2],
           [a_m - sz, 25, 850, c2],
           [a_m, 25, 875, c2 ]];


module asztal(retegek, rf = [1,1,1]){
    m = elso_lap_teljes ? [a_m, a_m - sz] : [a_m - sz, a_m];
    n = ceil(l_v/v);
    x = 0;
    rfx=rf[0];
    rfy=rf[1];
    rfz=rf[2];
    for( r = retegek){
        echo(r);
        color(r[3])translate([rfx * r[2], 0, 0])if (r[0]> 0){
            cube([r[1], sz, r[0]]);
            translate([0, rfy * (a_h - sz), 0])cube([r[1], sz, r[0]]);
            t = r[0] == a_m ? [sz, a_h - 2 * sz] : [0, a_h];
            translate([0, rfy * t[0],rfz * (a_m - sz)])cube([r[1], t[1], sz]);
        } else {
            translate([0, 0, rfz * (a_m - sz)])cube([r[1], a_h, sz]);
        }
        echo(m);
        m = m == a_m ? a_m - sz : a_m;
        echo(x);
    }
}