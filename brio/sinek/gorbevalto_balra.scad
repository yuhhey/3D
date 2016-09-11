/**
 * A parametric library of modules for creating parts compatible with toy trains
 * (currently focused primarily on Thomas- and Brio-compatible wooden trains, as well as
 * Thomas Trackmaster (motorized plastic) and Take-N-Play (die cast).
 *
 * Some functions in this library require other [dotscad](https://github.com/dotscad/)
 * files.  I would recommend cloning that repository into the same parent directory
 * that contains this repository.
 *
 * This OpenSCAD library is part of the [dotscad](https://github.com/dotscad/dotscad)
 * project, an open collection of modules and Things for 3d printing.  Please check there
 * for the latest versions of this and other related files.
 *
 * @copyright  Chris Petersen, 2014
 * @license    http://creativecommons.org/licenses/LGPL/2.1/
 * @license    http://creativecommons.org/licenses/by-sa/3.0/
 *
 * @see        http://www.thingiverse.com/thing:216915
 * @source     https://github.com/dotscad/trains/blob/master/tracklib.scad
 */

use <tracklib.scad>
curved_switch_left();

module curved_switch_right(){
  mirror([0,1,0]) curved_switch_left();
}
module curved_switch_left($fn=120) {
    difference(){
        union(){
            rotate([0,0,90]) wood_track_arc(90, angle=90, rails=false, $fn=120);
            translate([0,-93,0]) rotate([0,0,90]) wood_track_arc(183, angle=45, rails=false, $fn=120);
        }
     
       rotate([0,0,90]) wood_rails_arc(90, 90);
       translate([0,-93,0]) rotate([0,0,90]) wood_rails_arc(183, 45);
       translate([0,110,0]) rotate([0,0, 180]) wood_cutout();
     
       rotate(90, [0,0, 1]) translate([0,110,0])  wood_cutout();

       translate([0, -93, 0])rotate(45, [0,0, 1]) translate([0,203,0])  wood_cutout();
    }
}

