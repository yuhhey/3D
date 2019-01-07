
//$fs=0.2;
//$fa=0.2;

stl=430;
tw=40;
th=25;


//meretek(stl, tw,th, 1);

//uvegmodel();

//allvany(stl,tw,th);

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

    translate([-250,-75,0]){
        lec(1,stl,tw,th,1,8);
        translate([cos(30)*tw, -sin(30)*tw,25])rotate([0,0,60]) lec(1,stl,tw,th,1,8);
        translate([2*cos(30)*tw+stl, 0,25])
                rotate([0,0,120]) lec(1,stl,tw,th,1,8);
    }
}
module meretek(stl, tw,th,iv){
    for(ns=[1:5]){
        lec_kalkulator(ns, stl, tw, th, iv);
    }
}


module allvany(stl, tw,th){
    for(l=[0,3*th,6*th]){
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

    l=9*th;
    translate([0,0,l])lec(3, stl,tw,th,2,8);
        translate([sin(30)*stl,cos(30)*stl,l])lec(3, stl,tw,th,2,8);
        translate([0,2*cos(30)*stl,l])lec(3, stl,tw,th,2,8);
}

module palack(){
    cylinder(r=75/2, h=200);
}

module lec_kalkulator(ns, stl, tw, th, iv){
 echo("Fizikai hossz:", ns*stl+2*sqrt(3)*tw/2);
 //echo("Belső 3szög oldalhossz:",stl-tw);
}

module lec(ns, stl,tw,th, iv, d)
{
    dx = tw/2*sqrt(3);
    tl = 2*dx+ns*stl;
    l = tl - 2*iv;
    w = tw - 2*iv;
    h = th - 2*iv;
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