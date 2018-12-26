use <atis_lib.scad>

ba = 80; //belső átmérő
h=30;
w=2;

SMR_B();

//gyuru(ba,ba-0.5,h,w=w,center=true);
//translate([0,0,-(h+w)/2])cylinder(r=ba+10,h=w,center=true, $fn=12*(ba+10);

module SMR_B(){
    SMRB_w=49;
    SMRB_r=10;
    SMRB_h=13;
    minkowski(){
        cube([SMRB_w-2*SMRB_r, SMRB_w-2*SMRB_r, SMRB_h-2], center=true);
        cylinder(r=SMRB_r,h=1);
    }
}