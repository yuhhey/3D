use <../brio/sinek/tracklib.scad>

h=wood_height();

//kozepelem();
module kozepelem(){ //makeme
    felidom();
    rotate(180) felidom();
}

module alja(){ // makeme
    module felalja(){
        translate([10,0,-1] )cube([20,18,2], center=true);
        butykok();
    }
    felalja();
    rotate(180)felalja();
}

module teteje(){ // makeme
    module felteteje(){
        difference(){
            translate([10,0,2.5])cube([20,18,5], center=true);
            butykok(r=1.15,h=3.3);
            translate([0,0,-2]) wood_cutout($fn=76);
        }
    }
    felteteje();
    rotate(180) felteteje();
}
        


module butyok(r=1, h=3){
    cylinder(r=r,h=h, $fn=round(12.5*r));
}

module butykok(r=1, h=3){
    translate([2.5,6.5,0])butyok(r,h);
    translate([2.5,-6.5,0])butyok(r,h);
    translate([17.5,6.5,0])butyok(r,h);
    translate([17.5,-6.5,0])butyok(r,h);
}

module felidom(){
    difference(){
        union(){
            translate([10,0,h/2])cube([20,18,h], center=true);
            translate([0,0,h])butykok(h=3);
        }
        translate([0,0,-1])wood_cutout(h+2, $fn=76);
        translate([12,0,3*h/4])cube([8,20,h/2], center=true);
        butykok(r=1.15, h=3.3);
        /*translate([2.5,6.5,0])butyok(r=1.15);
        translate([2.5,-6.5,0])butyok(r=1.15);
        translate([17.5,6.5,0])butyok(r=1.15);
        translate([17.5,-6.5,0])butyok(r=1.15);*/
    }
}