// Tömör, hengeres beleülő betét a mehsejt_tarolo.scad modellhez
// - Oldalt alulról induló egyszerű vájat a bütyök becsúszásához
// - Felül kis C-alakú horog kulcskarika számára

// A tároló alap paraméterei (illesztéshez)
sejt_oldalhossz = 30;      // mm
falvastagsag = 3;          // mm
fakk_melyseg = 20;         // mm

// Betét illesztése
illesztesi_hezag = 0.35;   // mm
also_hezag = 0.4;          // mm

// Bütyök a tartóban: félgömb r=2 mm -> d=4 mm
butyok_sugar = 2;          // mm
vajat_szelesseg = 4.6;     // mm
vajat_melyseg = 1.6;       // mm
vajat_felso_maradek = 2.0; // mm, ennyi maradjon zártan a tetején

// Felső horog
horog_kulso_sugar = 5.0;   // mm
horog_anyag = 2.0;         // mm
horog_magassag = 3.0;      // mm
horog_nyas_szelesseg = 3.0;// mm
horog_tarto_magassag = 4.0;// mm

$fn = 96;

fakk_sugar = sejt_oldalhossz * sqrt(3) / 2 - falvastagsag;
kulso_sugar = fakk_sugar - illesztesi_hezag;
betet_magassag = fakk_melyseg - also_hezag;

module oldalso_vajat() {
    // Egyszerű, alul nyitott vájat a +X oldalon.
    vajat_magassag = betet_magassag - vajat_felso_maradek;

    translate([kulso_sugar - vajat_melyseg, -vajat_szelesseg / 2, 0])
        cube([vajat_melyseg + 1.0, vajat_szelesseg, vajat_magassag]);
}

module felso_horog() {
    // Tartónyak a horoghoz
    translate([-horog_anyag / 2, -horog_anyag / 2, betet_magassag])
        cube([horog_anyag, horog_anyag, horog_tarto_magassag]);

    // C-alakú horogtest
    translate([0, 0, betet_magassag + horog_tarto_magassag])
        linear_extrude(height = horog_magassag)
            difference() {
                circle(r = horog_kulso_sugar);
                circle(r = horog_kulso_sugar - horog_anyag);

                // Nyílás a C-horoghoz
                translate([horog_kulso_sugar * 0.55, 0])
                    square([horog_kulso_sugar, horog_nyas_szelesseg], center = true);
            }
}

module beulo_betet() {
    union() {
        difference() {
            // Tömör hengeres betét
            cylinder(h = betet_magassag, r = kulso_sugar);

            // Oldalsó alul induló vájat
            oldalso_vajat();
        }

        // Felső horog
        felso_horog();
    }
}

if (vajat_szelesseg < 2 * butyok_sugar)
    echo("FIGYELEM: A vájat keskenyebb, mint a bütyök átmérője.");

beulo_betet();
