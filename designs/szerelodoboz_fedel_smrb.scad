use <atis_lib.scad>

ba = 80; //belső átmérő
h=30;
w=2;


br=ba/2;
difference(){
    union(){
        gyuru(br,br-0.5,h,w=w,center=true);
        translate([0,0,-(h+w)/2])cylinder(r=br+10,h=w,center=true, $fn=12*(ba+10));
    }
    for(x = [-10,-2,2,10]){
        translate([x, -10,-h/2])cylinder(r=1.5, h=10, center=true, $fn=1.5*12);
    }

}
module SMR_B(){
    SMRB_w=49;
    SMRB_r=10;
    SMRB_h=13;
    minkowski(){
        cube([SMRB_w-2*SMRB_r, SMRB_w-2*SMRB_r, SMRB_h-2], center=true);
        cylinder(r=SMRB_r,h=1,$fn=SMRB_r*12);
    }
    for(x=[-15:10:15]){
        translate([x, -15, SMRB_h/2])cylinder(r=2,h=10, center=true, $fn=12*2);
    }
}