// Hangszórótartó
// Rés magassága: 6mm
// Szélesség: 86mm (legnagyobb távolság, ami a talpon mérhető)
// magasság: 79mm (legrövidebb távolság, ami a talpon mérhető)
// Talp vastagság: 2.5mm

fv=5;
h_lyukfej=2.5;
d_lyukfej=7.5;
d_lyukszar=4;

difference(){
    cube([80,30,fv]);
    translate([-0.05,15,2.5])cube([80.1,30,2.6]);
    translate([0,7.5, 2*fv])
    for(x=[20,60]){
        translate([x,0,0])
            mirror([0,0,1])csavarlyuk(fv,
                                      h_lyukfej,
                                      d_lyukfej,
                                      d_lyukszar);
    }
}

module csavarlyuk(fv, h_lyukfej, d_lyukfej, d_lyukszar){
    translate([0,0,2*fv-h_lyukfej])cylinder(r=d_lyukfej/2, h=h_lyukfej+.1, $fn=6*d_lyukfej);
    translate([0,0,-.1])cylinder(r=d_lyukszar/2,h=2*fv,$fn=6*d_lyukszar);
}
