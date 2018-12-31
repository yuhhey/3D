use <atis_lib.scad>
r=25;
ww=ceil(r*0.15);
r_kicsi = (r - ww)*sqrt(1-0.25)+2; // Egy picivel legyen nagyobb mint az alsó belépő nyílás.
echo(ww, r_kicsi);
h=80;
if (r_kicsi > (r-ww)){
    echo("r_kicsi:", r_kicsi, "r-ww", r-ww);
    //Valahogy itt le kell állítani a futást;
}
//kabelrendezo_elem();
//translate([0,0,80-r_kicsi])rotate(45)kabelrendezo_elem();

//translate([0,0,ww/2])nagy_lezaro();
nagyobb_lezaro();

module nagy_lezaro(){ // make me
    lezaro(r, ww, h);
}

module nagyobb_lezaro(){ // make me
    lezaro(r+ww+.5, ww, h);
}

module lezaro(r,ww, h){
   // inset_first_layer(inset_height=0.31,inset_width=0.2, render=true)
        translate([0,0,r/2])difference(){
            gob(r,ww);
            translate([0,0,h/2-r/2])linear_extrude(height=h, center=true)polygon([[0,r/3],[2*r,r],[2*r, -r],[0,-r/3],[0,r/3]]);
        }
}


    
module kabelrendezo_elem(){ // make me
    inset_first_layer(inset_height=0.31,inset_width=0.2, render=true){
         translate([0,0,r/2])difference(){
            union(){
                gob(r,ww);
                translate([0,0,r/2+(h-r-r_kicsi)/2])cylinder(r1=r*sqrt(1-0.25),r2=(r_kicsi)*sqrt(1-0.25),h-r-r_kicsi, center=true, $fn=12*r);
                translate([0,0,h-(r+r_kicsi)/2])gob(r_kicsi,ww);
            }
            translate([0,0,h/2-r/2])linear_extrude(height=h, center=true)polygon([[0,r/3],[2*r,r],[2*r, -r],[0,-r/3],[0,r/3]]);
            translate([0,0, r/2-ww/2])#cylinder(r1=(r-ww)*sqrt(1-0.25), r2=(r_kicsi-ww)*sqrt(1-0.25), h=h-r-r_kicsi+ww, $fn=12*r);
        }
    }
}    

module gob(r, ww){
    difference(){
        ures_golyo(r,ww);
        translate([0,0,3*r/2])cube([2*r, 2*r, 2*r], center=true);
        translate([0,0,-3*r/2])cube([2*r, 2*r, 2*r], center=true);
        
    }
}


module ures_golyo(r, ww){
    difference(){
        sphere(r=r, $fn=r*12);
        sphere(r=r-ww,$fn=r*12);
    }
}

module ures_kup(r1, r2, h, w){
    difference(){
        cylinder(r1=r1,r2=r2,h, center=true, $fn=r1*12);
        cylinder(r1=r1-w, r2=r2-w, h+1 , center=true, $fn=r1*12);
    }
}
