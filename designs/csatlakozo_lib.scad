
// csm=[melyseg, szelesseg, magassag, also resz magassag, ,henger sugara

//csatlakozo([5,10,20,2,2,1.5]);

module csatlakozo(csm){
    cw = csm[0];
    sz = csm[1];
    h = csm[2];
    ch = csm[3];
    ny = csm[4];
    R=csm[5];
    translate([-cw/2, -sz/2, -h/2]){
        cube([cw,sz,ch]);
        translate([0,sz,ch])
            rotate([90,0,0])
                linear_extrude(height=sz)polygon([[0,0], [cw, 0], [0,cw+1], [0,0]]);
        translate([0,(sz-ny)/2,0])
        intersection()
        {
            translate([0,R+ny/2,0])
                rotate([90,0,0])
                    linear_extrude(height=2*R)polygon([[0,0], [cw, 0], [cw, h-cw-1], [0,h], [0,0]]);
            union(){
                cube([ny, ny,h]);
                translate([cw-R-0.5,ny/2,0]) cylinder(r=R, h=h,$fn=80);
            }
        }
    }
}

module gombolyitett_csatlakozo(csm){
    cw = csm[0]-1;
    sz = csm[1]-2;
    h = csm[2]-2;
    ch = csm[3];
    ny = csm[4];
    R=csm[5];
    translate([-cw/2, -sz/2, -h/2]){
        cube([cw,sz,ch]);
        translate([0,sz,ch])
            rotate([90,0,0])
                linear_extrude(height=sz)polygon([[0,0], [cw, 0], [0,cw+1], [0,0]]);
        translate([0,(sz-ny)/2,0])
        intersection()
        {
            translate([0,R+ny/2,0])
                rotate([90,0,0])
                    linear_extrude(height=2*R)polygon([[0,0], [cw, 0], [cw, h-cw-1], [0,h], [0,0]]);
            union(){
                cube([ny, ny,h]);
                translate([cw-R-0.5,ny/2,0]) cylinder(r=R, h=h,$fn=80);
            }
        }
    }
}