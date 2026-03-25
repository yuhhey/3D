// kék elem: kivehető
// zöld: fatiplivel és csavarral rögzített
// piros: tartóelem

module lap(szin, sz,m, cimke, v=18){
    echo(cimke, sz,m);
    color(szin)cube([v,m,sz]);
}

lapvastagsag=18;
teljes_m=2400;
csuszkak_szelessege = 27;
fiok_m = (1200 - lapvastagsag*3/2) / 6 - 20; // 20: ennyi hely van az ujjaknak benyúlni

piros = [1,0,0];
zold = [0,1,0];
kek = [0,0,1];
//baloldali_sarok();

baloldali_fiokos();

jobb_oldal();

module baloldali_fiokos(){
    teljes_sz=2580;
    fuggoleges_koz=(teljes_sz-3*lapvastagsag)/3;

    x_elso = 0;
    x_masodik = x_elso + lapvastagsag + fuggoleges_koz;
    x_harmadik = x_masodik + lapvastagsag + fuggoleges_koz;
    x_negyedik = x_harmadik + lapvastagsag + fuggoleges_koz;
    melyseg = 470;
    polc_melyseg = 465;
    fiok_melyseg = 450;


    translate([x_elso, 0, 0])lap(piros,2400,melyseg, "Bal szekrény: 1. oldalfal");
    translate([x_masodik,0,0])lap(piros,2382,melyseg, "Bal szekrény: 2. oldalfal");
    translate([x_harmadik,0,900+lapvastagsag/2])lap(piros,1473,melyseg, "Bal szekrény: fiókok feletti fal.");
    translate([x_negyedik,0,0])lap(piros,2400,788, "Bal szekrény: router melletti oldalfal");
    //leforgattuk ezért a teteje került  a 0-ra
    translate([18,0,teljes_m])rotate([0,90,0])lap(zold, teljes_sz-lapvastagsag, melyseg, "Bal szekrény: teteje");

    for(z = [300,900,1200,1800,2100]){
        translate([lapvastagsag, 0, z+lapvastagsag/2])rotate([0,90,0])lap(kek, fuggoleges_koz, polc_melyseg, "Bal szekrény: első rész polc");
    }
    for(z = [600,1500]){
        translate([lapvastagsag, 0, z+lapvastagsag/2])rotate([0,90,0])lap(zold, fuggoleges_koz, polc_melyseg, "Bal szekrény: első rész polc");
    }

    for(z = [1500,2100]){
        translate([x_masodik + lapvastagsag, 0, z+lapvastagsag/2])rotate([0,90,0])lap(kek, fuggoleges_koz, polc_melyseg, "Bal szekrény: második rész polc");
    }
    for(z = [1200, 1800]){
        translate([x_masodik + lapvastagsag, 0, z+lapvastagsag/2])rotate([0,90,0])lap(zold, fuggoleges_koz, polc_melyseg, "Bal szekrény: második rész polc");
    }

    for(z = [1200, 1800,2100]){
        translate([x_harmadik + lapvastagsag, 0, z+lapvastagsag/2])rotate([0,90,0])lap(kek, fuggoleges_koz, polc_melyseg, "Bal szekrény: harmadik rész polc");
    }

    for(z = [1500]){
        translate([x_harmadik + lapvastagsag, 0, z+lapvastagsag/2])rotate([0,90,0])lap(zold, fuggoleges_koz, polc_melyseg, "Bal szekrény: harmadik rész polc");
    }

    translate([x_masodik+lapvastagsag,0, 900+lapvastagsag/2])rotate([0,90,0])lap(zold, lapvastagsag+2*fuggoleges_koz,melyseg, "Bal szekrény: fiókok feletti lap");
    translate([x_masodik+lapvastagsag,0, lapvastagsag])rotate([0,90,0])lap(zold, lapvastagsag+2*fuggoleges_koz,melyseg, "Bal szekrény: alatti lap");
    translate([x_harmadik+lapvastagsag/2,0, lapvastagsag])lap(piros, 900-1.5*lapvastagsag,melyseg, "Bal szekrény: fiók elválasztó");
    translate([x_harmadik-lapvastagsag/2,0, lapvastagsag])lap(piros, 900-1.5*lapvastagsag,melyseg, "Bal szekrény: fiók elválasztó");

    // Fiók előlapok
    fiok_sz = fuggoleges_koz - csuszkak_szelessege - lapvastagsag/2;
    translate([x_masodik+lapvastagsag+csuszkak_szelessege/2, 0, 800])rotate([90,0,90])lap(kek, fiok_sz, fiok_m/2, "Bal szekrény: sekély fiók");
    translate([x_harmadik+3/2*lapvastagsag+csuszkak_szelessege/2, 0, 800])rotate([90,0,90])lap(kek, fiok_sz, fiok_m/2, "Bal szekrény: sekély fiók");
    for(z = [20:fiok_m+20:700]){
        translate([x_masodik+lapvastagsag+csuszkak_szelessege/2,0,z])rotate([90,0,90])lap(kek, fiok_sz, fiok_m, "Bal szekrény: teljes magasságu fiók");
        translate([x_harmadik+lapvastagsag+csuszkak_szelessege/2+9,0,z])rotate([90,0,90])lap(kek, fiok_sz, fiok_m, "Bal szekrény: teljes magasságu fiók");
    }

