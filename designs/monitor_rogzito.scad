use <atis_lib.scad>
sz=70;
m=30;
mlysg=35;
difference(){
    cube([sz,mlysg,m]);
    cube([180,17,17]);
    eltolas=17+(mlysg-17)/2;
    translate([0,eltolas,0]){
        translate([eltolas,0,0])#kivagas(5,5,30);
        translate([sz-eltolas,0,0])kivagas(5,5,30);
    }
}