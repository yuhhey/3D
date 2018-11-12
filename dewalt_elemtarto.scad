
aksi_tarto(n=4);

module aksi_foglalat(){
    //65x??x84.5
    translate([0,0,84.3])rotate([180,0,0])import("DeWalt_battery_adapter/files/DBC200v2.stl");
}


module aksi_tarto(n=4){
    union(){
        for(i = [1:1:n]){
            translate([(i-1)*110,0,0])scale(1.01)aksi_foglalat();
        }
        
        difference(){
            minkowski(){
                translate([-65,6,0])cube([n*110+20,15,84.3*1.01]);
                difference(){
                    sphere(r=1, $fn=12);
                    translate([0,0,-1])cube([2,2,2],center=true);
                }
            }
            for(i = [-1:1:n      ]){
                translate([55+(i-1)*110,4.9,42]){
                    rotate([-90,0,0])cylinder(r=6,h=5);
                    translate([0,0,0])rotate([-90,0,0])cylinder(r=2.5, h=200);
                }
            }
        }
    }
}
