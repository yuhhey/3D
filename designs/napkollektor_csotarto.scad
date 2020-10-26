cso_atmero = 32;
falvastagsag = 4;
n = 4;
sz = 30;
m = falvastagsag + 8 + cso_atmero; //fixen 8mm a csavarnak
tures = 0.4;

h = n*(cso_atmero+falvastagsag+2*tures) + falvastagsag;

origo_tavolsag = cso_atmero+2*tures+falvastagsag;

alpha = 115; //a körcikk, amit ki akarok vágni központi szöge
kivagas_d_origo = cso_atmero/2*cos(alpha/2); //A kivágás távolsága a hengerek középpontjától

//oldalára fektetve csinálom, hogy a hengereket ne kelljen forgatni
difference(){
    cube([h, m, sz]);
    translate([0,falvastagsag+8+cso_atmero/2+kivagas_d_origo, 0])cube([h,m,sz]);
    for(i = [0 : n-1]){
        x = falvastagsag + cso_atmero / 2 + tures + i * origo_tavolsag;
        translate([x,0,0]){
           translate([0, falvastagsag+8+cso_atmero/2, -0.1])cylinder(r=cso_atmero/2, h=sz+1, $fn=6*cso_atmero);
           if (!(i%2)) translate([0,falvastagsag+8+16,sz/2])rotate([90,0,0])screw_hole();
        }
    }
}

    
module screw_hole(){
    cylinder(r=2.75, h=100, $fn=12*2.5);
    translate([0,0,-1])cylinder(r=5.4, h=23, $fn=12*5);
}