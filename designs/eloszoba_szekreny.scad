$fn = 48;

// Előszoba szekrény - koncepció modell
// Külső méret: 2400 x 600 x 2800 mm
// A kapcsolólap a jobb oldali kabátos részhez csatlakozó külön dobozban helyezkedik el

material = 18;
side_cover_th = material;
width_total = 2440;
depth_total = 600;
height_total = 2700;
plinth_h = 100;

cabinet_w = width_total;
inner_cabinet_w = width_total - 2 * side_cover_th;
outer_left_x = -side_cover_th;
outer_right_x = inner_cabinet_w + side_cover_th;
front_left_limit = material / 2;
front_right_limit = inner_cabinet_w - material / 2;

door_gap = 3;
door_th = 20;
rod_d = 30;
rod_y = depth_total / 2;

// Fix funkcionális magasságok: ezek nem skálázódnak a teljes magassággal
hanging_bench_z = plinth_h + 420;
hanging_rod_z = 1960;
hanging_top_shelf_z = 2260;

shoe_start_z = plinth_h + 120;
shoe_pitch = 185;
shoe_levels = 7;
shoe_split_z = 1580;
shoe_upper_rod_z = 1960;
shoe_top_shelf_z = 2260;

drawer_h = 150;
drawer_pitch = 165;
drawer_slide_total_w = 27;
acc_upper_start = 980;
acc_upper_pitch = 290;
switch_panel_h = acc_upper_pitch - material;
switch_panel_w = 140;
switch_panel_z0 = acc_upper_start + material;
switch_side_y = 120;
switch_box_w = switch_panel_w + material;

// A teljes méret változását a környező tárolóterek veszik fel
min_height_required = max(hanging_top_shelf_z + material + 100, acc_upper_start + 4 * acc_upper_pitch + material + 100);

// Új kiosztás a gyakorlatiasabb használathoz:
// 5 egyforma szélességű ajtó a homlokzaton:
// 3 ajtó a fő akasztós résznél, 1 a cipős résznél, 1 az accessory résznél
section_unit_w = (inner_cabinet_w - 8 * door_gap - 2 * material) / 5;
equal_door_w = (front_right_limit - front_left_limit - 4 * door_gap) / 5;
main_hanging_w = 3 * section_unit_w + 4 * door_gap;
shoe_w = section_unit_w + material + 2 * door_gap;
accessory_w = section_unit_w + material + 2 * door_gap;

assert(height_total >= min_height_required, "height_total tul kicsi a fix belso kiosztashoz");
assert(depth_total >= 450, "depth_total tul kicsi a jelenlegi funkciokhoz");
assert(section_unit_w >= 300, "width_total tul kicsi az 5 egyforma ajtos kiosztashoz");

carcass_col = [0.96, 0.96, 0.95];
shelf_col = [0.96, 0.96, 0.95];
plinth_col = [0.88, 0.88, 0.87];
back_col = [0.92, 0.90, 0.86];
metal = [0.62, 0.64, 0.68];
drawer_col = [0.78, 0.66, 0.48];
door_col = [0.88, 0.83, 0.75, 0.55];
panel_col = [0.95, 0.95, 0.95];
accent_col = [0.85, 0.90, 0.98, 0.12];

echo("Teljes szelesseg:", width_total, "mm");
echo("Kesz szekreny teljes szelesseg:", width_total, "mm");
echo("Belso korpusz szelesseg:", inner_cabinet_w, "mm");
echo("Egyforma ajtoszelesseg:", equal_door_w, "mm");
echo("Accessory resz bal legszelen:", accessory_w, "mm -> 1 ajto, kisebb fakkok + 5 fiok");
echo("Cipos resz kozepen:", shoe_w, "mm -> 1 ajto, 7 szint, felette kulon akasztos zona");
echo("Fo akasztos resz jobb oldalon:", main_hanging_w, "mm -> 3 egyforma ajto");
echo("Osszes kabattarolas: fo akasztos + jobb oldali felso akaszto");
echo("Sapka / sal / kesztyu tarolas: kisebb fakkok + 5 also fiok");

module board(size, col = shelf_col) {
    color(col) cube(size);
}

module inner_board(x, z, w, col = shelf_col) {
    translate([x, door_th, z]) board([w, depth_total - door_th, material], col);
}

module rod_with_mounts(x, y, z, span) {
    mount_d = rod_d + 10;
    mount_th = 6;

    color(metal)
    translate([x, y, z])
    rotate([0, 90, 0])
    cylinder(h = span, d = rod_d);

