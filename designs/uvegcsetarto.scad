gombolyites = 2;
koz = 5;

if (koz < 2*gombolyites){
    echo("Köz túl kicsi!");
    a=1/0;
}

r_kicsi = 6.5;
r_kozepes = 17.5;
r_nagy = 27;

Rek = [r_kicsi, r_kicsi, r_kozepes, r_kozepes, r_kozepes, r_nagy, r_nagy];
yok = [koz,
       2*koz+2*Rek[0],
       3*koz+2*(Rek[0]+Rek[1]),
       4*koz+2*(Rek[0]+Rek[1]+Rek[2]),
       5*koz+2*(Rek[0]+Rek[1]+Rek[2]+Rek[3]),
       6*koz+2*(Rek[0]+Rek[1]+Rek[2]+Rek[3]+Rek[4]),
       7*koz+2*(Rek[0]+Rek[1]+Rek[2]+Rek[3]+Rek[4]+Rek[5]),
       8*koz+2*(Rek[0]+Rek[1]+Rek[2]+Rek[3]+Rek[4]+Rek[5]+Rek[6]),
       9*koz+2*(Rek[0]+Rek[1]+Rek[2]+Rek[3]+Rek[4]+Rek[5]+Rek[6]+Rek[7]),
      10*koz+2*(Rek[0]+Rek[1]+Rek[2]+Rek[3]+Rek[4]+Rek[5]+Rek[6]+Rek[7]+Rek[8])];
// x,y,r





kicsi_tartok = [[koz, koz,6.5],
          [koz, koz+13+koz, 6.5],
          [koz, koz+13+koz+13+koz, 6.5],
          [koz, koz+13+koz+13+koz+13+koz, 6.5],
          [koz, koz+13+koz+13+koz+13+koz+13+koz, 6.5],
          [koz, koz+13+koz+13+koz+13+koz+13+koz+13+koz, 6.5],
          [koz+13+koz, koz,6.5],
          [koz+13+koz, koz+13+koz, 6.5],
          [koz+13+koz, koz+13+koz+13+koz, 6.5],
          [koz+13+koz, koz+13+koz+13+koz+13+koz, 6.5],
          [koz+13+koz, koz+13+koz+13+koz+13+koz+13+koz, 6.5],
          [koz+13+koz, koz+13+koz+13+koz+13+koz+13+koz+13+koz, 6.5],

/*          [koz+13+koz+13+koz, koz,6.5],
          [koz+13+koz+13+koz, koz+13+koz, 6.5],
          [koz+13+koz+13+koz, koz+13+koz+13+koz, 6.5],
          [koz+13+koz+13+koz, koz+13+koz+13+koz+13+koz, 6.5],
          [koz+13+koz+13+koz, koz+13+koz+13+koz+13+koz+13+koz, 6.5],
          [koz+13+koz+13+koz, koz+13+koz+13+koz+13+koz+13+koz+13+koz, 6.5]*/
          ]; 

kozepes_tartok = [[koz+13+koz+13+koz, koz, r_kozepes]
                 ];

nagy_tartok = [[]
              ];


function darabok(r, koz, sz) = let(s=2*r+koz, ka=koz/s, d=sz/s, fd = floor(d)) ((d - fd) < ka) ? fd-1 : fd;



   
      
uvegtarto();
    
module uvegtarto(){
    
    function xek(r, koz, sz) = let(
        s=2*r+koz,
        ka=koz/s,
        d=sz/s,
        fd = floor(d),
        db = (d - fd+0.0000001) < ka ? fd-1 : fd,
        szelso = (sz - db*2*r-(db-1)*koz)/2)
        [for (i = [0:1:db-1]) szelso+i*s+r];
    minkowski(){   
        difference(){
            cube([85-2*gombolyites,355-2*gombolyites,20-2*gombolyites]);
            for( i = [0:1:len(yok)-1]){
                y = yok[i]-gombolyites;
                for( x = xek(Rek[i], koz, 85)){
                    translate([x-gombolyites,y+Rek[i],koz-gombolyites])cylinder(r=Rek[i]+gombolyites, h=30, $fn=60);
                }
            }
        }
        sphere(r=gombolyites, $fn=24);
    }
}
        
   
/*difference(){
    minkowski(){
        cube([220-2*gombolyites,6*13+7*koz,30-2*gombolyites]);
        sphere(r=gombolyites);
    }

    for (t = kicsi_tartok){
        translate([t[0]+t[2], t[1]+t[2], 15]) cylinder(r=t[2], h=20,center=false);
    }
    for (t = kozepes_tartok){
        translate([t[0]+t[2], t[1]+t[2], 15]) cylinder(r=t[2], h=20,center=false);
    }
}*/