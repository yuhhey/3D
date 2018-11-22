include <brio/tracklib.scad>
include <duplo/duplo-block-lib.scad>
use <atis_lib.scad>

duplo_along=7;
duplo_perp=4;

total_length=duplo_along*duploRaster;
duplo_width =duplo_perp*duploRaster;
duplo_xoffset = total_length/2;
duplo_yoffset = duplo_width/2-gapBetweenBricks;

inset_first_layer(inset_width=0.5, render=true){
    translate([duplo_xoffset, -duplo_yoffset,duploHeight/2])duplo(duplo_along, duplo_perp,1, true, true);
    translate([duplo_xoffset,40+duplo_yoffset,duploHeight/2])duplo(duplo_along,duplo_perp,1, true, true);
    translate([gapBetweenBricks/2,0,0])difference(){
        wood_track(length=total_length-gapBetweenBricks);
        translate([0,20,0])wood_cutout();
        translate([total_length, 20,0])rotate(180)wood_cutout();
    }
}