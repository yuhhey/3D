haz_m = 715;
haz_j_h = 1325;
haz_j_sz = 458;
haz_b_h = haz_j_h + 76;
haz_b_sz = 700;
beugro_h = 670;
beugro_sz = 120;
beugro_m = 350;

lepcso_szelesseg = 120;

apa=true;

//alsoszint();

elotetovel();


module alsoszint(){
    difference(){
        haz();
        translate([-haz_b_sz, -76, beugro_m])cube([15000,15000,400]);
        konyha();
        translate([haz_j_sz-42-416, 42+417,50])translate([])cube([416, 16+316+21+471, 350]);
        translate([-616-42, -76+42, 50])cube([616, 250,350]);  // Lépcsőház
        nappali();
        translate([-616-42, -76+42+250,50])cube([200, 42, 240]); //kivágás a lépcsőnél
        translate([-200-42, -76+42+250,50])cube([200, 42, 240]); //kivágás a bejárattal szemben
        hatso_traktus();
        bejarati_ajto();
        nappali_ajto();
        nappali_kicsi_ablakok();
        ujKonyha_ablakok();
        ujhatso_ajto();
        hatso_ajto();
        halo_ablak();
        if (apa){
            gyerekszoba_oldalablak();
        }
        gyerekszoba_hatsoablak();
        hatso_terasz();
    }
    translate([-haz_b_sz+lepcso_szelesseg+42,290-76+42,50])rotate([0,0,180])lepcso(tomor=false);
    translate([-41-200-100, -76+42+250+21, 350])cylinder(r=10, h=200);
    szennyesledobo();
}

module ujKonyha_ablakok(){
    translate([-55-483,-76+775+364+42+10,50+240])rotate([0,0,90])cube([150,42,40]);
    translate([-483,-76+haz_b_h-42,50+240])rotate([0,0,0])cube([200,42,40]);
}

module kulso_latvany(){
    difference(){
        elotetovel();
        nappali();
        nappali_ajto();
        hatso_traktus();
        nappali_kicsi_ablakok();
        bejarati_ajto();
    }
}


module konyha(){
    translate([haz_j_sz-42-416, 42,50])cube([416, 417,350]); // Konyha
}
module gyerekszoba_oldalablak(){
    translate([haz_j_sz-42,150+361+292+259-75,50])rotate([0,0,-90])cube([65,42,240]);
}

module hatso_terasz(jatszo_oldala_kiutve = true){
    if (jatszo_oldala_kiutve){
        translate([-42,-76+775+364+42,50])cube([42,178,240]);
        translate([-496-42,-76+775+364+42,50])cube([496,178,310]);
    }
    else
        translate([-496-42,-76+775+364+42,50])cube([496,178,310]);
}
module gyerekszoba_hatsoablak(){
    if (apa){
        szelso_eltolas = 38+40;//haz_j_sz-240-138;
        for(dx = [szelso_eltolas, szelso_eltolas+65+22.5, szelso_eltolas+65+22.5 +65+22.5]){
            translate([dx, -76+haz_b_h-42, 50])cube([65, 42, 240]);
        }
    }
    else{
        translate([haz_j_sz-240-138, -76+haz_b_h-42, 50])cube([240, 42, 240]);
    }
}
module ujhatso_ajto(){
    translate([-100-42-10, -76+haz_b_h-42, 50])cube([100,42,240]);
}

module hatso_ajto(){
    translate([-100-42-10, -76+haz_b_h-42-178-42, 50])cube([100,42,240]);
}

module szennyesledobo(){
    translate([285+10,42+417,0])cube([30,30,600]);
}

module halo_ablak(){ // régi konyha ablak
    for(x = [38+40, 38+40+65+22.5])
        translate([x,0,50])cube([65,42,240]);
}

