w = 5;

module gombolyitett_teglalap(a,b,r){
    minkowski(){
        square([a-2*r, b-2*r]);
        circle(r=r, $fn=12*r);
    }
}

n_lyuk = 5;
lyuk_legalso = 4;
lyuk_tavolsag = 11;
lyuk_legfelso = lyuk_legalso + (n_lyuk - 1) * lyuk_tavolsag;

module m3_countersinks(){
    for(y = [lyuk_legalso:lyuk_tavolsag:lyuk_legfelso]){
        for(x = [4.7, 86.2-4.7]){
            translate([x,y,-0.1])cylinder(r=1.7,h=10, $fn=24);
            translate([x,y,1.2])cylinder(r2=6.2/2, r1=1.7, h=1.4, $fn=36);
            translate([x,y,2.6])cylinder(r=6.2/2, h=10, $fn=36);
        }
    }
}

m_keret = lyuk_legalso + lyuk_legfelso;

difference(){
    linear_extrude(height=w)difference(){
        translate([2,2])gombolyitett_teglalap(86.2,m_keret,2);
        translate([12+2, 8+2])gombolyitett_teglalap(62.2, m_keret-16, 2);
    }
    m3_countersinks();
}


//m3_countersinks();