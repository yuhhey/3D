minkowski()
{
    difference(){
        cylinder(r1=80, r2=65, h=55, $fn=320);
        translate([0,0,-0.1])cylinder(r1=78, r2=65, h=56, $fn=320);
    }

    difference(){
        sphere(r=1.5, $fn=15);
        translate([-5,-5,-10])cube([10,10,10]);
    }
}
cylinder(r=80, h=2, $fn=400);
a = atan(30/7.5);
r = 7.5/cos(90-a);
h = r*sin(90-a);
echo(a,h,r);

translate([0,0,30-h])difference(){
    sphere(r=r, $fn=60  );
    translate([-r,-r,-r*2+h]) cube([2*r, 2*r, 2*r]) ;
}
difference(){
    cylinder(r1=15, r2=7.5, h=30, $fn=120);
    //cylinder(r1=13, r2=5.5, h=30, $fn=120);
}
    
