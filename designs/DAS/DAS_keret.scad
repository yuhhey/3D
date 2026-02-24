module gombolyitett_teglalap(a,b,r){
    minkowski(){
        square([a-2*r, b-2*r]);
        circle(r=r, $fn=12*r);
    }
}

module m3_countersinks(){
    for(y = [4:11:37]){
        for(x = [4.7, 86.2-4.7]){
            translate([x,y,-0.1])cylinder(r=1.7,h=10, $fn=24);
            translate([x,y,1.7])cylinder(r2=6/2, r1=1.7, h=1.3, $fn=36);
        }
    }
}

difference(){
    linear_extrude(height=3)difference(){
        translate([2,2])gombolyitett_teglalap(86.2,41,2);
        translate([12+2, 6+2])gombolyitett_teglalap(62.2, 29, 2);
    }
    m3_countersinks();
}


//m3_countersinks();