slack = 0.25;
/*
  w: eszköz szélessége
  d: eszköz mélysége
  h_r: oldal(sin) hasznos magassága
  d_r: oldal(sin) hasznos melysege. Ennyit lóg be sin. teljes_alj=true esetén nem használjuk.
  ww: anyag falvastagsaga
  teljes_alj: false - h_r, d_r paraméterű sin van csak
              true - teljes alju fiók
*/

// USB hangszoro
// TV távirányító
//tarto(50,190, 30, 10, 3);
// iHome távirányító
//tarto(45,150,8,10,3);
// iptv box távirányító
//tarto(50,190,25,10,3);
// iptv box ?? Melegedést kipróbálni.--> kétfedelő, cirkulálós design

module iptvDV5819B_tarto(){
    difference(){
        szellozos_tarto(122, 121, 30, 10,3);
        translate([3+10,121-0.2,3])cube([122+2*slack-2*10,2*3,30+2*slack]);
        translate([122+3, 33,4+3])cube([2*3, 55-33, 16-4]);
        translate([122+3, 58,7+3])cube([2*3, 74-58, 23-7]);
        translate([122+3, 79,7+3])cube([2*3, 97-79, 23-7]);
    }
}


laptop_h = 23;
laptop_ww = 4;
laptopslot_h = laptop_h - laptop_ww;
difference(){
    union(){
        tarto(233, 195, laptopslot_h, 0,laptop_ww);
        translate([0,0,laptop_h+laptop_ww+2*slack]) tarto(233, 195, laptopslot_h, 0,laptop_ww);
        translate([0,0,2*(laptop_h+laptop_ww)+4*slack]) tarto(233, 195, laptopslot_h, 0,laptop_ww);
        translate([241+2*slack,0,3*(laptop_h+laptop_ww)+6*slack+15]) rotate([0,180,0])tarto(233, 195, 10, 0,laptop_ww);
        translate([80, 190, 0])cube([161+2*slack, 2*laptop_ww, 3*(laptop_h+laptop_ww)+6*slack+15]);
    }
    translate([0, 195-1, 0])cube([243+2*slack, 2*laptop_ww, 3*(laptop_h+laptop_ww)+6*slack+15]);
}
// Apa telefon?? talán a számítógépállványra kéne tenni.



//tarto(100,120, 15, 3, teljes_alj=false);
//szellozos_tarto(100,120, 15, 3);
module tarto(w, d, h_r, d_r, ww=2, teljes_alj=false){
    plusz_anyag = 2 * ww + 2 * slack;
    fw = w + plusz_anyag;
    fh = h_r + plusz_anyag;
    fd = d + plusz_anyag/2; // Előlről nyitott
    difference(){
        cube([fw, fd, fh], center = false);
        translate([ww,-0.1,ww]){cube([w+2*slack, d, h_r+2*slack], center=false);
            if (!teljes_alj){
                translate([d_r,-0.1,-ww-0.1])cube([w-2*d_r+2*slack, d-d_r, 2*ww], center=false);
            }
        }
    }
}


// Teljes alj lesz mindig
module szellozos_tarto(w, d, h_r, d_r, ww=2){
    difference(){
        union(){
            tarto(w, d, h_r, d_r, ww, teljes_alj=false);
            translate([0,0, ww+h_r+slack*2])tarto(w, d, h_r, d_r, ww, teljes_alj=false);
        }
        translate([ww+d_r,0,ww+h_r+slack*2]){
            translate([0,-0.1, -0.1])cube([w-2*d_r, d-d_r, 2*ww], center=false);
            translate([0,d-0.2,ww])cube([w+2*slack-2*d_r,2*ww,h_r+2*slack]);
        }
    }
}
    
