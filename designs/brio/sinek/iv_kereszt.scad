use <tracklib.scad>
$fn=200;
StraightCurvedCross();

module StraightCurvedCross()
{
  difference(){
    union(){
      wood_track(168, rails=false);
      translate([-7.5, -7.5 ,0]) translate([46, -46, 0]) rotate([0,0,45]) wood_track(168, rails=false);
      translate([168, -183, 0])rotate([0,0, 90]) wood_track_arc(183, 45, rails=false);
      translate([0, 223, 0])  rotate([0, 0, -90]) wood_track_arc(183, 45, rails=false);
    }
    wood_rails(168);
    translate([-7.5, -7.5 ,0]) translate([46, -46, 0]) rotate([0,0,45]) wood_rails(168);
    translate([168, -183, 0])rotate([0,0, 90]) wood_rails_arc(183, 45);
    translate([0, 223, 0])  rotate([0, 0, -90]) wood_rails_arc(183, 45);

    translate([0, 20, 0])wood_cutout();
    translate([168, 20, 0]) rotate([0, 0, 180]) wood_cutout();
    translate([168, -183, 0]) rotate(45) translate([0, 203, 0]) wood_cutout();
    translate([286.8, -64.2, 0]) rotate(45) translate([0, 203, 0]) rotate(180) wood_cutout();
  }
}
