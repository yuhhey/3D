r=10;
m=20;
fv=1.5;
lotyoges=0.1;
function nysz_xy(x,y,r) = [3/2*x*r, (y+(x%2)/2)*(sqrt(3))*r,0];
//nyolcszog(r,m);
//translate([r+r/2,sqrt(3)/2*r,0])nyolcszog(r,m);
//translate(nysz_xy(0,1)) nyolcszog(r,m);
/*egyhely(r,m,fv);
translate(nysz_xy(1,1,r+fv)) egyhely(r,m,fv);
translate(nysz_xy(1,0,r+fv)) egyhely(r,m,fv);
translate(nysz_xy(0,1,r+fv)) egyhely(r,m,fv);
*/

dugo(r,h,fv,false);
module nyolcszog(r, h, g=false){
    if (g) {
        minkowski(){
            cylinder(r=r-1.5, h=h-3, $fn=6);
            sphere(r=1.5, $fn=18);
        }
    }
    else
        cylinder(r=r, h=h, $fn=6);
}

module egyhely(r,h,fv,g=false){
    difference(){
        nyolcszog(r+fv, h, g);
        translate([0,0,2*fv])nyolcszog(r, h, g);
    }
}

module dugo(r,h,fv,g){
    nyolcszog(r-lotyoges, m-fv, true);
}