    echo("Balszekrény fiók méretek:", "oldal - ", fiok_melyseg, fiok_m, "előlap - ", fiok_sz - 2 * lapvastagsag);
}

module baloldali_sarok(){
    lap(piros, teljes_m, 315+lapvastagsag);
    translate([lapvastagsag,lapvastagsag,0])rotate([0,0,-90])lap(zold, teljes_m, 445);
    translate([445,-melyseg+lapvastagsag,0])rotate([0,0,0])lap(kek, teljes_m, melyseg-lapvastagsag);
}

module jobb_oldal(){
    
    teljes_sz = 3930;
    y_jobb_hatlap = -1630;
    melyseg = 600;
    polc_melyseg = 595;
    fiok_melyseg = 570;
    fuggoleges_koz = round((teljes_sz - 7 * lapvastagsag) / 5);
    echo("Jobb szekrény 1 - függőleges köz:", fuggoleges_koz);
    echo("Jobb szekrény 1 - Teljes szélesség:", 5*fuggoleges_koz+7*lapvastagsag);
    x_elso = 0;
    x_masodik = x_elso + lapvastagsag + fuggoleges_koz;
    x_harmadik = x_masodik + 2 * lapvastagsag + fuggoleges_koz;
    x_negyedik = x_harmadik + lapvastagsag + fuggoleges_koz;
    x_otodik = x_negyedik + lapvastagsag + fuggoleges_koz;
    x_hatodik = x_otodik + lapvastagsag + fuggoleges_koz;
    translate([x_elso, y_jobb_hatlap,0])lap(piros, teljes_m, melyseg, "1. Jobb szekrény : 1. oldalfal");
    translate([x_masodik, y_jobb_hatlap,0])lap(piros, teljes_m - lapvastagsag, melyseg, "1. Jobb szekrény: 2. oldalfal");
    translate([x_harmadik-lapvastagsag, y_jobb_hatlap,0])lap([1,1,0], teljes_m, melyseg, "1. Jobb szekrény: 3. oldalfal");
    translate([x_harmadik, y_jobb_hatlap,0])lap(piros, teljes_m, melyseg, "2. Jobb szekrény: 1. oldalfal");
    translate([x_negyedik, y_jobb_hatlap,0])lap(piros, teljes_m - lapvastagsag, melyseg, "2. Jobb szekrény: 2. oldalfal");
    translate([x_otodik, y_jobb_hatlap,0])lap(piros, teljes_m - lapvastagsag, melyseg, "2. Jobb szekrény: 3. oldalfal");
    translate([x_hatodik, y_jobb_hatlap,0])lap(piros, teljes_m, melyseg, "2. Jobb szekrény: 4. oldalfal");

    translate([x_elso+lapvastagsag, y_jobb_hatlap,teljes_m])rotate([0,90,0])lap(zold,2*fuggoleges_koz+lapvastagsag, 600, "1. Jobb szekrény: teteje");

    for(z = [300, 2100]){
        translate([x_elso+lapvastagsag,y_jobb_hatlap,z+lapvastagsag/2])rotate([0,90,0])lap(zold,fuggoleges_koz, polc_melyseg, "1. Jobb szekrény: 1. fakk polcok");
    }
    for(z = [600, 900, 1800]){
        translate([x_elso+lapvastagsag,y_jobb_hatlap,z+lapvastagsag/2])rotate([0,90,0])lap(kek,fuggoleges_koz, polc_melyseg, "1. Jobb szekrény: 1. fakk polcok");
    }

    translate([x_elso+lapvastagsag,y_jobb_hatlap+300,1700])rotate([0,90,0])cylinder(r=15,h=fuggoleges_koz);
    
    fiok_sz = fuggoleges_koz - csuszkak_szelessege;
    //fiok_m = (800 - lapvastagsag * 3 / 2) / 4 - 20; // 20: ennyi hely van az ujjaknak benyúlni
    for(z = [20:fiok_m+20:700]){
        translate([x_masodik+lapvastagsag+csuszkak_szelessege/2,y_jobb_hatlap + fiok_melyseg - lapvastagsag,z])rotate([90,0,90])lap(kek, fiok_sz, fiok_m, "1. Jobb szekrény: teljes magasságu fiók");
        // 3-as osztásúban lévő fiók
        translate([x_harmadik+lapvastagsag+csuszkak_szelessege/2,y_jobb_hatlap + fiok_melyseg - lapvastagsag,z])rotate([90,0,90])lap(kek, fiok_sz, fiok_m, "2. Jobb szekrény: teljes magasságu fiók");
    }

