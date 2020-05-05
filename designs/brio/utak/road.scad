use <../sinek/tracklib.scad>
use <../../../dotscad/pie.scad>
 
//egyenes_ut();
//road_barrage();

//T_keresztezodes();
//keresztezodes();

//negyedkor();
road_arcs_V2(d=90, kivagas=[0.1, 45.2]);
translate([204, 0, 0])rotate([0,0,90])road_arcs_V2(d=90, kivagas=[45.1, 90]);
//iv(100,20,45,10);
//sarok_kivagas();

function road_width() = 100;

function road_lane_barrage_width() = 5;
function road_edge_width() = 8;
function lane_width() = (road_width()
                             - road_lane_barrage_width()
                             - 2 * road_edge_width())/2;
function lane_height() = 4;
function road_length() = 204;
bevel_cube_side = sqrt(2);
function wood_height(h=12)=h;
function wood_well_height()=2;
function dashed_line_height()=1;

module X_kozep(){
    x=road_width()/2;
    intersection(){
        union(){
            cube([road_width()+40, road_width()+40, lane_height()], center=true);
            translate([0,0, lane_height()])
                cube([road_width(), road_width(), wood_height()], center=true);
        }
        difference(){
            union(){
                cube([road_width(), road_width(), lane_height()], center=true);
                translate([0,0,lane_height()/2]){
                    ch = wood_height()-lane_height();
                    translate([-x, -x, 0])pie(road_edge_width(), 90, ch);
                    translate([-x,x,45])
                        rotate([0,0,-90])
                            pie(road_edge_width(), 90, ch);
                    translate([x,-x,0])
                        rotate([0,0,90])
                            pie(road_edge_width(), 90, ch);
                    translate([x, x,0])
                        rotate([0,0,180])
                            pie(road_edge_width(), 90, ch);
                        
                }
                for(d=[0,90]){
                    rotate([0,0,d]){
                        translate([-road_width()/4,-x,-lane_height()/2])
                            rotate([0,0,-90])
                                wood_plug(h=4);
                        translate([road_width()/4,x,-lane_height()/2])
                            rotate([0,0,90])
                                wood_plug(h=4);
                    }
                    
                }
                for(d=[0,90,180,270]){
                    rotate([0,0,d])
                        translate([x-10,0, lane_height()/2])
                            cube([20, road_lane_barrage_width(),2], center=true);
                }
            }
            for(d=[0,90]){
                rotate([0,0,d]){
                    translate([road_width()/4,-x,-lane_height()/2])
                        rotate([0,0,90])
                            wood_cutout(h=4);
                    translate([-road_width()/4,x,-lane_height()/2])
                        rotate([0,0,-90])   
                            wood_cutout(h=4);
                }
            }
        }
    }
}


module sarok_kivagas(){
    difference()
    {
        translate([0,0,0])cube([20,20,4], center=true);
        translate([0,0,1])cylinder(h=10,r1=road_edge_width(), r2=road_edge_width()-4, center=true);
        translate([-road_edge_width(),0,-2]) cube(2*road_edge_width());
        translate([0,-road_edge_width(),-2]) cube(2*road_edge_width());
    }
}

module T_keresztezodes(){ // makeme
    difference()
    {
        union()
        {
            iv(102,100,90, wood_height());
            translate([0,204,0])
                rotate([0,0,-90])
                    iv(102,100,90, wood_height());
            translate([52,0,0])
                cube([road_width(), road_length(), wood_height()]);
        }
        dz = wood_height() - lane_height()+1;
        dx = lane_width();
        dy = road_length();
        translate([102+road_lane_barrage_width()/2,0, lane_height()])
            cube([dx, dy, dz]);
        translate([102-road_lane_barrage_width()/2-lane_width(),0, lane_height()])
            cube([dx, dy, dz]);
        translate([-1,102+road_lane_barrage_width()/2,lane_height()]) cube([90, dx,dz]);
        translate([-1,57,lane_height()]) cube([90, dx,dz]);
        iv_kivagas(lane_height()){
            r_lane_in = 102 - (road_lane_barrage_width()+lane_width())/2;
            iv(r_lane_in, lane_width(), 90, wood_height()-lane_height()+1);
            r_lane_out = 102 + (road_lane_barrage_width()+lane_width())/2;
            translate([0,204,0])
                rotate([0,0,-90])
                    iv(r_lane_in,lane_width(), 90, wood_height()-lane_height()+1);        
        }
        
    }
    
    
}

