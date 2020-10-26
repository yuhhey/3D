
uveg_d = 75;
n = 4;
tw=37;
th=25;
stl = uveg_d*(1/tan(30) + n - 1) + 1/tan(30)*tw;
//stl=419; // Ebben már benne van az üveg átmérője.
echo("STL: ",stl);

meretek(stl, tw,th, 1);

//uvegmodel();

//!!!TODO: Ha a magasság 2x-ese kisebb mint a szélesség, akkor hibázik.
tetszoleges_allvany([3,3,4,3,3]);

//allvany_3magas_1szeles(stl,tw,th);
//allvany_4magas_2szeles(stl,tw,th);
//hatszog();
//cos(30)*tw+stl

module hatszog(){
    hatszog_oldalak = [[0,0, 0],
                        [stl,0, th],
                        [stl*(1+sin(30)),stl*cos(30), 2*th],
                        [stl, 2*stl*cos(30),],
                        [0,2*stl*cos(30),th],
                        [-stl*sin(30),stl*cos(30),2*th]];
    for(i = [0:5]){
        translate([hatszog_oldalak[i][0],hatszog_oldalak[i][1],hatszog_oldalak[i][2]])rotate(i*60)translate([-tw*sqrt(3)/2,-tw/2,0])lec(1,stl, tw, th, 3,5);
    }       

    hatszog_atlok = [[-stl*sin(30), stl*cos(30)],
                      [0,0],
                      [stl, 0]];
    for(i = [0,1,2]){
        translate([hatszog_atlok[i][0], hatszog_atlok[i][1],i*th])rotate(i*60)translate([-tw*sqrt(3)/2, -tw/2, 0])
        lec(2,stl, tw, th, 2,4);
    }
}

module uvegmodel(){
    for (x=[-75-75/2:75:150]){
        translate([x,0,0])palack();
    }

    translate([-(stl+2*sqrt(3)*tw/2)/2,-75,0]){
        lec(1,stl,tw,th,1,8);
        translate([cos(30)*tw, -sin(30)*tw,25])rotate([0,0,60]) lec(1,stl,tw,th,1,8);
        translate([2*cos(30)*tw+stl, 0,25])
                rotate([0,0,120]) lec(1,stl,tw,th,1,8);
    }
}
module meretek(stl, tw,th,iv){
    for(ns=[0:5]){
        lec_kalkulator(ns, stl, tw, th, iv);
    }
    echo(" A nullás hossz a lábnál lévő helykitöltő pöcök.");
}


module allvany_3magas_1szeles(stl, tw,th){
    fuggoleges_oszlop_magassagok = [2,1,2,1,2];
    n = 4; // szekrény mélysége
    for(l=[0:3*th:n*3*th]){
        translate([0,0,l])lec(3, stl,tw,th,2,8);
        translate([sin(30)*stl,cos(30)*stl,l])lec(3, stl,tw,th,2,8);
        translate([0,2*cos(30)*stl,l])lec(3, stl,tw,th,2,8);

        for (i =[0:2]){
            translate([cos(30)*tw+i*stl, -sin(30)*tw,l+th])rotate([0,0,60]) lec(2,stl,tw,th,1,8);
        }
        translate([cos(30)*tw+3*stl, -sin(30)*tw,l+th])rotate([0,0,60]) lec(1,stl,tw,th,1,8);

        for (i=[1:3]){
            translate([2*cos(30)*tw+i*stl, 0,l+2*th])
                rotate([0,0,120]) lec(2,stl,tw,th,1,8);
        }
        translate([2*cos(30)*tw+(-sin(30)+4)*stl, cos(30)*stl,l+2*th])
                rotate([0,0,120]) lec(1,stl,tw,th,1,8);
    }

    l=(n+1)*3*th;
    translate([0,0,l])lec(3, stl,tw,th,2,8);
        translate([sin(30)*stl,cos(30)*stl,l])lec(3, stl,tw,th,2,8);
        translate([0,2*cos(30)*stl,l])lec(3, stl,tw,th,2,8);
}

module allvany_4magas_2szeles(stl, tw,th){
    fuggoleges_oszlop_magassagok = [3,3,4,4,5];
    n = 3; // szekrény mélysége
    m = max(fuggoleges_oszlop_magassagok);
    for(l=[0:(m-1)*th:n*(m-1)*th]){
        //for(o = fuggoleges_oszlop_magassagok)
        translate([-stl/2,-2*cos(30)*stl,l])lec(3, stl,tw,th,2,8, center=true);
        translate([0,-cos(30)*stl,l])lec(3, stl,tw,th,2,8, center=true);
        translate([0,0,l])lec(4, stl,tw,th,2,8, center=true);
        translate([0,cos(30)*stl,l])lec(3, stl,tw,th,2,8, center=true);
        translate([-stl/2,2*cos(30)*stl,l])lec(3, stl,tw,th,2,8, center=true);

        for (i =[0:m-2]){
            translate([(i-1)*stl-max(i-1,0)/2*stl*sin(30), -max(i-1,0)/2*stl*cos(30),l+th])rotate([0,0,60]) lec(5-max(i,1),stl,tw,th,1,8, center=true);
        }
        translate([-2*stl+stl*sin(30), cos(30)*stl,l+th])rotate([0,0,60]) lec(2,stl,tw,th,1,8, center=true);

        for (i=[0:m-2]){
           translate([(i-1)*stl-max(i-1,0)*stl*sin(30)/2,
                     max(i-1,0)/2*stl*cos(30),
                     l+2*th])
                 rotate([0,0,120])lec(5-max(i,1),stl,tw,th,1,8, center=true);
        }
        translate([-stl-stl*sin(30), -cos(30)*stl,l+2*th])rotate([0,0,120])
            lec(2,stl,tw,th,1,8, center=true);
    }

