use <../tracklib.scad>;
use <../../atis_lib.scad>;
//use <../../dotscad/pie.scad>

//Vegles
//jobbszetagazas();
//balszetagazas();
szetagazas();
$fs=0.5;
$fa=1;
module jobbszetagazas(){ //make me
    inset_first_layer(inset_height=0.31,inset_width=0.4, render=true)
        mirror([90,0,0])
            balszetagazas();
}
module balszetagazas(){ //make me
    inset_first_layer(inset_height=0.31,inset_width=0.4, render=true){
        difference(){
            union(){
                hullam(90,1);
                hullam(90,42);
                hullam(90,83);
                hull(){
                    translate([130,100,0])
                        rotate([0,0,90])
                            wood_track(100, rails=false);
                    translate([89,127.9,0])
                        rotate([0,0,90])
                            wood_track(200-127.9, rails=false);
                    translate([48,171.3,0])
                        rotate([0,0,90])
                            wood_track(200-171.3, rails=false);
                    translate([7,197.4,0])
                        rotate([0,0,90])
                            wood_track(200-197.4, rails=false);
                }
                translate([130,0,0])
                    rotate([0,0,90])
                        wood_track(100,rails=false);
                
            }
            translate([130,0,0])
                    rotate([0,0,90])
                        wood_rails(200, bevel_ends=false);
            translate([89,127.9,0])
                    rotate([0,0,90])
                        wood_rails(200-127.9, bevel_ends=false);
            translate([48,171.3,0])
                rotate([0,0,90])
                    wood_rails(200-171.3, rails=false, bevel_ends=false);
            translate([7,197.4,0])
                    rotate([0,0,90])
                        wood_rails(200-197.4, bevel_ends=false);
            hullam_rails(90,1);
            hullam_rails(90,42);
            hullam_rails(90,83);
            translate([110,0,0]) rotate([0,0,90]) wood_cutout();
            for(x=[-13,28,69,110]){
                translate([x,200,0])
                    rotate([0,0,-90])
                        wood_cutout();
            }
        }
    }
}


module szetagazas(){ //make me
    inset_first_layer(inset_height=0.31,inset_width=0.2, render=true){
        difference(){
            union(){
                hullam(90,1);
                hullam(90,42);
                translate([220,0,0])
                    mirror([90,0,0]){
                        hullam(90,1);
                        hullam(90,42);
                    }
                /* A pont 40mm széles vágányok esetén feszülnek a következő elemek,
                    ezért 41mm-es szélességgel dolgozunk. A hull a rések elkerülésére
                    kell.*/
                hull(){
                    translate([130,65,0])
                        rotate([0,0,90])
                            wood_track(105, rails=false);
                    translate([89,127.9,0])
                        rotate([0,0,90])
                            wood_track(175-127.9, rails=false);
                    translate([171,127.9,0])
                        rotate([0,0,90])
                            wood_track(175-127.9, rails=false);
                    translate([48,171.3,0])
                        rotate([0,0,90])
                            wood_track(175-171.3, rails=false);
                    translate([212,171.3,0])
                        rotate([0,0,90])
                            wood_track(175-171.3, rails=false);
                }
            }
            translate([130,0,0])
                    rotate([0,0,90])
                        wood_rails(175, bevel_ends=false);
            translate([89,127.9,0])
                    rotate([0,0,90])
                        wood_rails(175-127.9, bevel_ends=false);
            translate([171,127.9,0])
                    rotate([0,0,90])
                        wood_rails(175-127.9, bevel_ends=false);
            translate([48,171.3,0])
                rotate([0,0,90])
                    wood_rails(175-171.3, rails=false, bevel_ends=false);
            translate([212,171.3,0])
                rotate([0,0,90])
                    wood_rails(175-171.3, rails=false, bevel_ends=false);
            hullam_rails(90,1);
            hullam_rails(90,42);
            translate([220,0,0])
                    mirror([90,0,0]){
                        hullam_rails(90,1);
                        hullam_rails(90,42);
                    }
            translate([110,0,0]) rotate([0,0,90]) wood_cutout();
            for(x=[28,69,110,151,192]){
                translate([x,175,0])
                    rotate([0,0,-90])
                        wood_cutout();
            }
        }
    }
}


module hullam(r, d, v=false){
    alfa = acos((2*r-d)/(2*r+40));
    echo((2*r+40)*sin(alfa));
    wood_track_arc(r, angle=alfa, rails=v);
    translate([2*r-d,(2*r+40)*sin(alfa),0])
        rotate([0,0,180])
            wood_track_arc(r, angle=alfa, rails=v);
}

module hullam_rails(r, d){
    alfa = acos((2*r-d)/(2*r+40));
    wood_rails_arc(r, angle=alfa, bevel_ends=false);
    translate([2*r-d,(2*r+40)*sin(alfa),0])
        rotate([0,0,180])
            wood_rails_arc(r, angle=alfa, bevel_ends=false);
}
