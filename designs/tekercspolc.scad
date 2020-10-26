use <atis_lib.scad>

v = 20;
h = v + 50;

//baloldali_rudtarto();
jobboldali_rudtarto();

module jobboldali_rudtarto(){
    rudtarto();
}

module baloldali_rudtarto(){
    mirror([0,1,0]) rudtarto();
}

module rudtarto(){
    difference(){
        
            
                intersection(){
                    union(){
                        cube([190,190,v]);
                        translate([0,190-50,v-10])cube([40,50,40]);
                        translate([0,30+0,v-10])cube([40,50,40]);
                    }
                    translate([-6,70,-1])cylinder(r=200, h=h, $fn=12*200);
                }
                translate([13+10, 0,v+10])rotate([-90,0,0])cylinder(r=10, h=300, $fn=12*10);
                translate([13,0,v+10])cube([40, 200, 40]);
                translate([13+10,0,v])cube([40, 200, 40]);
                translate([460,510,-1])cylinder(r=550,h=h, $fn=12*550);
                translate([10,-466,-1])cylinder(r=500, h=h, $fn=500*12);
                translate([0,0,v/4])hull(){
                    translate([160,37,0])cylinder(r=12, h=30, $fn=12*12);
                    translate([158,65,0])cylinder(r=12, h=30);
                }
           
        
                
        translate([0,0,v-10+26]){
            translate([-0.1,30+50/2+5/2, 0])rotate([0,90,0])kivagas(5,5,13.2);
            translate([-0.1,190-50+50/2-13, 0])rotate([0,90,0])kivagas(5,5,13.2);
            translate([-0.1,190-50+50/2+13, 0])rotate([0,90,0])kivagas(5,5,13.2);
        }
    }
}