module nappali_kicsi_ablakok(){
    if (apa){
        for(dy = [10,10+126,10+252]){
                translate([-55-483,-76+167+380+228+dy, 50])rotate([0,0,90])cube([65,43,240]);
        }
    }
    else{
        translate([-55-483,-76+167+380+228+86, 50])rotate([0,0,90])cube([250,43,240]);
    }
}

module nappali(){
    translate([-616-42, -76+42+250+42,50])cube([616, 401, 350]); //nappali
}

module hatso_traktus(){
    translate([-496-42,-76+42+250+42+401,50])cube([496,100+12+282+12,350]);
}

module bejarati_ajto(){
    translate([-140-96,-76,50])cube([140,42,240]); //Bejárati ajtó
}

module nappali_ajto(){
    if (apa){
        translate([-616-42,-76+42+250+145,50])rotate([0,0,90])cube([220,42,240]);
    }
    else {
        translate([-616-42,-76+42+250+145,150])rotate([0,0,90])cube([220,42,140]);
    }
}

module lepcso(tomor=true){
    
    lepcsohaz_magassag = 300;
    lepcsohaz_szelesseg = 290;
    lepcsofok_melyseg = 30;
    lepesek = 20;
    lepcsok_a_sarokban = 3;
    lepcsofok_magassag = 15;
    
    lepes_magassag = lepcsohaz_magassag / lepesek;
    n_also_lepcsok = floor((lepcsohaz_szelesseg - lepcso_szelesseg) / lepcsofok_melyseg);

    echo(n_also_lepcsok);

    // Alsó rész
    offset_a_sarok_fele = lepcsohaz_szelesseg - lepcso_szelesseg - n_also_lepcsok * lepcsofok_melyseg;// betoljuk, ha kell, ha a saroknál ne legyen extra hézag. A lépcsők számának lefele kerekítése miatt alakul ki a rés
    translate([0,offset_a_sarok_fele, 0])egyenes_lepcsok(n_also_lepcsok, teli=tomor);
    echo("Lépcsőház mérete a üvegfel oldalán: ", lepcsohaz_szelesseg - offset_a_sarok_fele);

    // Forduló
    translate([0,lepcsohaz_szelesseg - lepcso_szelesseg,(n_also_lepcsok -1)* lepes_magassag])    
        for(i = [1 : lepcsok_a_sarokban]){
            translate([0,0, i*lepes_magassag])sarok_lepcsofok(i);
        }

    // Felső lépcsők
    n_felso_lepcsok = floor((lepcsohaz_magassag - (n_also_lepcsok + lepcsok_a_sarokban) * lepes_magassag)/lepes_magassag);
    echo(n_felso_lepcsok);
    echo("Lépcsőház mérete a bejárati ajtó falán: ", lepcso_szelesseg + lepcsofok_melyseg * n_felso_lepcsok);

    translate([0,lepcsohaz_szelesseg - lepcso_szelesseg, 0]){
        translate([0,0,(n_also_lepcsok + lepcsok_a_sarokban) * lepes_magassag])
            rotate([0,0,90]) egyenes_lepcsok(n_felso_lepcsok, teli=tomor);
        if (tomor){
            also_x = n_felso_lepcsok * lepcsofok_melyseg;
            translate([-also_x,0,0])cube([also_x,lepcso_szelesseg, (n_also_lepcsok + lepcsok_a_sarokban) * lepes_magassag]);
        }
    }




    module egyenes_lepcsok(n, teli=false){
        for(i = [0: n-1]){
            if (teli) 
                translate([0, i*lepcsofok_melyseg, 0])lepcsofok(m=(i+1)*lepes_magassag);
            else
                translate([0, i*lepcsofok_melyseg, i*lepes_magassag])lepcsofok();
        }
    }


    module lepcsofok(m = lepcsofok_magassag){
        cube([lepcso_szelesseg, lepcsofok_melyseg, m]);
    }


    module sarok_lepcsofok(i){
        szog = 90 / lepcsok_a_sarokban;
        
