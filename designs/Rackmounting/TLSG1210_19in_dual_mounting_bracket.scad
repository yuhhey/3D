/*translate([0,-10,0]){
    import("/Users/grof/Downloads/SWITCH_PART-new.3mf");
    import("/Users/grof/Downloads/PSU_PART-new.3mf");
}
translate([-20,-50,0])rotate(0)import("/Users/grof/Downloads/SWITCH_PART-new.3mf");

translate([547,4,0])rotate(180)import("/Users/grof/Downloads/SWITCH_PART-new.3mf");
*/

wall_th = 4;

fp_w = 482.6;
fp_h = 44.4;
fp_th = wall_th;
hole_xl = 8.8;
hole_xr = fp_w-hole_xl;
hole_y1 = 6.35;
hole_dy = 15.875;
hole_y2 = hole_y1 + hole_dy;
hole_y3 = hole_y2 + hole_dy;
hole_r = 3; //Le kell mérni
fp_holes = [[hole_xl, hole_y1],
            [hole_xl, hole_y2],
            [hole_xl, hole_y3],
            [hole_xr, hole_y1],
            [hole_xr, hole_y2],
            [hole_xr, hole_y3]
            ];
fp_cage_offset = 24;


tl_sg1210_w = 209+2;
tl_sg1210_h = 26+2;
tl_sg1210_d = 126+2;

cage_w = tl_sg1210_w + 2 * wall_th;
cage_h = tl_sg1210_h + 2 * wall_th;
cage_d = tl_sg1210_d + 2 * wall_th;
cage_hole_oval_shift = 2;

talca_w = cage_w;
talca_d = 300;
talca_th = wall_th;
function kozepre(kulso, belso) = (kulso-belso)/2;


scale(1) TL_SG1210_dual_rack_mounting_bracket();


module TL_SG1210_dual_rack_mounting_bracket(){
    front_plate();
    translate([fp_cage_offset,0,kozepre(fp_h, cage_h)])tl_sg1210_cage();
    translate([fp_w-fp_cage_offset-cage_w,0,kozepre(fp_h, cage_h)])tl_sg1210_cage();

}

module front_plate(){
    difference(){
        cube([fp_w, fp_th, fp_h]);
        for(coord = fp_holes){
            translate([coord[0],wall_th+1,coord[1]])
                hull(){
                    translate([-cage_hole_oval_shift,0,0])rotate([90,0,0])cylinder(r=hole_r, h=2*wall_th, $fn=12*hole_r);
                    translate([cage_hole_oval_shift,0,0])rotate([90,0,0])cylinder(r=hole_r, h=2*wall_th, $fn=12*hole_r);
                }
        }
        translate([fp_cage_offset+wall_th,-0.5, kozepre(fp_h, tl_sg1210_h)])cube([tl_sg1210_w, wall_th+1, tl_sg1210_h]);
        translate([fp_w-fp_cage_offset-cage_w+wall_th,-0.5, kozepre(fp_h, tl_sg1210_h)])cube([tl_sg1210_w, wall_th+1, tl_sg1210_h]);
    }
}


module tl_sg1210_cage(){
    difference(){
        cube([tl_sg1210_w+2*wall_th,           // Befoglaló
              tl_sg1210_d,  //
              tl_sg1210_h+2*wall_th]);
        translate([wall_th, -0.5, wall_th])cube([tl_sg1210_w,tl_sg1210_d+1,tl_sg1210_h]); // tl_sg1210 helye
        
       /* Trapéz oldalak 
        translate([-0.5,wall_th,tl_sg1210_h/2+wall_th])rotate([0,90,0])rombusz(tl_sg1210_d-2*wall_th,tl_sg1210_h,wall_th+1);
        translate([wall_th+tl_sg1210_w-0.5,wall_th,tl_sg1210_h/2+wall_th])rotate([0,90,0])rombusz(tl_sg1210_d-2*wall_th,tl_sg1210_h,wall_th+1);
        translate([wall_th+tl_sg1210_w/2,wall_th,-0.5])rotate([0,0,0])rombusz(tl_sg1210_d-2*wall_th,tl_sg1210_w,wall_th+1);
        translate([wall_th+tl_sg1210_w/2,wall_th,wall_th+tl_sg1210_h-0.5])rotate([0,0,0])rombusz(tl_sg1210_d-2*wall_th,tl_sg1210_w,wall_th+1);
        // trapéz oldalak vége */
        // téglalap alakú kivágás a szellőzésnek
        n = 5; // téglalapok száma víszintesen és függőlegesen
        tlap_falvastagsag = 12;
        dx = (tl_sg1210_w - 1 * tlap_falvastagsag) / n;
        dy = (tl_sg1210_d - 1 * tlap_falvastagsag) / n;
        for(ix = [0:n-1]){
            for(iy = [0:n-1]){
                translate([ix*dx+tlap_falvastagsag+wall_th, iy*dy+tlap_falvastagsag+wall_th, -0.1]) cube([dx-tlap_falvastagsag,dy-tlap_falvastagsag,wall_th+1]);
                 translate([ix*dx+tlap_falvastagsag+wall_th, iy*dy+tlap_falvastagsag+wall_th, tl_sg1210_h+wall_th-0.1]) cube([dx-tlap_falvastagsag,dy-tlap_falvastagsag,wall_th+1]);
            }
        }
        // téglalap alakú kivágás szellőzésnek vége */
    }
    //translate([0,tl_sg1210_d,0])hatso_talca();
}

module hatso_talca(){
    cube([talca_w, talca_d, talca_th]);
}

module rombusz(h, w, th){
    scale([w,h,1])rotate([0,0,45])cube([1/sqrt(2),1/sqrt(2),th]);
}