    l=(n+1)*3*th;
    //translate([0,0,l])lec(3, stl,tw,th,2,8);
    //translate([sin(30)*stl,cos(30)*stl,l])lec(3, stl,tw,th,2,8, center=true);
    //translate([0,2*cos(30)*stl,l])lec(3, stl,tw,th,2,8,center=true);
}

module tetszoleges_allvany(m){ //m: függőleges tartók magasságait tartalmazó vektor
    max_m = max(m);
    len_m = len(m);
    //echo("len m: ", len_m);
    echo(max_m);
    w = [for(i = [0:2*max_m+1])
                [for(f = [0:len_m-1]) [(i <= 2 * m[f]+1) ? (pow(-1, i) * pow(-1,f)) : -1, f, i]]];
    
    function calc_n30(o, s, lm) = ((w[s+lm][lm][0] == 1) || (lm<0)) ? lm - o: calc_n30(o, s, lm-1);
    function calc_n120(o, s, lm) = ((w[s+o-lm][lm][0] == 1) || (lm>=len_m-1)) ? o-lm: calc_n120(o, s, lm+1);
    // Függőleges elemek
    for(n = [0:2]){
        translate([0,3*n*th,0]){
            for(i = [0:len_m-1]){
                translate([i*stl*cos(30),0,(m[i]+ (i%2))/2*stl])rotate([0,90,0])lec(m[i], stl, tw, th, 1, center=true);
            }
        }
        // bal alsó --> jobb felső 
        // lehetne a kiinduló ponttól kezdeni.
        
        translate([0,(3*n+1)*th,0]){
            
            for(l = w[0]){
                if (l[0] == 1){
                    h = calc_n30(l[1], l[2], len(m));
                    //echo(h,l);
                    //translate([l[1]*stl*cos(30),0,0])
                    translate([(h/2+l[1])*cos(30)*stl, 0,h/2*sin(30)*stl])rotate([90,-30,0])lec(h, stl, tw, th,1, center=true);

                }
            }
            
            // !!!TODO: A bal alsó sarokból induló lécet még duplázza
        
            for(s = w){
                //echo(s);
                if (s[0][0] == 1){
                   h = calc_n30(s[0][1], s[0][2], len(m));
                   //translate([0,0, s[0][2]*stl/2])
                    //echo(s[0],h);
                    translate([h/2*cos(30)*stl, 0,(h/2*sin(30)+s[0][2]/2)*stl])rotate([90,-30,0])lec(h, stl, tw, th,1, center=true);
                }
            }
        }
        
        
        translate([0, (3*n+2)*th,0]){ 
            //jobb alsó --> bal felső
            
            
            for(l = w[0]){
                if (l[0] == 1){
                    h = calc_n120(l[1], l[2], 0);
                    //echo(h,l);
                    translate([(h/2)*cos(30)*stl, 0,h/2*sin(30)*stl])rotate([90,-150,0])lec(h, stl, tw, th,1,center=true);

                }
            }
            // !!!TODO: A job alsó sarokból induló lécet még duplázza
            for(s = w){
                //echo(s);
                i = len_m-1;
                if (s[i][0] == 1){
                   //echo(s[i]);
                   h = calc_n120(s[i][1], s[i][2], 0);
                   //echo(h);
                   translate([((len_m-1)-h/2)*cos(30)*stl,0, (h/2*sin(30)+s[i][2]/2)*stl])rotate([90,-150,0])translate([0,0,0*tw])lec(h, stl, tw, th,1,center=true);
                }
            }
        } 
    }
    translate([0,3*3*th,0]){
        for(i = [0:len_m-1]){
            translate([i*stl*cos(30),0,(m[i]+ (i%2))/2*stl])rotate([0,90,0])lec(m[i], stl, tw, th, 1, center=true);
        }
    }
}

module palack(){
    cylinder(r=75/2, h=200);
}

module lec_kalkulator(ns, stl, tw, th, iv){
 echo("Fizikai hossz:", ns, ns*stl+2*sqrt(3)*tw/2);
 //echo("Belső 3szög oldalhossz:",stl-tw);
}

module lec(ns, stl,tw,th, iv, d,center=false)
{
    dx = tw/2*sqrt(3);
    tl = 2*dx+ns*stl;
    l = tl - 2*iv;
    w = tw - 2*iv;
    h = th - 2*iv;
    
    module _lec(ns, stl,tw,th, iv, d){
        intersection(){
            translate([iv,iv,iv])
                minkowski(){
                    cube([l,w,h]);
                    sphere(r=iv);
                }
            difference(){
                cube([tl,tw,th]);
                for(x=[dx:stl:tl]){
                    translate([x,tw/2,-10])cylinder(r=d/2, h=th+10, $fn=12*d/2);
                }
            }
        }
    }
    
    if (center)
        translate([-tl/2, -tw/2, -th/2]) _lec(ns, stl,tw,th, iv, d);
    else
        _lec(ns, stl,tw,th, iv, d);
    
}