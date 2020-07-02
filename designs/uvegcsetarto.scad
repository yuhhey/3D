use <atis_lib.scad>
s = 2;
o = 2;
r = 55;
tures = [0, 0.1, 0.2, 0.3];
//inset_first_layer(inset_height=0.31,inset_width=0.5, render=true)
    difference(){
        cube([s*r, o*r,30]);
        for(i = [0:s])
            for(f = [0:o]){
                translate([r/2+i*r, r/2+f*r, 0]){
                    x = i*2+f;
                    translate([0,0,5])cylinder(r=20+tures[x], h= 80, $fn=12*20);
                    translate([0,0,5+19])cylinder(r=43/2+tures[x], h= 80, $fn=12*43/2);
                    translate([0,0,3.5])linear_extrude(height=2)text(text = str(tures[x]), valign="center", halign="center", font=":style=bold", $fn=40);
                }
                soroktol = 8;
                furat_x = i == 0 ? soroktol: (i == s ? r*s-soroktol: i*r);
                furat_y = f == 0 ? soroktol: (f == o ? r*o-soroktol: f*r);
                echo(furat_x, furat_y);
                translate([furat_x, furat_y, 30.1]) mirror([0,0,1])screw_hole();
            }
    }
    
module screw_hole(){
    cylinder(r=2.75, h=100, $fn=12*2.5);
    translate([0,0,-1])cylinder(r=5, h=23, $fn=12*5);
}