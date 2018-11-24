use <dotscad/pie.scad>;
use <brio/tracklib.scad>;
use <atis_lib.scad>;

//*Herz 1 kilos spool
inner = 52.5; //線圈內徑
outer = 100; //線圈外徑
thick = 1.5; //壁厚
hight = 58; //高度
//*/

/*Colorfabb 0.75 kilos spool
inner = 53;
outer = 100;
thick = 3.9;
hight = 46; 
*/

//numbers = 4; //個數
central_angle = 120;
screw_size = 5;
$fn = 360;

angles = [0, central_angle];

inset_first_layer(inset_height=0.31,inset_width=0.5, render=true)
    holder();
    

//shell();
//translate([outer-8, 8, 0]) screw();

module arc(outer,inner){
    points_outer = [for(a = [angles[0]:1:angles[len(angles)-1]]) [outer * cos(a), outer * sin(a)]];
    points_inner = [for(b = [angles[0]:1:angles[len(angles)-1]]) [inner * cos(b), inner * sin(b)]];
   // echo(points_outer);
//    for(c = points_outer){
//        translate([c[0],c[1],0]) circle(.5);
//    }
    difference(){
        polygon(concat([[0, 0]], points_outer, [[0,0]]));
        polygon(concat([[0, 0]], points_inner, [[0,0]]));
        
        //translate([outer-5,5,0]) circle(screw_size/2);
        //translate([outer-8,0,0]) square([6,6]);
    }
}

module shell(){
    difference(){
        arc(outer,inner);
        offset(-thick) arc(outer,inner);
    }
}

module handle(){
    rotate(central_angle)
    //translate([outer*cos(central_angle)+thick*2*cos(central_angle-90),outer*sin(central_angle)+thick*2*sin(central_angle-90),1])
    {
        translate([outer,-thick,0])
        #offset(thick/2) square([10,thick/2]);    
    }
}

module screw(){
    difference(){
        circle(5);
        circle(screw_size/2);
    }    
}

module holder(){
    linear_extrude(thick){
        arc(outer,inner);
    }
    linear_extrude(hight){
        shell();
        
        for (i = [1:len(angles)-2]){
            a = angles[i];
            echo(a);
            rotate(a) translate([inner+thick/2,0,0])square([outer-inner-thick, thick]);
        }
    }
    translate([outer-5,5,0]){
        linear_extrude(hight){
            screw();
        }
    }
    linear_extrude(hight){
        handle();
    }
}

module egyharmad_korong(){
    difference(){
            intersection(){
                korong();
                rotate(60) pie(200, 120,8);
                //translate([-80,80,0])cylinder(r=100, h=8);
            }
        rotate(-120){
            translate([-88,0,0])rotate(-90)wood_cutout(h=8);
        }
            translate([-9,0,0])rotate(90)wood_cutout(h=8);
        
    }

    translate([-88,0,0])rotate(-90)wood_plug(h=8);
    rotate(240)translate([-9,0,0])rotate(90)wood_plug(h=8);
    
}

//egyharmad_korong();
//rotate(-120) egyharmad_korong();
//translate([20,0,-4])wood_plug(, h=8);
//difference(){
//    cube([40,30,8], center=true);
//    translate([-20,0,-4])wood_cutout(h=8);
//    translate([10,0,-1])cylinder(r=4.5, h = 5, $fn=6);
//}

module korong(){
    difference(){
        cylinder(r=outer, h=8, $fn=628);
        for(sz = [0,120,240]){
            rotate(sz) translate([outer-8,0,0]){
                cylinder(r=2.5, h = 8, $fn=16);
                rotate(30)cylinder(r=4.5, h = 5, $fn=6);
            }
            hull(){
                rotate(sz+75) translate([0.5*outer,0,0])cylinder(r=0.30*outer, h = 8, $fn=212);
                rotate(sz+15) translate([0.7*outer,0,0])cylinder(r=0.10*outer, h=8, $fn=88);
            }
            
            
            
        }
    }
}