        forgatas_szoge = (i - 1) * szog;
        szog2 = i * szog;
        elhossz = 2 * lepcso_szelesseg; // valójában a sqrt(2)-vel elég lenne szorozni. Így biztosan kilóg
        intersection(){
            cube([lepcso_szelesseg, lepcso_szelesseg, lepcsofok_magassag]);
            pontok = [[0,0],[cos(forgatas_szoge), sin(forgatas_szoge)],[cos(szog2), sin(szog2)]];
            //echo(lepcso_szelesseg * pontok[2]);
            echo(lepcso_szelesseg * tan(forgatas_szoge));
            linear_extrude(height=lepcsofok_magassag){
                polygon(points = elhossz * pontok);
            }
        }
    }
}

module elotetovel(){
    //garage_fodem_h = beugro_m - 46;
    
    haz();
    //translate([-991+haz_j_sz, haz_j_h+846,0])garage();
    //translate([-haz_b_sz,haz_j_h,garage_fodem_h+15*2])rotate([-5,0,0])cube([haz_b_sz,846,50]);
    // Ház és garázs közti tető
    //translate([-haz_b_sz,haz_j_h,beugro_m-44])rotate([-0,0,0])cube([haz_b_sz,900,50]);
    
    

    module garage(){
        
        cube([991, 665, garage_fodem_h]);
        translate([0,(665-725)/2,garage_fodem_h])rotate([90,0,90])linear_extrude(height=1000)polygon(points=[[0,0], [725,0],[725/2, 725/2]]);
    }


    kertfelol_sz = 420;
    atjaro_sz = 0;
    eloteto_sz = haz_j_sz + haz_b_sz + kertfelol_sz;
    eloteto_m = 500;
    eloteto_vastagsag = 50;
    translate([-haz_b_sz-kertfelol_sz,-76-eloteto_m,0]){
        tarolo_elotti_fal_vastagsag = 30;
        tarolo_elotti_fal_sz = 00;
        difference(){
            cube([eloteto_sz, eloteto_m, beugro_m]);
            translate([kertfelol_sz - atjaro_sz,tarolo_elotti_fal_vastagsag, 0])cube([eloteto_sz - (kertfelol_sz - atjaro_sz)-eloteto_vastagsag, eloteto_m-tarolo_elotti_fal_vastagsag, beugro_m-20]);
            translate([kertfelol_sz - atjaro_sz+tarolo_elotti_fal_sz,0, 0])cube([eloteto_sz - (kertfelol_sz - atjaro_sz)-eloteto_vastagsag - tarolo_elotti_fal_sz, eloteto_m-tarolo_elotti_fal_vastagsag, beugro_m-20]);
            echo("Belépő áthidalás hossza:", eloteto_sz - (kertfelol_sz - atjaro_sz)-eloteto_vastagsag - tarolo_elotti_fal_sz);
            echo("Házfelöli áthidalás hossza:", eloteto_sz - (kertfelol_sz - atjaro_sz)-eloteto_vastagsag);
        }
    }
    // oldalsó terasz
    //translate([-(kertfelol_sz + haz_b_sz), -76,0])cube([kertfelol_sz + beugro_sz, haz_b_h, 50]);
}

module haz(){
    cube([haz_j_sz, haz_j_h ,haz_m]);
    translate([-haz_b_sz, -76,0])difference(){
        cube([haz_b_sz, haz_b_h ,haz_m]);
        //Erkély alatti rész
        translate([0,775,0])cube([beugro_sz, beugro_h, beugro_m]);
        // Erkély felső kivágás
        translate([0,775,beugro_m+30])cube([beugro_sz, beugro_h, beugro_m]);
    }
    //Első terasz beépítés
    translate([-haz_b_sz, -200-76,50])cube([haz_b_sz, 200,300]);
    // Első terasz
    translate([-haz_b_sz, -500-76,0])cube([haz_b_sz, 500, 50]);
}