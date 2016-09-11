use <tracklib.scad>
$fa=1;


difference(){
    union(){
        rotate([0,0,22.5]) translate([-165,0,0])wood_track_arc(183, 45, rails=false);
        rotate([0,0,-22.5])translate([165,0,0 ])rotate([0,0,135]) wood_track_arc(183, 45, rails=false);
        translate([0,183,0])mirror([0,1,0]){
            rotate([0,0,22.5]) translate([-165,0,0])wood_track_arc(183, 45, rails=false);
            rotate([0,0,-22.5])translate([165,0,0 ])rotate([0,0,135]) wood_track_arc(183, 45, rails=false);
        }
    }

    rotate([0,0,22.5]) translate([-165,0,0])
    {
        wood_rails_arc(183, 45);
        translate([203,0,0])rotate([0,0, 90])wood_cutout();
        rotate([0,0,45])translate([203,0,0])rotate([0,0, -90])wood_cutout();
    }
    rotate([0,0,-22.5])translate([165,0,0 ])rotate([0,0,135])
    {
        wood_rails_arc(183, 45);
        translate([203,0,0])rotate([0,0, 90])wood_cutout();
       rotate([0,0,45])translate([203,0,0])rotate([0,0, -90])wood_cutout();
    }
    translate([0,183,0])mirror([0,1,0])
    {
        rotate([0,0,22.5]) translate([-165,0,0])
        {
            wood_rails_arc(183, 45);
            translate([203,0,0])rotate([0,0, 90])wood_cutout();
            rotate([0,0,45])translate([203,0,0])rotate([0,0, -90])wood_cutout();
        }
        rotate([0,0,-22.5])translate([165,0,0 ])rotate([0,0,135])
        {
            wood_rails_arc(183, 45);
            translate([203,0,0])rotate([0,0, 90])wood_cutout();
            rotate([0,0,45])translate([203,0,0])rotate([0,0, -90])wood_cutout();
        }
    }
}
