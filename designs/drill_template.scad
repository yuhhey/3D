w = 69;
h = 25;
R = 4;
ww = 4;

cimke = str(w,"x",h, "\u00f8", 2*R);

rotate([180,0,0,])difference(){
    union(){
        elem();
        translate([2*(w+ww)-ww,0,0])mirror([1,0,0])elem();
    }
    translate([w+ww/2-3*ww/2,h-ww,-1])cube([3*ww,3*ww,11]);
    translate([(w+1),-1, 15])rotate([-90,0,0])linear_extrude(height=3)mirror([0,1,0])text(cimke, size=15, halign="center", font="Purisa:style=Bold");
    translate([(w+ww/2),h+ww+.5, 25])rotate([90,0,0])linear_extrude(height=3)mirror([0,1,0])text(cimke, size=15, halign="center", font="Purisa:style=Bold");
    
}

module elem(){
    difference(){
        cube([w+ww,h+ww, 35]);
        for(x = [w/4, w*3/4]){
            translate([x, h/2,-1])cylinder(r=R+0.2, h =100, $fn=R*12);
        }
        cube([w,h,10]);
        
    }
}