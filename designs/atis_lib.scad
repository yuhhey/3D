// Gyűrű fix falvastagsággal. Ez az eredeti. Nem változtatom meg, mert több helyen már használom
module gyuru(r1, r2,h, w, center=false){
    difference(){
        cylinder(r1=r1,r2=r2,h, center=center, $fn=12*r1);
        translate([0,0,-0.1])cylinder(r1=r1-w, r2=r2-w,h+0.2, center=center, $fn=12*(r1-w)); // trükközés: már preview-ban is normálisan jelenjen meg a gyűrű
    }
}

// Gyűrű fix belső átmérővel

module gyuru_fixrb(r1, r2, h, r_belso, center=false){
    difference(){
        cylinder(r1=r1, r2=r2, h, center=center, $fn=12*r1);
        translate([0,0,-0.1])cylinder(r=r_belso, h+0.2, center=center, $fn=12*r_belso);
    }
    
}

//inset_width= min(nozzle dia/2, 0.4)
module inset_first_layer(inset_height=0.31,inset_width=0.2, render=false)
{   
    if (render == true){
        difference()
        { 
            children();

            translate([0,0,-1])
            linear_extrude(height=inset_height+1)
            difference()
            {
                offset(r = inset_width) 
                projection(cut=true) 
                translate([0,0,-inset_height])
                children();

                offset(r = -inset_width) 
                projection(cut=true) 
                translate([0,0,-inset_height])
                children();
            }
        } 
    }
    else{
        echo("Inset not rendered!");
    }
} 

module deszka(m, sz, v, vastagsag, cimke){
    cube([m,sz,v], center=true);
    if (m == vastagsag){
        t = sz * v;
        echo(cimke, m , sz, v, t/1000/1000);
    } else if (sz == vastagsag){
            t = m*v;
            echo(cimke, m , sz, v, t/1000/1000);
    } else if (v == vastagsag){
            t = m*sz;
            echo(cimke, m , sz, v, t/1000/1000);
    }
    echo(cimke, m , sz, v, t);
}



// csm=[melyseg, szelesseg, magassag, also resz magassag, ,henger sugara

//csatlakozo([5,10,20,2,2,1.5]);

module csatlakozo(csm){
    cw = csm[0];
    sz = csm[1];
    h = csm[2];
    ch = csm[3];
    ny = csm[4];
    R=csm[5];
    translate([-cw/2, -sz/2, -h/2]){
        cube([cw,sz,ch]);
        translate([0,sz,ch])
            rotate([90,0,0])
                linear_extrude(height=sz)polygon([[0,0], [cw, 0], [0,cw+1], [0,0]]);
        translate([0,(sz-ny)/2,0])
        intersection()
        {
            translate([0,R+ny/2,0])
                rotate([90,0,0])
                    linear_extrude(height=2*R)polygon([[0,0], [cw, 0], [cw, h-cw-1], [0,h], [0,0]]);
            union(){
                cube([cw-R,ny, h]);
                translate([cw-R-0.5,ny/2,0]) cylinder(r=R, h=h,$fn=80);
            }
        }
    }
}

module gombolyitett_csatlakozo(csm){
    cw = csm[0]-1;
    sz = csm[1]-2;
    h = csm[2]-2;
    ch = csm[3];
    ny = csm[4];
    R=csm[5];
    translate([-cw/2, -sz/2, -h/2]){
        cube([cw,sz,ch]);
        translate([0,sz,ch])
            rotate([90,0,0])
                linear_extrude(height=sz)polygon([[0,0], [cw, 0], [0,cw+1], [0,0]]);
        translate([0,(sz-ny)/2,0])
        intersection()
        {
            translate([0,R+ny/2,0])
                rotate([90,0,0])
                    linear_extrude(height=2*R)polygon([[0,0], [cw, 0], [cw, h-cw-1], [0,h], [0,0]]);
            union(){
                cube([ny, ny,h]);
                translate([cw-R-0.5,ny/2,0]) cylinder(r=R, h=h,$fn=80);
            }
        }
    }
}

module kivagas(l, d, w){
    hull(){
        cylinder(r=d/2,h = w-2, $fn=12*d/2);
        translate([l-d,0,0])cylinder(r=d/2, h=w-2, $fn=12*d/2);
    }
    translate([0,0,w-2])hull(){
        cylinder(r1=d/2, r2=d/2+2,h = 2, $fn=12*d/2);
        translate([l-d,0,0])cylinder(r1=d/2, r2=d/2+2, h=2, $fn=12*d/2);
    }
}

function shelly1L_befoglalo() = [44, 38, 14];
function shellyRGBW2_befoglalo() = shelly1L_befoglalo();

module shellyRGBW2(){
    shelly1L();
}

module shelly1L(){
    b = shelly1L_befoglalo();
    s_h = b[2];
    s_w = b[0];
    s_d = b[1];
    module lecsapott_sarok(){
        echo(s_h);
        linear_extrude(height=s_h)polygon([[0,0],[0,11],[11,0],[0,0]]);
    }
    difference(){
        cube([s_w,s_d,s_h]);
        lecsapott_sarok();
        translate([s_w,0,0])rotate(90)lecsapott_sarok();
    }
    
}

module keyhole_hanger(r1, r2, h){
    dist = 2 * r1 + r2;
    hull(){
        cylinder(r=r1, h, $fn=12*r1);
        translate([dist, 0,0])cylinder(r=r1, h, $fn=12*r1);
    }
    translate([dist, 0, 0])cylinder(r=r2, h, $fn=12*r2);
    
}