ww = 2; // korong oldalvastagsága
bww = 13; // Az alja vastagsága
D = 56;
H = 10;
bemelyedes = 14;
br=40;
d = 20;

r = D/2;
translate([30,0,0])difference(){
    union(){
        difference(){
           R = (D+2*ww)/2;
            cylinder(r=R, h=H+bww, $fn = 12*R);
            cylinder(r1=r, r2=r-1, h=H, $fn = 12*r);
        }

        translate([0,0,-0]){
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
    #translate([0,0,bww+.1])cylinder(r=4.8,h=H, $fn=12*4);
}
