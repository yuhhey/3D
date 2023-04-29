ww = 2;
D = 57;
H = 20;
bemelyedes = 15;
br=40;
d = 20;

r = D/2;
translate([30,0,0])difference(){
    union(){
        difference(){
           R = (D+ww)/2;
            cylinder(r=R, h=H+ww, $fn = 12*R);
            cylinder(r1=r-1, r2=r, h=H, $fn = 12*r);
        }

        translate([0,0,-.0]){
            kr = d / 2;
            cylinder(r1 = kr-1, r2=kr, h=H, $fn=12*kr);
            intersection(){
                difference(){

                    cylinder(r=r, h=H, $fn = 12*r);

                }
                x = r-bemelyedes+br;
                for (sz=[0,120,240]){
                    rotate(sz)translate([x,0,0]) cylinder(r1=br-1, r2=br, h=H, $fn=12*br);
                }   
            }
        }
    }
    translate([0,0,ww+.1])cylinder(r=3.8,h=H, $fn=12*4);
}
