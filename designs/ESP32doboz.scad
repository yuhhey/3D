pcb_w = 107;
pcb_d = 80.5;
pcb_h = 2;
pin_h = 3;
part_h = 18;
grove_d = 2; // vályat oldalon ilyen mély bemarás kell
screwhole_dx = 5+1.6; // a két rögzítő csavar furat középpontjának a pcb szélétől mért távolsága
screwhole_tamasz = 10; // a furatlyuk felfekvésének oldalhoszza. Négyzettel számolunk.
ww = 2; // A doboz falvastagsága
karima = 5;
tures=0;


// Két részből rakjuk össze: a PCB felső síkjáig tart az egyik és onnan folytatódik a teteje


teljes_w = pcb_w + 2 * ww;
teljes_d = pcb_d + 2 * ww;
also_h = ww + pin_h + pcb_h + karima;
felso_h = part_h + ww;

felso_fel();
//translate([110,100,0])also_fel();

module also_fel(){
    difference(){
        translate([-ww, -ww, -ww])cube([teljes_w, teljes_d, also_h]);
        
        cube([pcb_w, pcb_d-grove_d,pin_h+3]);
        translate([0,0,pin_h])cube([pcb_w, pcb_d, pcb_h+karima +.1]);
        translate([-ww,-ww,pin_h+pcb_h])cube([ww+tures,pcb_d+2*ww,karima]);
        translate([pcb_w-tures,-ww,pin_h+pcb_h])cube([ww+tures,pcb_d+2*ww,karima]);
        for(x = [0, pcb_w-screwhole_tamasz]){
            #translate([x+screwhole_tamasz/2, screwhole_tamasz/2, -ww-1])cylinder(h=50, r=1.5, $fn=1.5*12);
        }

    }


    for(x = [0, pcb_w-screwhole_tamasz]){
        translate([x,0,0])
            difference(){
                cube([screwhole_tamasz, screwhole_tamasz, pin_h]);
                translate([screwhole_tamasz/2, screwhole_tamasz/2, 0])cylinder(h=50, r=1.5, $fn=1.5*12);
            }
    }
    //translate([0, pcb_d+ww-2,pin_h+pcb_h])rotate(-90)trapez(tures=tures);
}

module felso_fel(){
    difference(){
        translate([-ww, -ww, -ww])cube([teljes_w, teljes_d, felso_h]);
        cube([pcb_w, pcb_d-grove_d, part_h]);
        translate([0, pcb_d-grove_d-18,-ww])cube([pcb_w, 18, ww+1]);
        translate([0, 0, -ww])cube([pcb_w, 34, ww+1]);    
        translate([0, pcb_d, felso_h-karima-ww])cube([pcb_w, ww, karima]);
        translate([tures,-ww,part_h-karima-tures])cube([pcb_w - 2*tures, ww, karima+pcb_h]);
    }
    for(x = [0, pcb_w-screwhole_tamasz]){
        translate([x,0,-ww])
            difference(){
                cube([screwhole_tamasz, screwhole_tamasz, part_h+ww]);
                translate([screwhole_tamasz/2, screwhole_tamasz/2, -1])cylinder(h=50, r=2.5, $fn=2.5*12);
            }
    }
    //translate([pcb_w,pcb_d,part_h-karima])rotate(90)trapez();
    
}

module trapez(tures=0){
    pontok = [[0,0],
              [0,karima],
              [ww-2, karima],
              [0,0]
    ];
    translate([0, pcb_w-tures, 0])rotate([90,0,0])linear_extrude(height=pcb_w-2*tures)polygon(pontok);
}