    // Bal oldali rögzítő talp
    color(metal)
    translate([x - mount_th, y - rod_d / 2, z - mount_d / 2])
    cube([mount_th, rod_d, mount_d]);

    // Jobb oldali rögzítő talp
    color(metal)
    translate([x + span, y - rod_d / 2, z - mount_d / 2])
    cube([mount_th, rod_d, mount_d]);
}

module carcass() {
    inner_h = height_total - plinth_h;
    inset_depth = depth_total - door_th;

    // Két külső takarólap a korpusz két oldalán
    translate([-side_cover_th, 0, 0]) board([side_cover_th, depth_total, height_total], carcass_col);
    translate([inner_cabinet_w, 0, 0]) board([side_cover_th, depth_total, height_total], carcass_col);

    board([inner_cabinet_w, depth_total, plinth_h], plinth_col);

    translate([0, 0, plinth_h]) board([inner_cabinet_w, depth_total, material], carcass_col);
    translate([0, 0, height_total - material]) board([inner_cabinet_w, depth_total, material], carcass_col);

    translate([0, 0, plinth_h]) board([material, depth_total, inner_h - material], carcass_col);
    translate([inner_cabinet_w - material, 0, plinth_h]) board([material, depth_total, inner_h - material], carcass_col);

    // A köztes függőleges korpuszelemek egy lapvastagsággal beljebb ülnek,
    // így az ajtók a nyílásba záródva rá tudnak feküdni ezekre.
    translate([accessory_w, door_th, plinth_h]) board([material, inset_depth, inner_h - material], carcass_col);
    translate([accessory_w + shoe_w, door_th, plinth_h]) board([material, inset_depth, inner_h - material], carcass_col);

    translate([0, depth_total - 6, plinth_h]) board([inner_cabinet_w, 6, inner_h - material], back_col);
}

module hanging_section() {
    x0 = accessory_w + shoe_w + material;
    clear_w = main_hanging_w - 2 * material;
    bay_w = clear_w / 3;
    upper_hinge_depth = 120;
    switch_box_x = x0 + clear_w - switch_box_w;

    // Egy valódi osztólap az első és a középső kabátajtó között
    translate([x0 + bay_w - material / 2, door_th, plinth_h + material])
    board([material, depth_total - door_th, hanging_top_shelf_z - plinth_h - material], shelf_col);

    // A bal oldali belső osztó fölött külön felső fogadóléc ad helyet a felső pántnak
    translate([x0 + bay_w - material / 2, 0, hanging_top_shelf_z + material])
    board([material, upper_hinge_depth, height_total - hanging_top_shelf_z - 2 * material], shelf_col);

    // Jobb oldali külön kapcsolódoboz, amely teljes mélységben a hátfalig ér
    translate([switch_box_x, 0, switch_panel_z0]) board([material, depth_total, switch_panel_h], shelf_col);
    translate([switch_box_x, 0, switch_panel_z0]) board([switch_box_w, depth_total, material], shelf_col);
    translate([switch_box_x, 0, switch_panel_z0 + switch_panel_h - material]) board([switch_box_w, depth_total, material], shelf_col);

    // Felső teljes szélességű polc sapkáknak, sálaknak, ritkábban használt holmiknak
    inner_board(x0, hanging_top_shelf_z, clear_w, shelf_col);

    // Bal oldali külön akasztórúd
    rod_with_mounts(x0 + 18, rod_y, hanging_rod_z, bay_w - 36);

    // Jobb oldali dupla szélességű akasztórúd
    rod_with_mounts(x0 + bay_w + 18, rod_y, hanging_rod_z, clear_w - bay_w - 36);

    // Pad / alsó polc táskának vagy leüléshez
    inner_board(x0, hanging_bench_z, clear_w, shelf_col);

    // Az alsó zóna nyitott marad ülőpadnak / táskának

    color(accent_col)
    translate([x0 + 10, 30, hanging_bench_z + 30])
    cube([clear_w - 20, depth_total - 60, hanging_top_shelf_z - (hanging_bench_z + 30)]);
}

module accessory_section() {
    x0 = material;
    clear_w = accessory_w - material;
    acc_comp_w = (clear_w - 2 * material) / 3;
    drawer_side_gap = 8;
    drawer_box_w = clear_w - 16 - drawer_slide_total_w;
    drawer_x = x0 + drawer_side_gap + drawer_slide_total_w / 2;

    // 5 kisebb fiók sapka / kesztyű / sál / kulcs / apróságok részére
    for (i = [0:4]) {
        z = plinth_h + 30 + i * drawer_pitch;
        color(drawer_col)
        translate([drawer_x, door_th + 2, z])
        cube([drawer_box_w, depth_total - door_th - 40, drawer_h]);
    }

