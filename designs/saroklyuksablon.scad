// Sarok lyuk fúró sablon
// STL elnevezés: _d_x_y a fájlnév végén
// Gallér falvastagság
vv = 5;

// Gallér magasság
h = 15;
// lyuk átmérő - sarok lyuk sablon parametere
d = 0;

//Lyuk középpont koordináta a saroktól számítva
x = 70;
y = 50;

// Parhuzam sablonb parameterek
y_parh = [44];
x_parh = [88/2, 85/2, 76/2, 79/2, 135/2, 141/2];

// Fixen 20mm-rel nyúlik túla lyukon
cw = vv + x + d + 20;
cd = vv + y + d + 20;
ch = h + vv;
difference(){
    translate([-(cw-vv-x), -(cd-vv-y),0]){
        difference(){
            cube([cw, cd, ch]);
            translate([-vv,-vv,-vv])cube([cw, cd, ch]);
        }
    }
    r = d/2 + 0.2;
    translate([0,0,-1])cylinder(r=d/2+0.2, h=ch+5, $fn = 12*r);
    
    
    translate([-(d/2+4),-4,h-0.1]) linear_extrude(2)mirror([1,0,0])text(str(d), size=8);
    translate([x-2,-4,h-0.1]) linear_extrude(2)mirror([1,0,0])text(str(x), size=8);
    
    for(p = y_parh){
        translate([0,y-p-0.5,0]){
            cube([x,1,25]);
            translate([15,-12,h-0.1]) linear_extrude(2)mirror([1,0,0])text(str(p), size=8);
        }
    }
    for(p = x_parh){
        translate([x-p-0.5,y-35,0]){
            cube([1,35,25]);
            //#translate([1000-p*10,0,h-0.1-9]) rotate([-90,0,0])linear_extrude(2)text(str(p), size=8);
        }
    }
}
