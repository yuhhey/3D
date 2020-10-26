
module teljes_lec(){
    cube([1805, 68,26]);
    color([1,0,0])translate([1805,0,0])cube([700,68,26]);
}

difference(){
    teljes_lec();
    for(x = [175:350:2500]){
       #translate([x, 34, -1]) cylinder(r=4, h=30);
        echo(x);
    }
    for(x = [2505-175:-350:00]){
       #translate([x, 34, -1]) cylinder(r=4, h=30);
        echo(x);
    }
}