module keresztezodes(){ // makeme
    difference()
    {
        union()
        {
            translate([-50,-80,0]) egyenes_ut();
            rotate([0,0,90]) translate([-50,-80,0]) egyenes_ut();
        }
        translate([0,0,10]) cube([road_width(), road_width()-2*road_edge_width(),14], center=true);
        rotate([0,0,90])translate([0,0,10]) cube([road_width(), road_width()-2*road_edge_width(),14], center=true);
        bevel_coord = road_width()/2;
        sarkok =[[bevel_coord, bevel_coord, 0],
                 [-bevel_coord, bevel_coord, 90],
                 [bevel_coord, -bevel_coord, 270],
                 [-bevel_coord, -bevel_coord,180]];
        for(xy=sarkok)
        {
            translate([xy[0], xy[1],13]) rotate([0,0, xy[2]])sarok_kivagas();
        }
        
    }
}

module negyedkor(){
    road_arcs();
    rotate([0,0,45])road_arcs();
}

module road_barrage(){
    barrage_length = road_length()-40;
    difference()
    {
        cube([6,barrage_length ,4], center=true);
        cube([20,40,5], center=true);
        
    }
    translate([0,0,3])cube([8, road_length()+1,8], center=true);        

    translate([road_lane_barrage_width()/2, 0, -1]) bevel_cube();
    translate([-road_lane_barrage_width()/2, 0, -1]) bevel_cube();
    translate([0, -20, -1]) rotate([0,0,90])bevel_cube(30);
    translate([0, 20, -1]) rotate([0,0,90])bevel_cube(30);
    cutout_end = road_length()/2-20;
    translate([0, -cutout_end, -1]) rotate([0,0,90])bevel_cube(30);
    translate([0, cutout_end, -1]) rotate([0,0,90])bevel_cube(30);
}


module bevel_cube(length=road_length()+0.5){
    rotate([0,45,0])cube([bevel_cube_side, length,bevel_cube_side], center=true);
}

module egyenes_ut(){ // makeme
    lane_depth = wood_height() - wood_well_height();
    right_lane = road_edge_width() + lane_width() + road_lane_barrage_width();
    difference()
    {
        cube([road_width(), road_length(), wood_height()]);
        union(){
            translate([road_edge_width(),-1,wood_well_height()+2])
                cube([lane_width(), road_length()+2,lane_depth+1]);
            translate([right_lane,-1,wood_well_height()+2])
                cube([lane_width(),road_length()+2,lane_depth+1]);
//Bevels
            translate([road_edge_width(), road_length()/2-0.1, wood_height()])          bevel_cube();
            translate([0, road_length()/2-0.1, wood_height()]) bevel_cube(); 
            translate([road_width()-road_edge_width(), road_length()/2-0.1,         wood_height()]) bevel_cube();
        translate([road_width(), road_length()/2-0.1, wood_height()]) bevel_cube();
//Bevels end
        translate([road_width()/4*3,0,0])rotate([0,0,90]) wood_cutout(h=4);
        translate([road_width()/4,road_length(),0])rotate([0,0,-90]) wood_cutout(h=4);
        translate([road_width()/2, road_length()/2, wood_well_height()+4])road_barrage();
        }
    }
    translate([road_width()/4,0,0])rotate([0,0,-90]) wood_plug(h=4);
    translate([road_width()/4*3,road_length(),0])rotate([0,0,90]) wood_plug(h=4);
}

module bevel_square(){
    rotate([0,0,45]) square([5,5]);
}


module iv(r, w, d, h){
    difference(){
        pie(r+w/2, d, h, $fn=r*12);
        translate([0,0,-0.5]) rotate([0,0,-0.5])pie(r-w/2, d+1, h+1, $fn=r*12);
    }
}

module iv_kivagas(h){
    translate([0,0,h])
        rotate([0,0,-0.1]){
            children();
        }
}

