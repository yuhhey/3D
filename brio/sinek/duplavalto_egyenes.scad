use <tracklib.scad>
$fn=200;
DoubleCurvedSwitch();

module DoubleCurvedSwitch()
{
  difference(){
    union(){
      wood_track(144, rails=false);
      translate([144, -183, 0])rotate([0,0, 90]) wood_track_arc(183, 45, rails=false);
      translate([0, -183, 0])mirror([1, 0, 0]) rotate([0, 0, 90])wood_track_arc(183, 45, rails=false);
    }
    wood_rails(144);
    translate([144, -183, 0])rotate([0,0, 90]) wood_rails_arc(183, 45, rails=false);
    translate([0, -183, 0])mirror([1, 0, 0]) rotate([0, 0, 90])wood_rails_arc(183, 45, rails=false);
   translate([0, 20, 0])wood_cutout();
   translate([144, 20, 0]) rotate([0, 0, 180]) wood_cutout();
   translate([0, -183, 0]) rotate(-45) translate([0, 203, 0]) rotate([0, 0, 180]) wood_cutout();
   translate([144, -183, 0]) rotate(45) translate([0, 203, 0]) rotate([0, 0, 0]) wood_cutout();
 }
}
