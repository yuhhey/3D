use <../tracklib.scad>;
//use <../../dotscad/pie.scad>

$fs=0.5;
$fa=1;


difference(){
    union(){
        hullam(90,0);
        hullam(90,40);
        translate([220,0,0])
            mirror([90,0,0]){
                hullam(90,0);
                hullam(90,40);
            }
        translate([130,0,0])
            rotate([0,0,90])
                wood_track(170, rails=false);
        translate([90,115,0])
            rotate([0,0,90])
                wood_track(55, rails=false);
        translate([170,115,0])
            rotate([0,0,90])
                wood_track(55, rails=false);
        translate([50,165,0])
            rotate([0,0,90])
                wood_track(5, rails=false);
        translate([210,165,0])
            rotate([0,0,90])
                wood_track(5, rails=false);
    }
    translate([130,0,0])
            rotate([0,0,90])
                wood_rails(170, bevel_ends=false);
    translate([90,126,0])
            rotate([0,0,90])
                wood_rails(55, bevel_ends=false);
    translate([170,126,0])
            rotate([0,0,90])
                wood_rails(55, bevel_ends=false);
    translate([50,165,0])
        rotate([0,0,90])
            wood_rails(5, rails=false, bevel_ends=false);
    translate([210,165,0])
        rotate([0,0,90])
            wood_rails(5, rails=false, bevel_ends=false);
    hullam_rails(90,0);
    hullam_rails(90,40);
    translate([220,0,0])
            mirror([90,0,0]){
                hullam_rails(90,0);
                hullam_rails(90,40);
            }
    translate([110,0,0]) rotate([0,0,90]) wood_cutout();
    translate([110,170,0]) rotate([0,0,-90]) wood_cutout();
    translate([150,170,0]) rotate([0,0,-90]) wood_cutout();
    translate([190,170,0]) rotate([0,0,-90]) wood_cutout();
    translate([70,170,0]) rotate([0,0,-90]) wood_cutout();
    translate([30,170,0]) rotate([0,0,-90]) wood_cutout();
}



module hullam(r, d, v=false){
    alfa = acos((2*r-d)/(2*r+40));
    echo(alfa);
    wood_track_arc(r, angle=alfa, rails=v);
    translate([2*r-d,(2*r+40)*sin(alfa),0])
        rotate([0,0,180])
            wood_track_arc(r, angle=alfa, rails=v);
}

module hullam_rails(r, d, v=false){
    alfa = acos((2*r-d)/(2*r+40));
    echo(alfa);
    wood_rails_arc(r, angle=alfa, bevel_ends=false);
    translate([2*r-d,(2*r+40)*sin(alfa),0])
        rotate([0,0,180])
            wood_rails_arc(r, angle=alfa, bevel_ends=false);
}


module szet(){
   /* for(y=[0,40,-40/*,80,-80]){
        translate([0,y,0])wood_track(204);
    }*/
    translate([0,0,0])
        rotate([0,0,-0])
            wood_track_arc(90,angle=36);
    /*translate([0,-90,20])
        rotate([0,0,45])
            wood_track_arc(90,angle=35);*/
    translate([0,-0,0])
        rotate([0,0,90])
            wood_track_arc(90,angle=36);
}
