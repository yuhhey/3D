szelesseg = 150;
r_iv = 35/2;
vastagsag = 18;
fv=2;


translate([fv,0, 0])gyuru(r_iv, szelesseg, vastagsag, fv);
gyuru(r_iv+fv, szelesseg+2*fv, fv, 2*fv);

module piskota(r, h, v){
    translate([r,0,0])hull(){
        cylinder(r=r, h=v, $fn=12*r);
        translate([h-2*r,0,0]) cylinder(r=r, h=v, $fn=12*r);
    }
}

module gyuru(r,h,v,falv){
    difference(){
        piskota(r, h, v);
        translate([falv,0,-0.1])piskota(r-falv, h-2*falv, v+0.2);
    }
}