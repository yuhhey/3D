r1=10;
m=20;
fv1=2;
lotyoges=0.4;
d_lyukfej=7.5;
h_lyukfej=2.5;
d_lyukszar=4;
billenes = 10;

function nysz_xy(x,y,r) = [3/2*x*r, (y+(x%2)/2)*(sqrt(3))*r,0];
//hatszog(r,m);
//translate([r+r/2,sqrt(3)/2*r,0])hatszog(r,m);
//translate(nysz_xy(0,1)) hatszog(r,m);
/*egyhely(r,m,fv);
translate(nysz_xy(1,1,r+fv)) egyhely(r,m,fv);
translate(nysz_xy(1,0,r+fv)) egyhely(r,m,fv);
translate(nysz_xy(0,1,r+fv)) egyhely(r,m,fv);
*/


//dugo_nagy(r,m,fv,false);
//translate([100,0,0])dugo(r,m,fv,false);
//egyhely(r+0.5,m+1,fv);
difference()
{
    translate([0,-(fv1+1)/2,0]) tarto(r1, fv1);
    translate([0,-1,1])ferde_tarto(r1, fv1); 
}

//rotate([billenes,0,0])egyhely(r1,m,0);
//translate([20,0,0])rotate([billenes,0,0])egyhely(r1,m,fv1);
//nagymeretu_tarolo();




//egyestarto();
lyukhelyek = [[1,0],
              [4,0],
              [4,2]
              ];

x_max = 4;
y_max = 3;
teli_helyek_aranya=1;

module ferde_tarto(r, fv){
    //difference()
    translate([0,m/2*sin(billenes), r*sin(billenes)])
    {
        for (x=[1:x_max]){
            for(y=[0:x/2]){
                ures = rands(0,1,1)[0];                
                if (ures < (teli_helyek_aranya))
                    translate(nysz_xy(x,y,r+fv)) rotate([billenes,0,0])egyhely(r,m,fv);
            }
        }
    }
    /*for (h = lyukhelyek){
        x=h[0];
        y=h[1];
        echo(nysz_xy(x,y,fv));
        #translate(nysz_xy(x,y,r+fv)) csavarlyuk(fv);
    }*/
    
}
module egyestarto(){
    helyek = [[-1,1],
              [0,1],
              [1,0],
              [2,1],
              [3,0],
              [4,1],
              [5,0],
              [6,1],
              [7,0],
              [8,1],
              [9,0]];
    
    for(h = helyek){
        translate(nysz_xy(h[0], h[1], r+fv)) egyhely(r,m,fv);
    }
}

module tarto(r, fv){
    difference()
    {
        minkowski()
        {
            union(){
                for (x=[1:x_max]){
                    for(y=[0:x/2]){
                        ures = rands(0,1,1)[0];                
                        if (ures < (teli_helyek_aranya))
                            translate(nysz_xy(x,y,r+fv)) egyhely(r,m,fv);
                    }
                }
            }
            cylinder(r=fv+1,h=.5, $fn=12*(fv+fv1));
        }
        for (h = lyukhelyek){
            x=h[0];
            y=h[1];
            translate(nysz_xy(x,y,r+fv)) csavarlyuk(fv);
        }
    }
}


// atis_lib.scad jelolt
module hatszog(r, h, g=false){
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
    //difference(){
    //    hatszog(r+fv, h, g);
        translate([0,0,0])hatszog(r, h, false);
//    }
}

module csavarlyuk(fv){
    translate([0,0,2*fv-h_lyukfej])cylinder(r=d_lyukfej/2, h=h_lyukfej, $fn=6*d_lyukfej);
    translate([0,0,-1])cylinder(r=d_lyukszar/2,h=2*fv,$fn=6*d_lyukszar);
}

module dugo(r,m,fv,g){
    difference(){
        union(){
            translate([0,0,1.5])hatszog(r-lotyoges, m-fv, true); // egy fv-nyit kilóg felfele.
            translate([0,0,m-4])rotate([90,0,30])rotate_extrude($fn=96) translate([5,0,0])circle(r=4);
            
        }
        #translate([0,0,m+8-4])rotate([0,90,30])rotate_extrude($fn=96) translate([10,0,0])circle(r=4);
    }                
}

module dugo_nagy(r,m,fv,g){
    hosszitas=8;
    difference(){
        union(){
            translate([0,0,1.5])hatszog(r-lotyoges, hosszitas+m-fv, true); // egy fv-nyit kilóg felfele.
            translate([0,0,m-5+hosszitas])rotate([90,0,30])rotate_extrude($fn=96) translate([5,0,0])circle(r=4);
            
        }
        #translate([0,0,m+8-4+hosszitas])rotate([0,90,30])rotate_extrude($fn=96) translate([10,0,0])circle(r=4);
    }               
}

module up(){
    echo(0);
}

module nagymeretu_tarolo(){
    helyek=[[0,0],
            [1,0],
            [0,1],
            [1,1]
            ];
    R=14;
    for(h = helyek){
        translate(nysz_xy(h[0], h[1], R+fv)) egyhely(R,R,fv);
    }
}