use <../atis_lib.scad>;

//doboz(20,30 ,22);//, apa=false, anya=false);

//csatlakozo([5, 10, 20, 4, 2.5, 2]);

//kocka();

//kezdoelem();
//vegelem();

//falitarto();
//translate([60.5,10,0])rotate(90)
//csavarhuzo();
//furok();
//translate([0,150,0])pit();
//uveg_tarto();

//kemcso_tarto();

//doboz_1(20,3*16+5*4,70,true, false);
falitarto();
dw = 100;
dd = 60;
dh = 35;
fr = 4;
gap = 0.4;

falravalo=true;

module kemcso_tarto(){
    d_kemcso=16;
    n_sor = 3;
    n_oszlop = 5;
    hezag = 5;
    w = n_oszlop * d_kemcso + hezag * (n_oszlop + 1) + 10; //A kémcső vastagabb mint a csatlakozó
    depth = n_sor * d_kemcso + hezag * (n_sor + 1);
    doboz_1(w, depth, 70, apa=!falravalo){
        r_kemcso = d_kemcso / 2;
        for(x = [hezag+r_kemcso : d_kemcso+hezag : w-hezag]){
            for(y = [hezag+r_kemcso: d_kemcso+hezag: depth-hezag]){
                translate([10+x,y,10]) cylinder(r=r_kemcso+gap, h = 70, $fn=(r_kemcso+gap)*12);
            }
        }
    }
}

module uveg_tarto(){

    r_kisuveg=45/2;
    r_kremes_muanyag=83/2;
    r_muanyag = 90/2;
    difference(){
        union(){
            doboz(dw, dd, dh, apa=false, anya=true);
            translate([0,dd,0])doboz(dw, dd, dh, apa=false, anya=true);
        }
        #translate([0,0, dh-20])cylinder(r=r_kisuveg, h = 21);
    }
    
}

module csavar_fej(sullyesztett=true){ 
    r = sullyesztett ? 2 : 4;
    translate([0,0,6])cylinder(r1=r,r2=4, h=3, $fn=48);
    translate([0,0,-2])cylinder(r=2,h=9);
}

module falitarto_kezdoelem(){ // makeme
    w=10;
    
    difference(){
        doboz_1(dw,w,dh,apa=false);
        translate([15,0,0])cube([dw,w,dh]);
    }
}

module falitarto_vegelem(){ // makeme
    w=10;
    d=dw-5;
    translate([-d,0,0])difference(){
        doboz_1(dw,w,dh,anya=false);
        translate([0,0,0])cube([d,w,dh]);
    }
}

module falitarto(){ // makeme
    w=10;
    d=dd+0.5;
    x_offset=13;
    difference(){
        doboz_1(d,w,dh);
        //furatok
        translate([x_offset,1.1,24])rotate([-90,0,0])csavar_fej(false);
        translate([d-x_offset,1.1,24])rotate([-90,0,0]) csavar_fej(false);
    }
    
    translate([d/2,w+5,70/6])rotate(90)csatlakozo([10,30,70/3, 70/15,4,10/3]);
    
}

module kezdoelem(){ // makeme
    d=dw-12;
    translate([-d,0,0])difference(){
        doboz_1(dw, dd, dh,anya=false);
        cube([d,dd,dh+1]);
    }
}

module vegelem(){ // makeme
    difference(){
        doboz_1(dw, dd, dh,apa=false);
        translate([12,0,0])cube([dw-11,dd,dh]);
    }
}

module kocka(){ // makeme
    doboz_1(dw,dd,dh,fr, apa=!falravalo){
        translate([fr+12,fr,2*fr+1])
            cube([dw-2*fr-12, dd-2*fr, dh-2*fr]);
    }
}

module csavarhuzo(){ // makeme 
    //dw = 100;
    //dd = 60;
    //dh = 35;
    //fr = 3;
    r=4;
    R=12;
    doboz_1(dw,dd,dh,fr, apa=!falravalo){
        for(x = [fr+R: 2*R: dw-fr]){
            for(y = [15,45]){
                translate([x,y,-1]) cylinder(r=r, h=50);
            }
        }
    }
}

module pit(){ // makeme
    //dw = 100;
    //dd = 60;
    //dh = 35;
    fr_x=fr;
    fr_y=fr;
    r=4;
    R=5;
    doboz_1(dw,dd,dh, apa=!falravalo){
        //translate([0,0,25])cube([dw,dd,10]);
        for(x = [fr_x+R: 2*R: dw-fr_x]){
            for(y = [fr_y+R : 2*R : dd - fr_y]){
                translate([x,y,dh-10]) cylinder(r=r, h=50, $fn=6);
            }
        }
    }
}

module furok(){ // makeme
    //dw = 100;
    //dd = 60;
    //dh = 35;
    //fr = 3;
    y_gap_min=3;

    doboz_1(dw,dd,dh, apa=!falravalo){
        x_gap = (dw - (2+11)/2*10-2*fr)/10;
        //translate([0,0,28])cube([dw,dd,10]);
        for (r = [1:0.5:5.5]){
            x0=dw-(((1+2*r)/2)*2*r+(2*r-2)*x_gap); // We start from r=1, no gap before the 1st column)
            x = (x0)%(dw);
            //y = 10*max(0,(x0-x)/90);
            n_hole = floor((dd-2*fr+y_gap_min)/(2*r+y_gap_min));
            y_gap = (dd - 2*fr - 2*r*n_hole)/(n_hole-1);
            y_fr = (dd - 2*r*n_hole - (n_hole - 1) * y_gap)/2;
            for( y = [y_fr:2*r+y_gap:dd-y_fr]){
                translate([x,y+r,15]) cylinder(r=r+0.5, h=80, $fn=r*20);
            }
        }
    }
}

module doboz_1(w, d, h, apa=true, anya=true, gap=0.4){
    difference(){
        union(){
            doboz(w, d, h, apa, anya, gap);
            //translate([0,d-fr,h])cube([w,fr,20]);
        }
        //translate([0,0,30])cube([dw,dw,11]);
        children();
    }
}

module doboz(w, d, h, apa=true, anya=true, gap=0.4){
    csw=min(w/5, 10);
    csd=min(d/2, 30);
    csh=2*h/3;
    ph=csh/5;
    po=csw/2.5;
    pr=csw/3;
    
    cs_v=[csw, csd, csh, ph, po, pr];
    
    difference(){
        union(){
            cube([w,d,h]);
            if (apa){
                translate([w+csw/2,d/2,csh/2]) csatlakozo(cs_v);    
            }
        }        
        if (anya){
            translate([csw/2,d/2,csh/2]) csatlakozo(cs_v+[gap, gap, gap, gap, gap, gap]);
        }
    }
    echo("Gap: ", gap);
}