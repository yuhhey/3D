// Sarok lyuk fúró sablon
// STL elnevezés: _d_x_y a fájlnév végén
// Gallér falvastagság
vv = 5;

// Gallér magasság
h = 15;
// lyuk átmérő
d = 12;

//Lyuk középpont koordináta a saroktól számítva
x = 22;
y = 22;

// Fixen 10mm-rel nyúlik túla lyukon
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
    s = str(d,",",x,",",y);
    
    translate([-(d/2+4),-4,h-0.1]) linear_extrude(2)mirror([1,0,0])text(str(d), size=8);
    translate([x-2,-4,h-0.1]) linear_extrude(2)mirror([1,0,0])text(str(x), size=8);
    translate([d/2,y-2-8,h-0.1]) linear_extrude(2)mirror([1,0,0])text(str(y), size=8);
}
