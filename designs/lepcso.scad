
module lepcso(){
    lepcso_szelesseg = 1200;
    lepcsohaz_magassag = 3000;
    lepcsohaz_szelesseg = 3000;
    lepcsofok_melyseg = 300;
    lepesek = 20;
    lepcsok_a_sarokban = 3;
    lepcsofok_magassag = 150;
    tomor = true;

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