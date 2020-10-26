use <atis_lib.scad>

r_rud = 27.5/2;
fal_d = 2;
jelolo_r = r_rud+fal_d;
m = 11;

alpha = 115;
poli = [[0,0],[cos(alpha), sin(alpha)],[2, 0]]; 
echo("Kivágás szélessége: ", 2*r_rud*sin(alpha/2));


difference(){
    union(){
        gyuru(jelolo_r,jelolo_r, m, fal_d);
        translate((jelolo_r-jelolo_r/2)*[-cos(alpha/2),-sin(alpha/2),0]+[0,0,m/2])rotate(-90+alpha/2)cube([2*jelolo_r,jelolo_r, m],center=true);
    }
    translate([0,0,-0.1])linear_extrude(height=20)polygon(points=(2*jelolo_r*poli));
    translate([0,0,-0.1])cylinder(r=jelolo_r-fal_d, h=m+.2, $fn=12*jelolo_r);
    translate((jelolo_r-jelolo_r/2)*[-cos(alpha/2),-sin(alpha/2),0]+[0,0,5])rotate([0,0,-90+alpha/2])translate([0, -jelolo_r/2+0.9,0])rotate([90,0,0])linear_extrude(height=1.1)text("Hanga",size=6, valign="center",halign="center", font="Purisa:style=Bold");
}






//translate((fal_d+jelolo_r)*[-sin(alpha/2),-cos(alpha/2),0])rotate(-0)cube([2*jelolo_r,fal_d, 10],center=true);

