x = 200;
r = 2.9;
m = 3;
s = 5;


//felgomb(r);

lapka();

module lapka(){
    translate([s*r,s*r,0])minkowski($fn=12*r){
        cube([x-2*s*r,x-2*s*r,m-r]);
        felgomb(r);
    }
}
module felgomb(r){
    difference(){
        scale([s,s,1])sphere(r, $fn=12*r);
        translate([-s*r,-s*r,-2*r])cube([2*s*r, 2*s*r, 2*r]);
    }
}