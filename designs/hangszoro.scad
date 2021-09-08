use <atis_lib.scad>

r_hangszoro=118/2;

r = 40;
g=3;
v_fal = 15;
h = 60;
v_illesztes = v_fal/2;
g_illesztes =  0;
h_illesztes = h/10;
hossz=250;
rovid_hossz = hossz/4;
R = 2*r+v_fal/2;
sz_doboz = r + r + hossz + 2* v_fal; 
h_doboz = v_fal + 2 * r + v_fal + 2 * R + v_fal;
m_doboz = h + v_fal;
tures=0.5;
// TODO: - illesztéseknél a pozitív esetet leimplementálni.
//       - illesztesek felvinni a modelre.
//       - model másik részét elkészíteni
//       - próbadarabot az illesztéshez készíteni.



//iv(90);

//hangszoro();


function dx(i)= i * (v_fal/2+r);

doboz(rough=false, kiall=true);
/*mirror([1,0,0])doboz(rough=false, kiall=true);
*/

tl_hossz();
//hangszoro_ureg(g);

//rotate(90)negyed_iv(r, rough=false);
//fordulo(r);

//tures_teszt(true);

module tures_teszt(kiall){
    if (kiall){
        doboz_sarok(rough=false, kiall=kiall); 
    }
    else{
        mirror([1,0,0])doboz_sarok(rough=false, kiall=kiall); 
    }
}
 
    

module doboz_sarok(rough, kiall){
    intersection(){
        doboz(rough, kiall);
        translate([dx(4),0,0])cube([3*r+2*v_fal, 3*r+2*v_fal, h+v_fal+h_illesztes]);
    }
}

module doboz(rough=true, kiall=false){
    
    difference()
    {
        cube([h_doboz,sz_doboz,m_doboz]);
        translate([v_fal/2,r+v_fal,v_fal+g+0.1]){
            for(i=[1,0]){
                translate([dx(i)+v_fal/2,hossz-R+r-rovid_hossz,0])egyenes(rovid_hossz, rough=rough);
            }
            hull()
            {
                translate([dx(1),hossz-v_fal-r-rovid_hossz-r-r-v_fal/2,0])rotate(90)negyed_iv(r, rough=rough);
                translate([dx(1),0,0])rotate(180)negyed_iv(r, rough=rough);
                translate([dx(2),0,0])rotate(-90)negyed_iv(r, rough=rough);
            }
            hull(){
                translate([dx(2.5)-(v_fal/2-g),0,-g])cylinder(r=1, h=h);
                translate([dx(2.5)-(v_fal/2-g),hossz-r-rovid_hossz-r-v_fal*.5,-g])cylinder(r=1, h=h);
                translate([dx(0.5)-(v_fal/2-g),hossz-v_fal-r-rovid_hossz-r-r-v_fal/2,-g])cylinder(r=1, h=h);
            }
            translate([dx(1),hossz-v_fal/2-r-rovid_hossz,0])rotate(-90)iv(90, R,r+v_fal,h,g,rough=rough);
            translate([dx(1),hossz-v_fal/2-r-rovid_hossz,0])rotate(180)fordulo(r, rough=rough);
            translate([dx(2),hossz-r-v_fal/2,0])dupla_fordito(rough=rough);
            translate([dx(2)+v_fal/2,0,0])egyenes(hossz-r-v_fal/2, rough=rough);

            translate([dx(3)+v_fal/2,0,0]) egyenes(hossz-r-v_fal/2, rough=rough);
            translate([dx(4),0,0])rotate(180)fordulo(r, rough=rough);
            translate([dx(4)+v_fal/2,0,0]) egyenes(hossz, rough=rough);
            translate([dx(5),hossz,0]) fordulo(r, rough=rough);
            translate([dx(5)+v_fal/2,0,0]) egyenes(hossz, rough=rough);
            translate([dx(6), 0,0,])rotate(180)fordulo(r, rough=rough);
        }
        translate([-0.1,(hossz-v_fal-r-rovid_hossz-r-r-v_fal/2+r+v_fal+r+v_fal)/2,h+v_fal])rotate([0,90,0])hangszoro();
        if (!kiall){
            illesztes(rough,kiall=kiall);
        }
        translate([v_fal+2*r,0,h/2+v_fal])rotate([-90,0,0])csatlakozo_furat();

    }
    if (kiall){
        translate([0,0,h_illesztes])illesztes(rough, kiall=kiall);
    }
}

module illesztes(rough=true, kiall=true){
    
    for(i=[3]){
        translate([dx(i)+v_fal/4,v_fal+r,h+v_fal-h_illesztes])illesztes_egyenes(hossz-r-v_fal/2, h_illesztes,g_illesztes,kiall=kiall, rough=rough);
    }
    for(i=[4,5,6]){
        translate([dx(i)+v_fal/4,v_fal+r,h+v_fal-h_illesztes])illesztes_egyenes(hossz, h_illesztes, g_illesztes,kiall=kiall, rough=rough);
    }
    