    for(z = [2100]){
        translate([x_masodik+lapvastagsag,y_jobb_hatlap,z+lapvastagsag/2])rotate([0,90,0])lap(kek,fuggoleges_koz, polc_melyseg, "1. Jobb szekrény: második fakk");
    }
    for(z = [1800]){
        translate([x_masodik+lapvastagsag,y_jobb_hatlap,z+lapvastagsag/2])rotate([0,90,0])lap(zold,fuggoleges_koz, polc_melyseg, "1. Jobb szekrény: második fakk");
    }
    translate([x_masodik+lapvastagsag,y_jobb_hatlap+300,1700])rotate([0,90,0])cylinder(r=15,h=fuggoleges_koz);
    translate([x_masodik+lapvastagsag+csuszkak_szelessege/2,y_jobb_hatlap + fiok_melyseg - lapvastagsag,800])rotate([90,0,90])lap(kek, fiok_sz, fiok_m/2, "1. Jobb szekrény: sekély fiók");
    translate([x_masodik+lapvastagsag,y_jobb_hatlap, 900+lapvastagsag/2])rotate([0,90,0])lap(zold, fuggoleges_koz,600, "1. Jobb szekrény: fiókok feletti lap");
    translate([x_masodik+lapvastagsag,y_jobb_hatlap, lapvastagsag])rotate([0,90,0])lap(zold, fuggoleges_koz,600, "1. Jobb szekrény: fiókok alatti lap");

// 3 osztású rész itt kezdődik. A fiókok együtt mennek a 2 osztású szekrénnyel.

    translate([x_harmadik+lapvastagsag, y_jobb_hatlap,teljes_m])rotate([0,90,0])lap(zold,3*fuggoleges_koz+2*lapvastagsag, 600, "2. Jobb szekrény: teteje");
    for(z = [2100]){
        translate([x_harmadik+lapvastagsag,y_jobb_hatlap,z+lapvastagsag/2])rotate([0,90,0])lap(zold,fuggoleges_koz, 595, "2. jobb szekrény: első fakk polc");
    }
    for(z = [1800]){
        translate([x_harmadik+lapvastagsag,y_jobb_hatlap,z+lapvastagsag/2])rotate([0,90,0])lap(kek,fuggoleges_koz, 595, "2. jobb szekrény: első fakk polc");
    }
    translate([x_harmadik+lapvastagsag,y_jobb_hatlap, 900+lapvastagsag/2])rotate([0,90,0])lap(zold, fuggoleges_koz,600, "2. jobb szekrény: fiókok feletti lap");
    translate([x_harmadik+lapvastagsag,y_jobb_hatlap, lapvastagsag])rotate([0,90,0])lap(zold, fuggoleges_koz,600, "2. jobb szekrény: fiókok alatti lap");
    translate([x_harmadik+lapvastagsag,y_jobb_hatlap+300,1700])rotate([0,90,0])cylinder(r=15,h=fuggoleges_koz);
    translate([x_harmadik+lapvastagsag+csuszkak_szelessege/2,y_jobb_hatlap + 575 - lapvastagsag,800])rotate([90,0,90])lap(kek, fiok_sz, fiok_m/2, "2. jobb szekrény: sekély fiók");

    for(z = [300,1800]){
        translate([x_negyedik+lapvastagsag,y_jobb_hatlap,z+lapvastagsag/2])rotate([0,90,0])lap(zold,fuggoleges_koz, 595, "2. jobb szekrény: második fakk polc");
    }
    for(z = [2100]){
        translate([x_negyedik+lapvastagsag,y_jobb_hatlap,z+lapvastagsag/2])rotate([0,90,0])lap(kek,fuggoleges_koz, 595, "2. jobb szekrény: második fakk polc");
    }
    translate([x_negyedik+lapvastagsag,y_jobb_hatlap+300,1700])rotate([0,90,0])cylinder(r=15,h=fuggoleges_koz);
    
    for(z = [600,2100]){
        translate([x_otodik+lapvastagsag,y_jobb_hatlap,z+lapvastagsag/2])rotate([0,90,0])lap(zold,fuggoleges_koz, 595, "2. jobb szekrény: harmadik fakk polc");
    }
    for(z = [300,1800]){
        translate([x_otodik+lapvastagsag,y_jobb_hatlap,z+lapvastagsag/2])rotate([0,90,0])lap(kek,fuggoleges_koz, 595, "2. jobb szekrény: harmadik fakk polc");
    }
    translate([x_otodik+lapvastagsag,y_jobb_hatlap+300,1700])rotate([0,90,0])cylinder(r=15,h=fuggoleges_koz);
    echo("Mindkét jobb oldali szekrény fiók méretek:", "oldal - ", fiok_melyseg, fiok_m, "előlap - ", fiok_sz - 2 * lapvastagsag);
}