slack = 0.5;
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
difference(){
    szellozos_tarto(120, 120, 30, 10,3);
    translate([3+10,120-0.2,3])cube([120+2*slack-2*10,2*3,30+2*slack]);

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
                translate([d_r,-0.1,-ww-0.1])cube([w-2*d_r, d-d_r, 2*ww], center=false);
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
    
