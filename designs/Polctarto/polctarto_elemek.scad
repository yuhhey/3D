use <l_bracket.scad>
use <../atis_lib.scad>

jobbos_oldalelem();;
//a();
//l_bracket(100);
module a(){
    
    import("ShelfSupportA.stl");
}

x=50;
ww=5;
r=(x-ww);
deszka=12.5;

module balos_oldalelem(){
    oldalelem();
}

module jobbos_oldalelem(){
    mirror([1,0,0])oldalelem();
}



module oldalelem(){
    module _cylinder(r,h, center=true){
        cylinder(r=r, h=h, $fn=12*r, center=center);
    }
    difference(){
        cube(x, center=true);
        translate([0/2, x/2,-x/2])rotate([0,90,0])_cylinder(r=r, h=x+2, center=true);
        translate([x/2+3*ww, 0/2,-x/2])rotate([90,0,0])_cylinder(r=r, h=x+2, center=true);//, $fn=12*r);
        translate([ww,ww,-ww])minkowski(){
            cube(x-4,center=true);
            sphere(r=2, $fn=24);
        }
       #translate([-3/2*ww,-x/2-0.2,3/2*ww])rotate([-90,0,0])kivagas(5,5,5.5);
       translate([ww,ww,x/2+0.2])mirror([0,0,1])kivagas(5,5,5.5);
       translate([-ww,-ww,x/2+0.2])mirror([0,0,1])kivagas(5,5,5.5);
       
        
    }
}


module l_bracket(x){
    L=15;
    D=5;
    W=5.5;
    
    m_teljes = 2*ww+deszka;
        difference(){
            cube([x,x,m_teljes], center=true);
            translate([ww, ww, 0])cube([x,x,deszka], center=true);
            translate([-L/2+D/2,-x/2-0.25,0])rotate([-90,0,0])kivagas(L,D,W);
            translate([-x/2-0.25,L/2-D/2,0])rotate(-90)rotate([-90,0,0])kivagas(L,D,W);
            translate([x/2+2*ww, x/2+2*ww, 0])cylinder(r=x, h=m_teljes+2, center=true, $fn=12*x);
            translate([-(x)/2,-(x)/2,0])rotate(45)cube(m_teljes, center=true);
            
        }
        x1=x/2-m_teljes*sqrt(2)/4-ww/2/sqrt(2);
        l_sized=sqrt(2)*m_teljes - ww;
        translate([-x1,-x1,0]){
            rotate(45)
            difference(){
                cube([ww, sqrt(2)*m_teljes-2*ww,m_teljes],center=true);
                translate([-ww/2-0.1,0,0])rotate([0,90,0])#kivagas(5,5,W);
            }
        }
}