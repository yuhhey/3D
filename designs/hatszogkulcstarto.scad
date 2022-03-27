r=10;
m=20;
fv=2.5;
lotyoges=0.2;
d_lyukfej=7.5;
h_lyukfej=2.5;
d_lyukszar=4;

function nysz_xy(x,y,r) = [3/2*x*r, (y+(x%2)/2)*(sqrt(3))*r,0];
//nyolcszog(r,m);
//translate([r+r/2,sqrt(3)/2*r,0])nyolcszog(r,m);
//translate(nysz_xy(0,1)) nyolcszog(r,m);
/*egyhely(r,m,fv);
translate(nysz_xy(1,1,r+fv)) egyhely(r,m,fv);
translate(nysz_xy(1,0,r+fv)) egyhely(r,m,fv);
translate(nysz_xy(0,1,r+fv)) egyhely(r,m,fv);
*/

//dugo(r,m,fv,false);
//egyhely(r+0.5,m+1,fv);
tarto();


helyek = [[0,0],
          [1,0],
          [2,0],
          [3,0],
          [4,0],
          [1,1],
          [1,2],
          [2,1],
          [3,1]];
          
lyukhelyek = [[0,0],
              [1,2]
              ];
          
module tarto(){
    difference(){
        for (h = helyek) {
            x=h[0];
            y=h[1];
            translate(nysz_xy(x,y,r+fv)) egyhely(r,m,fv);
        }
        for (h = lyukhelyek){
            x=h[0];
            y=h[1];
            translate(nysz_xy(x,y,r+fv)) csavarlyuk();
        }
    }
}

module nyolcszog(r, h, g=false){
    if (g) {
        minkowski(){
            cylinder(r=r-1.5, h=h-3, $fn=6);
            sphere(r=1.5, $fn=36);
        }
    }
    else
        cylinder(r=r, h=h, $fn=6);
}

module egyhely(r,h,fv,g=false){
    difference(){
        nyolcszog(r+fv, h, g);
        translate([0,0,2*fv])nyolcszog(r, h, false);
    }
}

module csavarlyuk(){
    translate([0,0,2*fv-h_lyukfej])cylinder(r=d_lyukfej/2, h=h_lyukfej+.1, $fn=6*d_lyukfej);
    translate([0,0,-.1])cylinder(r=d_lyukszar/2,h=2*fv,$fn=6*d_lyukszar);
}


module dugo(r,m,fv,g){
    
    difference(){
        union(){
            translate([0,0,1.5])nyolcszog(r-lotyoges, m-fv, true); // egy fv-nyit kilóg felfele.
            translate([0,0,m-5])rotate([90,0,0])rotate_extrude($fn=96) translate([5,0,0])circle(r=3);
            
        }
        translate([0,0,m+8-3])rotate([0,90,0])rotate_extrude($fn=96) translate([8,0,0])circle(r=2);
    }        
       
        
}