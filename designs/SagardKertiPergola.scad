terasz_sz = 7984;
terasz_melyseg = 4120;
terasz_magassag = 500;

erkelylemez_sz = 6870;
erkelylemez_melyseg = 4120-2500;
erkelylemez_vastagsag = 130;

zartszelveny_sz = 80;
zartszelveny_m = 80;

lab_sz = 150;
lab_m = 150;

tetogerenda_sz = lab_sz;
n_tetogerenda = 6;
tetogerenda_tavolsag = terasz_sz / n_tetogerenda;

module teraszalja(sz, mely, mag){
    cube([mely, sz ,mag]);
}

module erkelylemez(sz, mely, mag){
    cube([mely, sz, mag]);
}

module pergola_lab(){
    cube([150,150,2875]);
}

module pergola_falnal(){
}

module pergola_athidalo(){
}

module tetogerenda(sz, mag, hossz){
    cube([sz, mag, hossz]);
}

teraszalja(terasz_sz, terasz_melyseg, terasz_magassag);
translate([0,7984-6870,2875]) erkelylemez(erkelylemez_sz,
                                          erkelylemez_melyseg,
                                          erkelylemez_vastagsag);

