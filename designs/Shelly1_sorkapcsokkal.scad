sk_sz=25;
sk_h1=18;
sk_h2=17;
sk_m=10;
tures = 0.2;

fv=5;

t_sz = 4 * fv + 3 * sk_sz;
t_m = fv + sk_m;
t_h = fv + sk_h1;

sorkapcsok();
//shelly1();
//sorkapocs();

module sorkapcsok(){
    difference(){
        translate([-2,0,0])cube([t_m+2, t_sz, t_h]);
        for(i = [0,1,2]){
            echo(fv+i*(fv+sk_sz));
            translate([0, fv+i*(fv+sk_sz),fv])sorkapocs_befoglalo();
            translate([-4, fv+i*(fv+sk_sz),fv+4])sorkapocs_befoglalo();
        }
    }
}

module sorkapocs(){
    translate([-tures,sk_sz+tures,-tures])rotate([90,0,0])
        linear_extrude(height=sk_sz+2*tures)polygon([[0,0],
                                                     [sk_m+2*tures,0],
                                                     [sk_m+2*tures, sk_h1+2*tures],
                                                     [0, sk_h2+2*tures],
                                                     [0,0]]);
}

module sorkapocs_befoglalo(){
    translate([-tures, -tures, -tures])cube([sk_m+2*tures, sk_sz+2*tures, sk_h1+2*tures]);
}

module shelly1(){
    import("Shelly_1___1PM_-_2_5___EM_-_RGBW2___Dimmer1_2___1L_-_i3_-_Wandhalterung_Wallmount_4842901/SHWH_1-1PM_V2.STL");
}