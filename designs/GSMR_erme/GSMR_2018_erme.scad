use <../atis_lib.scad>

R = 40;
H=6;


//inset_first_layer(inset_width=0.3, render=true)
erme();
//vonat_korvonal();
//scale([1,1,1])rotate_extrude($fn=3*12)translate([3,0,0]) circle(r=1.5, $fn=1.5*12);
module vonat_korvonal()
{
      linear_extrude(height=10)import("./logo_8_BW_vastagitva.dxf");
    
}

module erme(){
    difference()
    {
        cylinder(r=R, h=H, $fn=12*R);
        translate([0,38,2.5])rotate_extrude($fn=3*12)translate([3,0,0]) circle(r=1.5, $fn=1.5*12);
        
        translate([-68/2+4,-40/2,3])vonat_korvonal();
        translate([0,0,H-1])gyuru(R,R, h=1, w=3);
       
        translate([0,R-15,4]) szoveg("GSM-R");
        translate([0,-R+15-2,4]) szoveg("2018");
        //transl,0,])difference()
        
            //rotate([0,0,0])translate([-32,-40,0])scale(0.3)import("Locomotive.stl");
        
        //translate([-32,-40,1])scale(0.3)surface("/home/grof/logo_8.png");
            //translate([0,0,-1])cube([100,100,2], center=true);
        
    }
}

module szoveg(T){
    //linear_extrude(height=2)text(text=T, font="tlwgtypewriter:style=bold", size=10, halign="center", valign="center");
    linear_extrude(height=2)text(text=T, font="dejavusans:style=bold", size=8, halign="center", valign="center");
}

