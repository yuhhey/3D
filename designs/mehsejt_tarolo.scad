// Méhsejt-alapú tároló, hengeres kivágásokkal
// Az alap-kontúr az eredeti hatszög-cellás elrendezésből készül,
// de a belső fakkok hengeresek.

sejt_oldalhossz = 30;      // mm, az eredeti méhsejt rács alapmérete
fakk_melyseg = 20;         // mm
falvastagsag = 3;          // mm
alj_vastagsag = 2;         // mm

sorok = 3;
oszlopok = 4;

butyok_sugar = 2;          // mm (félgömb sugár)
butyok_magassag_arany = 0.5; // középmagasság

$fn = 96;

pitch_size = sejt_oldalhossz + falvastagsag / sqrt(3);
// A henger sugara úgy számolva, hogy a hatszög oldalának közepénél
// pontosan 'falvastagsag' maradjon.
// hex apotéma = sejt_oldalhossz * sqrt(3) / 2
R = sejt_oldalhossz * sqrt(3) / 2 - falvastagsag;
fakk_atmero = 2 * R;
teljes_magassag = alj_vastagsag + fakk_melyseg;

module hex2d(a) {
    polygon(points = [
        for (i = [0:5])
            [a * cos(60 * i + 30), a * sin(60 * i + 30)]
    ]);
}

module felgomb_x(r) {
    intersection() {
        sphere(r = r);
        translate([-r, -r, -r])
            cube([r, 2 * r, 2 * r]);
    }
}

module sejt_kozeppontok() {
    for (r = [0:sorok - 1])
        for (c = [0:oszlopok - 1]) {
            cx = sqrt(3) * pitch_size * (c + 0.5 * (r % 2));
            cy = 1.5 * pitch_size * r;
            translate([cx, cy])
                children();
        }
}

module kulso_alap_2d() {
    offset(delta = falvastagsag)
        union()
            sejt_kozeppontok()
                hex2d(sejt_oldalhossz);
}

module fakkok_kivagasa() {
    sejt_kozeppontok()
        translate([0, 0, alj_vastagsag])
            cylinder(h = fakk_melyseg + 0.2, d = fakk_atmero);
}

module butykok() {
    zpos = alj_vastagsag + fakk_melyseg * butyok_magassag_arany;

    sejt_kozeppontok() {
        xfal = R + 0.05;
        translate([xfal, 0, zpos])
            felgomb_x(butyok_sugar);
    }
}

union() {
    difference() {
        linear_extrude(height = teljes_magassag)
            kulso_alap_2d();
        fakkok_kivagasa();
    }
    butykok();
}
