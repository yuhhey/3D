use <../csatlakozo_lib.scad>;

//doboz(20,30 ,22);//, apa=false, anya=false);

//csatlakozo([5, 10, 20, 4, 2.5, 2]);

//kocka();

//kezdoelem();
//vegelem();

//falitarto();
//translate([60.5,10,0])rotate(90)
//csavarhuzo();
//furok();
//pit();
dw = 60;
dd = 60;
dh = 35;
fr = 4;

falravalo=true;

module csavar_fej(sullyesztett=true){ 
    r = sullyesztett ? 2 : 4;
    translate([0,0,6])cylinder(r1=r,r2=4, h=3, $fn=48);
    translate([0,0,-2])cylinder(r=2,h=9);
}

module falitarto_kezdoelem(){ // makeme
    w=10;
    
    difference(){
        doboz_1(60,w,dh,apa=false);
        translate([15,0,0])cube([60,w,dh]);
    }
}

module falitarto_vegelem(){ // makeme
    w=10;
    
    translate([-55,0,0])difference(){
        doboz_1(60,w,dh,anya=false);
        translate([0,0,0])cube([55,w,dh]);
    }
}

module falitarto(){ // makeme
    w=10;
    d=dd+1;
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
    translate([-48,0,0])difference(){
        doboz_1(60, 60, 35,anya=false);akaszto();
        cube([48,60,50]);
    }
}

module vegelem(){ // makeme
    difference(){
        doboz_1(60, 60, 35,apa=false);
        translate([12,0,0])cube([50,60,35]);
    }
}

module kocka(){ // makeme

    doboz_1(dw,dd,dh,fr, apa=!falravalo){
        
        translate([fr,fr,2*fr])
            difference(){
                cube([dw-2*fr, dd-2*fr, dh-2*fr]);
                translate([0,16,0])cube([10,38,30]);
            }
    }
}

module csavarhuzo(){ // makeme 
    dw = 100;
    dd = 60;
    dh = 35;
    fr = 3;
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
    dw = 100;
    dd = 60;
    dh = 35;
    fr_x=5;
    fr_y=5;
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
    dw = 100;
    dd = 60;
    dh = 35;
    fr = 3;
    y_gap_min=3;

    doboz_1(dw,dd,dh, apa=!falravalo){
        x_gap = (dw - (2+11)/2*10-2*fr)/10;
        //translate([0,0,28])cube([dw,dd,10]);
        for (r = [1:0.5:5.5]){
            x0=dw-(((1+2*r)/2)*2*r+(2*r-2)*x_gap); // We start from r=1, no gap before the 1st column)
            echo(r, x0);
            x = (x0)%(dw);
            //y = 10*max(0,(x0-x)/90);
            n_hole = floor((dd-2*fr+y_gap_min)/(2*r+y_gap_min));
            y_gap = (dd - 2*fr - 2*r*n_hole)/(n_hole-1);
            y_fr = (dd - 2*r*n_hole - (n_hole - 1) * y_gap)/2;
            echo(r, n_hole, y_gap, y_fr);
            for( y = [y_fr:2*r+y_gap:dd-y_fr]){
                //echo(y);
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

module doboz(w, d, h, apa=true, anya=true, gap=0.3){
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
}