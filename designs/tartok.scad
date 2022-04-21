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
tarto(100,120, 15, 3, teljes_alj=false);
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