    // Felső kisebb fakkok
    for (z = [acc_upper_start, acc_upper_start + acc_upper_pitch, acc_upper_start + 2 * acc_upper_pitch, acc_upper_start + 3 * acc_upper_pitch]) {
        inner_board(x0, z, clear_w, shelf_col);
    }

    // Két függőleges osztó a felső fakkokhoz, 3 egyforma rekeszt adva
    for (x = [x0 + acc_comp_w, x0 + 2 * acc_comp_w + material]) {
        translate([x, door_th, acc_upper_start])
        board([material, depth_total - door_th, height_total - material - acc_upper_start], shelf_col);
    }
}

module shoe_section() {
    x0 = accessory_w + material;
    clear_w = shoe_w - material;
    shelf_d = depth_total - 70;
    tilt = -12;

    // 7 döntött polc, szintenként kb. 5-6 pár cipővel számolva
    for (i = [0:shoe_levels - 1]) {
        translate([x0, 35, shoe_start_z + i * shoe_pitch])
        rotate([tilt, 0, 0])
        board([clear_w, shelf_d, material], shelf_col);
    }

    for (i = [0:shoe_levels - 1]) {
        translate([x0, 24, shoe_start_z + i * shoe_pitch - 6])
        board([clear_w, 18, 24], plinth_col);
    }

    // Felső külön kabáttartó rész rövidebb vagy vendégkabátoknak
    upper_shelf_z = shoe_start_z + shoe_levels * shoe_pitch;
    inner_board(x0, upper_shelf_z, clear_w, shelf_col);
    inner_board(x0, shoe_top_shelf_z, clear_w, shelf_col);

    rod_with_mounts(x0 + 18, rod_y, shoe_upper_rod_z, clear_w - 36);

    color(accent_col)
    translate([x0 + 10, 30, upper_shelf_z + 25])
    cube([clear_w - 20, depth_total - 60, shoe_top_shelf_z - (upper_shelf_z + 25)]);
}

module fronts() {
    // Az ajtók függőlegesen a nyílásba záródnak:
    // alul és felül beférnek a vízszintes korpuszelemek közé.
    z0 = plinth_h + material + door_gap;
    door_h = height_total - plinth_h - 2 * material - 2 * door_gap;
    function door_x(i) = front_left_limit + material + i * (equal_door_w + door_gap) + (i > 0 ? material : 0);

    // Accessory rész bal oldalon egy teljes ajtóval
    color(door_col)
    translate([door_x(0), 0, z0])
    cube([equal_door_w, door_th, door_h]);

    // Cipős rész középen egy ajtóval
    color(door_col)
    translate([door_x(1), 0, z0])
    cube([equal_door_w, door_th, door_h]);

    // Akasztós rész jobb oldalon: 3 db teljes magasságú ajtó
    single_hanging = equal_door_w;
    for (i = [0:1]) {
        x = door_x(i + 2);
        color(door_col)
        translate([x, 0, z0])
        cube([single_hanging, door_th, door_h]);
    }

    // Jobb szélső kabátos ajtó kivágással a switch panel dobozához
    right_door_x = door_x(4);
    cutout_w = switch_box_w;
    cutout_x = single_hanging - cutout_w;
    cutout_z = switch_panel_z0 - z0;
    color(door_col)
    translate([right_door_x, 0, z0])
    difference() {
        cube([single_hanging, door_th, door_h]);
        translate([cutout_x, -1, cutout_z])
        cube([cutout_w + 1, door_th + 2, switch_panel_h]);
    }
}

module switch_panel() {
    switch_box_front_x = accessory_w + shoe_w + material + (main_hanging_w - 2 * material) - switch_box_w;

    // A kapcsolópanel a kis doboz előlapján jelenik meg, a jobb szélső ajtó kivágása mögött
    color(panel_col)
    translate([switch_box_front_x, 0, switch_panel_z0])
    cube([switch_box_w, door_th, switch_panel_h]);

    // Kapcsoló szerelési zóna az előlap közepén
    color([0.82, 0.82, 0.82])
    translate([switch_box_front_x + switch_box_w / 2 - 45, -1, switch_panel_z0 + switch_panel_h / 2 - 70])
    cube([90, 2, 140]);
}

module wardrobe() {
    carcass();
    hanging_section();
    accessory_section();
    shoe_section();
    //fronts();
    switch_panel();
}

wardrobe();
