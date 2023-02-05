use <atis_lib.scad>
sor = 3;
oszlop = 5;

s= (sor>oszlop) ? sor : oszlop;
o= (sor>oszlop) ? oszlop : sor;

echo(s, o);

//d = 55; // aldis smoothies üveghez
//tures = [0.2, 0.3, 0.4, 0.5]; // 0.5-tel nyomtattam az aldi smoothies üveghez

smoothies = true;
narancsos_uveg = false;
d = (smoothies) ? 55 : ((narancsos_uveg) ? 100 : 1/0);

echo(d);
//d = 100; // lidl 1.5L-es narancsleves üveghez


tures = 0.1;
echo(max(tures));
proba = false;
blackbelt = true;
falra = false; // falra szerelhető kivitel:minden második lyuk közé és a sarkokra rakunk lyukakat
hordozhato = true; // középen lyukak a hordozható kivitelben
fuvoka_meret = 0.8;

keret = 10;


kicsi_r = (proba) ? 20 : 20+max(tures);
nagy_r = (proba) ? 43/2 : 43/2+max(tures);

if (blackbelt){
    uvegcsetarto();
}
else{
    inset_first_layer(inset_height=0.31,inset_width=fuvoka_meret/2, render=true)
        uvegcsetarto();
}


module uvegcsetarto(){
    difference(){
        sz = s*d+2*keret;
        m = o*d+2*keret;
        cube([sz, m, 30]);
        for(i = [0:s-1]){
            echo("i=", i);
            for(f = [0:o-1]){
                translate([keret+d/2+i*d, keret+d/2+f*d, 0]){
                    if (proba) {
                        x = i*2+f;
                        translate([0,0,5])cylinder(r=20+tures[x], h= 80, $fn=12*20);
                        translate([0,0,5+19])cylinder(r=43/2+tures[x], h= 80, $fn=12*43/2);
                        translate([0,0,3.5])linear_extrude(height=2)text(text = str(tures[x]),
                                                                         valign="center",
                                                                         halign="center",
                                                                         font=":style=bold",
                                                                         $fn=40);
                    }
                    else {
                        translate([0,0,5])cylinder(r=kicsi_r, h= 80, $fn=12*20);
                        translate([0,0,5+19])cylinder(r=nagy_r, h= 80, $fn=12*43/2);
                    }                    
                }
                saroktol = 8;
                furat_x = i == 0 ? saroktol: (i == s ? sz-saroktol: i*d+keret);
                furat_y = f == 0 ? saroktol: (f == o ? m-saroktol: f*d+keret);
    //          echo(furat_x, furat_y);
                if (!(i%2) && !(f%2) && falra){
                    translate([furat_x, furat_y, 30.1]) mirror([0,0,1])screw_hole();
                }
                if (falra && (((i==0) && (f==o)) || ((i==s) && (f==0)) || ((i==s) && (f==o))))
                    translate([furat_x, furat_y, 30.1]) mirror([0,0,1])screw_hole();
            }
        }
        if (hordozhato){ // két furat a fül felfogásához
            fogantyu_eltolas = !(s%2) ? d : 1.5*d;
            translate([sz/2+fogantyu_eltolas, m/2+d/2, 30.1]) mirror([0,0,1])screw_hole();
            translate([sz/2+fogantyu_eltolas, m/2-d/2, 30.1]) mirror([0,0,1])screw_hole();
            translate([sz/2-fogantyu_eltolas, m/2+d/2, 30.1]) mirror([0,0,1])screw_hole();
            translate([sz/2-fogantyu_eltolas, m/2-d/2, 30.1]) mirror([0,0,1])screw_hole();
        }
    }
}
    
module screw_hole(){
    cylinder(r=2.75, h=100, $fn=12*2.5);
    translate([0,0,-1])cylinder(r=5.7, h=23, $fn=12*6);
}
