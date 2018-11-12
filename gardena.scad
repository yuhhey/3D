use <bezier.scad>

vastagsag = 20;
sarok_meret = 100;
difference(){
    cube([sarok_meret, sarok_meret, sarok_meret]);
    translate([20,20,0])cube([sarok_meret, sarok_meret, sarok_meret]);
}
color([0,1,0 ])translate([vastagsag, vastagsag, 0]) BezQuadCurve( [[0, sarok_meret-vastagsag],[0,0.3*sarok_meret],[0.3*sarok_meret,0],[sarok_meret-vastagsag,0]], [0,0], 10, sarok_meret);
color([1,0,0])rotate(135) translate([-vastagsag/2, 0,0])cube([vastagsag, sarok_meret, sarok_meret]);