    for(i=[2,1,0]){
        translate([dx(i)+v_fal/4,sz_doboz-v_fal-R-rovid_hossz,h+v_fal-h_illesztes])illesztes_egyenes(rovid_hossz,h_illesztes, g_illesztes,kiall=kiall, rough=rough);
    }
    translate([dx(2)+v_fal/2,v_fal/4,h+v_fal-h_illesztes])rotate(90)illesztes_egyenes(2*r,h_illesztes, g_illesztes,kiall=kiall, rough=rough);
        translate([dx(4)+v_fal/2,r+v_fal*3/4+v_fal/4,h+v_fal-h_illesztes])rotate(180)illesztes_fordulo(180, r+v_fal*3/4,kiall=kiall, rough=rough);
        translate([dx(5)+v_fal/2,r+v_fal*3/4+v_fal/4+hossz,h+v_fal-h_illesztes])illesztes_fordulo(180, r+v_fal*3/4,kiall=kiall, rough=rough);
        translate([dx(6)+v_fal/2,r+v_fal*3/4+v_fal/4,h+v_fal-h_illesztes])rotate(180)illesztes_fordulo(90, r+v_fal*3/4,kiall=kiall, rough=rough);
        translate([dx(2)+v_fal/2,r+v_fal/2+hossz-r,h+v_fal-h_illesztes])rotate(0)illesztes_fordulo(180, r+v_fal*3/4,kiall=kiall, rough=rough);
    translate([dx(1)+v_fal/2,r+v_fal/2+hossz-r-rovid_hossz,h+v_fal-h_illesztes])rotate(180)illesztes_fordulo(180, r+v_fal*3/4,kiall=kiall, rough=rough);
        translate([dx(2)+v_fal/2,sz_doboz-R-v_fal,h+v_fal-h_illesztes])rotate(0)illesztes_fordulo(180, R+v_fal*3/4,kiall=kiall,rough=rough);
        translate([dx(2)+v_fal/2,r+v_fal*3/4+v_fal/4,h+v_fal-h_illesztes])rotate(270)illesztes_fordulo(90, r+v_fal*3/4,kiall=kiall, rough=rough);
}

module illesztes_egyenes(hossz, h, g, kiall = true, rough=true){
    t = kiall ? -tures/4 : tures/4;
    echo(kiall, tures, t);
    echo(g_illesztes-t,hossz,g_illesztes);
    echo(v_illesztes+2*t, h_illesztes+t, g_illesztes);
    translate([g_illesztes-t,hossz,g_illesztes])rotate([90,0,0])linear_extrude(hossz){
        keresztmetszet(v_illesztes+2*t, h_illesztes+t, g_illesztes, rough=rough);
    }
}

module illesztes_fordulo(sz,r, kiall=true, rough=true){
    
    t = kiall ? -tures/4 : tures/4;
    translate([0,0,g_illesztes])iv(sz,r+t, r-v_illesztes-t,h_illesztes+t, g_illesztes, rough=rough);
}



module hangszoro(){
    d_tekercs=96;
    h_tekercs=61;
    cylinder(r=r_hangszoro, h=4, $fn=r_hangszoro*12);
    translate([0,0,3.4]){
        #cylinder(r=d_tekercs/2, h=h_tekercs, $fn=d_tekercs/2*12);
        for(sz=[45,135,225,315]){
            rotate(sz)translate([108/2,0,0])cylinder(r=1, v_fal/5, $fn=24);
        }
    }
    
    
}

module csatlakozo_furat(){
    cylinder(r=1.5, h=2*v_fal, $fn=r*24);
}

module felgomb(r, rough){
    difference(){
        cfn = rough ? r : r*12;
        sphere(r, $fn=cfn);
        translate([0,0, -r])cube(2*r, center=true);
    }
}

module negyed_iv(r=r, rough=true){
    iv(90, r, v_fal/2, h, g, rough=rough);
}

module fordulo(r=r, rough=true){
    iv(180, r, v_fal/2,h, g,rough=rough);
    echo("Forduló hossza: ", (r+v_fal)/2*3.14);
}

module dupla_fordito(rough=true){
    
    iv(180, R, r+v_fal, h, g, rough=rough);
    iv(180, r, v_fal/2, h, g, rough=rough);
    echo("Dupla forduló hossza: ", 3.14*(R+r+v_fal)/2+(r+v_fal)/2*3.14);
}

module negyedes_dupla_fordito(rough=true){
    difference(){
        dupla_fordito(rough);
        translate([-R,-R,h/2])cube([2*R, 2*R, h+2*g+5],center=true);
    }
    //echo("Dupla forduló hossza: ", 3.14*(R+r+v_fal)/2+(r+v_fal)/2*3.14);
}


module egyenes(hossz, rough =true){
    //fn = rough ? g : 12*g;
    translate([g,hossz,0])rotate([90,0,0])linear_extrude(hossz){
        keresztmetszet(r-v_fal/2,h,g,rough=rough);
    }
    
    echo("Egyenes hossza: ", hossz);
}

  


module keresztmetszet(sz, h, g, rough=true){
    minkowski(){
            square([sz-2*g,h-g]);
            if (g > 0){
                felkor(g, rough=rough);
            }
    }
}

module felkor(g, rough=true){
    fn = rough ? g : 12*g;
    difference(){
        circle(r=g, $fn = fn);
        translate([0,g,0])square(2*g, center=true, $fn=fn);
    }
}

module iv(d, r1, r2, h, g, rough=true){
    fn = rough ? g+r2 : 12*(g+r2);
    rotate_extrude(angle=d, $fn=fn){
        translate([g+r2,0,0])keresztmetszet(r1-r2, h, g, rough=rough);
    }
}

module tl_hossz(){
    echo("Teljes hossz: ",3*rovid_hossz+2*hossz+3.5*(r+v_fal)/2*3.14+3.14*(R+r+v_fal)/2);
}   