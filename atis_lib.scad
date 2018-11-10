module gyuru(r1, r2,h, w, center=false){
    difference(){
        cylinder(r1=r1,r2=r2,h, center=center, $fn=12*r1);
        cylinder(r1=r1-w, r2=r2-w,h, center=center, $fn=12*(r1-w));
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

module deszka(m, sz, v, cimke){
    cube([m,sz,v], center=true);
    if (m == vastagsag){
        t = sz * v;
        echo(cimke, m , sz, v, t/1000/1000);
    }
    if (sz == vastagsag){
        t = m*v;
        echo(cimke, m , sz, v, t/1000/1000);
    }
    if (v == vastagsag){
        t = m*sz;
        echo(cimke, m , sz, v, t/1000/1000);
    }
    //echo(cimke, m , sz, v, t);
}

