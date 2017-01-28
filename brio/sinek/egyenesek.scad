use <../tracklib.scad>;

egyenes(100, true);

function egyenes_data(l)=[[[0,0,0],0],
                          [[l,0,0], 180]];

module egyenes(l, rails=false){
    difference(){
        wood_track(l, rails);
        translate([l,wood_width()/2,0]) rotate([0,0,180])wood_cutout();
        translate([0,wood_width()/2,0]) wood_cutout();
    }
}