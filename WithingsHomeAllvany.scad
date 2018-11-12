$fn=10;

module WithingsHome(){
    m=85;
    d=75;

    difference(){
        cylinder(r=d/2+3, h=m, center=true);
//        translate([0,0,m/2-2])linear_extrude(height=2)text(text="Withings home", font="Courier Bold", size=7, halign="center");
        translate([0,0,0])cylinder(r=d/2+3, h=m-20, center=true);
        translate([0,0,5])cylinder(r=d/2, h=m, center=true);
    }

}
function szog(t) = t*360;


//WithingsHome();

allvany();

module allvany(){
//difference(){
    s = 200;
    z = (s-37)/sqrt(3)/cos(30);
    rotate(45) 
    difference()
    {
        tetraeder(s);
        translate([s-60, -1, s-30]) rotate([-90,0,0]) furat();
        translate([-1, s-60, s-30]) rotate([0,90,0])furat();
        rotate(-45) translate([0,(z-31)/sqrt(2),z-31])rotate([-atan(1/sqrt(2)),0,0])cylinder(r=75/2, h=200);
    }
    translate([0,z/sqrt(2),z])rotate([-atan(1/sqrt(2)),0,0])WithingsHome();
    //translate([0,z/sqrt(2),z])rotate([szog($t),0,0])WithingsHome();
//}

}

module furat(){
    cylinder(r=1.5, h=30);
    translate([0,0,25]) cylinder(r1=1.5, r2=3.5, h=2);
    translate([0,0,27]) cylinder(r=3.5, h=10);
}
        

module tetraeder(s){
    te_points=[[0,0,0], //0
               [s,0,s], //1
               [0,s,s], //2
               [0,0,s]];//3
    te_faces=[[0,3,1],
              [0,1,2],
              [0,2,3],
              [3,2,1]];
    polyhedron(te_points, te_faces, convexity=10);
}