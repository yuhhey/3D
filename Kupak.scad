fal=5;
d_kulso=120;
$fn=d_kulso*3.14;
h = 30;
r_perem=1;

r_kerekites=3;

r_kulso=d_kulso/2;

difference(){
    union(){
        translate([0,0,-h/2+r_kerekites])
        //TODO: kerekítés nincs levágva, ezért nagy ívű lekerekítésnél kilóg alul a gömb.
            minkowski(){
                cylinder(r=r_kulso-r_kerekites, h=1);
                sphere(r=r_kerekites);
            }
        translate([0,0,r_kerekites/2])cylinder(r=r_kulso,h=h-r_kerekites, center=true);
    }
    //TODO: a kivont henger még nincs legömbölyítve. Ez kis lekerekítésnél nem gond.
    translate([0,0,fal/2])cylinder(r=r_kulso-fal, h=h-fal, center=true);
}

translate([0,0,h/2-r_perem-1])rotate_extrude() translate([r_kulso-fal, 0,0]) circle(r=r_perem);

