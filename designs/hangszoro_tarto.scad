// Hangszórótartó
// Rés magassága: 6mm
// Szélesség: 86mm (legnagyobb távolság, ami a talpon mérhető)
// magasság: 79mm (legrövidebb távolság, ami a talpon mérhető)
// Talp vastagság: 3.5mm

fv = 6;
perem_vastagsag = 2.5;
h_lyukfej = 2.5;
d_lyukfej = 7.5;
d_lyukszar = fv-h_lyukfej;

hossz=60;
sz=20;
difference(){
    cube([hossz,sz,fv]);
    translate([-0.05,(sz-6),perem_vastagsag])cube([hossz+.1,sz,fv-perem_vastagsag+.1]);
    translate([0,(sz-6)/2, 2*fv])
    for(x=[hossz/4,3/4*hossz]){
        translate([x,0,0])
            mirror([0,0,1])#csavarlyuk(fv,
                                       h_lyukfej,
                                       d_lyukfej,
                                       d_lyukszar);
    }
}

module csavarlyuk(fv, h_lyukfej, d_lyukfej, d_lyukszar){
    translate([0,0,2*fv-h_lyukfej])cylinder(r=d_lyukfej/2, h=h_lyukfej+.1, $fn=6*d_lyukfej);
    translate([0,0,-.1])cylinder(r=d_lyukszar/2,h=2*fv,$fn=6*d_lyukszar);
}