module road_arcs_V2(r=102, d=45, kivagas=[-1, -1]){
    difference(){
        iv(r, road_width(), d, wood_height());
        //translate([0,0,lane_height()])rotate([0,0,-0.1])
        iv_kivagas(lane_height()){
            r_lane_in = r - (road_lane_barrage_width()+lane_width())/2;
            iv(r_lane_in, lane_width(), d+1, wood_height()-lane_height()+1);
            r_lane_out = r + (road_lane_barrage_width()+lane_width())/2;
            iv(r_lane_out, lane_width(), d+1, wood_height()-lane_height()+1);
            if (kivagas[0]>0)
                rotate([0,0,kivagas[0]])iv(r_lane_out+8, lane_width()+4, kivagas[1] - kivagas[0], wood_height()-lane_height()+1);
        }
        iv_kivagas(lane_height()+dashed_line_height())
            iv(r, road_lane_barrage_width()+1, d + .5, wood_height()-lane_height());
        // Szaggatott vonal kivágása. Csak 45 fok többszöröseire működik jól
        iv_kivagas(lane_height())
            for(sz = [11.25:45:d-11.25-22.5]){
                rotate([0,0,sz])
                iv(r, road_lane_barrage_width()+1, 22.5, wood_height());
            }
        rotate([0,0,d])
            translate([r-road_width()/4,0,0])
                rotate([0,0,-90])
                    wood_cutout(h=4, $fn=80);
        translate([r+road_width()/4,0,0])
            rotate([0,0,90])
                wood_cutout(h=4, $fn=80);
        
        // Bevels
        translate([0,0,wood_height()-1])
            rotate_extrude($fn=r*12){
                translate([r+road_width()/2,0,0])
                    bevel_square(); 
                translate([r+road_width()/2-road_edge_width(),0,0])
                    bevel_square();
                translate([r-road_width()/2,0,0])
                    bevel_square();
                translate([r-road_width()/2+road_edge_width(),0,0])
                    bevel_square();     
        }
       	translate([0,0,lane_height()]) rotate_extrude($fn=r*12)
        {
            translate([r+road_lane_barrage_width()/2,0,0])
                bevel_square();
            translate([r-road_lane_barrage_width()/2,0,0])
                bevel_square();
        }
        /* Nem csinált semmit, az út felett lebegnek az elemet.
        for(d = [11.25, 45-11.25]){
    	    rotate([0,0,d])
                translate([102,0,wood_height()])
                    #rotate([0,0,90])bevel_cube(30);
        }*/
        //Bevels end
    }
    translate([r-road_width()/4,0,0])
        rotate([0,0,-90])
            wood_plug(h=4, $fn=80);
    rotate([0,0,d])
        translate([r+road_width()/4,0,0])
            rotate([0,0,90])
                wood_plug(h=4, $fn=80);
}

module road_arcs(r = 102){ // makeme
    r_out = r + road_width()/2;
    r_in = r - road_width()/2;
    //difference()
    //{
        iv(r, road_width(), 45, wood_height());
        //pie(r_out, 45, wood_height());
        //translate([0,0,-1])rotate([0,0,-1])pie(r_in, 47, 14);
        translate([0,0,wood_height()-8]) rotate ([0,0,0])union()
        {
            // Belső fal
/*             difference(){
               inner_outskirt = r-road_lane_barrage_width()/2; 
                pie(inner_outskirt,47,9);
                pie(inner_outskirt-lane_width(),47,8);*/
                iv(r, road_lane_barrage_width(), 47, 9);
 //           } 
            // Külső fal
      //      iv(r, 
            difference(){
                pie(r_out-road_edge_width(),47,9);
                pie(r_out-road_edge_width()-lane_width(),47,9);
            }
            translate([0,0,2])difference(){
                pie(r+road_lane_barrage_width(), 47, 8);
                pie(r-road_lane_barrage_width(), 47, 8);
            }
        }
        translate([r+road_width()/4,0,0]) rotate([0,0,90]) wood_cutout(h=4);
        rotate([0,0,45])translate([r-road_width()/4,0,0]) rotate([0,0,-90]) wood_cutout(h=4);
        // Kivágás a felezővonal közepén
        translate([0,0,wood_height()-8])rotate([0,0,11.25]) difference()
        {
            pie(r+road_lane_barrage_width()/2+0.1, 22.5,100);
            pie(r-road_lane_barrage_width()/2-0.1, 22.5,100);
        }
        // Bevels   
        translate([0,0,wood_height()-1]) rotate_extrude(){
            translate([r+road_width()/2,0,0])
                bevel_square(); 
            translate([r+road_width()/2-road_edge_width(),0,0])
                bevel_square();
            translate([r-road_width()/2,0,0])
                bevel_square();
            translate([r-road_width()/2+road_edge_width(),0,0])
                bevel_square();     
        }
       	translate([0,0,wood_height()-7]) rotate_extrude()
        {
            translate([r+road_lane_barrage_width()/2,0,0])
                bevel_square();
            translate([r-road_lane_barrage_width()/2,0,0])
                bevel_square();
        }
        for(d = [11.25, 45-11.25]){
    	    rotate([0,0,d])
                translate([102,0,wood_height()])
                    rotate([0,0,90])bevel_cube(30);
        }
        //Bevels end
    //}
    translate([r-road_width()/4,0,0]) rotate([0,0,-90]) wood_plug(h=4);
    rotate([0,0,45])translate([r+road_width()/4,0,0]) rotate([0,0,90]) wood_plug(h=4);
}


