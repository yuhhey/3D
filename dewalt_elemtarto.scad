
aksi_tarto_kozepso(n=2);

module aksi_foglalat(){
    //65x??x84.5
    translate([0,0,84.3])rotate([180,0,0])import("DeWalt_battery_adapter/files/DBC200v2.stl");
}


module aksi_tarto_kozepso(n=4){
    scale_factor = 1.01;
    t_magassag = 84.3 * scale_factor;
    t_szelesseg = n*110;
    union(){
        for(i = [1:1:n]){
            translate([(i-1)*110,0,0])scale(scale_factor)aksi_foglalat();
        }
        
        difference(){
            minkowski(){
                translate([-54,6,0])cube([t_szelesseg-2,15,t_magassag]);
                difference(){
                    rotate([0,90,0])cylinder(r=1, h=2, $fn=12, center=true);
                    translate([0,0,-1])cube([2,2,2],center=true);
                }
            }
            //translate([t_szelesseg-65-20+10,5,0]) cube([21,17, t_magassag+1                    ]);
            for(i = [-1:1:n      ]){
                translate([55+(i-1)*110,4.9,42]){
                    rotate([-90,0,0])cylinder(r=6,h=5, $fn=12*6);
                    translate([0,0,0])rotate([-90,0,0])cylinder(r=2.5, h=200, $fn=12*2.5);
                }
            }
        }
    }
}
