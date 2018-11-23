//$fn=10;

module asztallap(){
    difference(){
        cube([2480,1230,12]);

        for(x =[90:100:2480]){
            for(y = [115:100:1200]){
                translate([x,y,0])cylinder(r=10,h=30);
                echo("(x,y)=",x,y);
            }
            
        }
    }
}

module ovalis_kivagas(dx,dy,r){
    minkowski(){
        cube([dx-2*r, dy-2*r, 12],center=true);
        cylinder(r=r, h=2);
    }
}

oval_w = 485;

module hosszabb_oldalfal(){
    difference(){
        cube([2456,276,12], center=true);
        x1 = 56+oval_w/2;
        x2 = 56+112+oval_w*3/2;
        for(x =[-x2, -x1, x1, x2]){
            translate([x,0,0])ovalis_kivagas(oval_w,170,40);
        }
    }
}

module kozepso_merevito(){
    difference(){
        cube([597, 276,12], center=true);
        ovalis_kivagas(oval_w, 170, 40);
    }
}
//hosszabb_oldalfal();
//kozepso_merevito();
//ovalis_kivagas(400,200,40);
asztallap();