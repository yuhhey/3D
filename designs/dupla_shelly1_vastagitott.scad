// 1 darabos
//import("/home/grof/Maszek/3DNyomtatas/Shelly_DIN_foglalatok/Shelly1_Hutschiene_DIN-rail-clip_V4.stl");


dupla_shelly1();
translate([0, -.5, 0]) csak_a_hatlap();
translate([0, -1, 0]) csak_a_hatlap();

module dupla_shelly1(){
    import("/home/grof/Maszek/3DNyomtatas/Shelly_DIN_foglalatok/Shelly_1_double_DIN_rail.stl");
}

module csak_a_hatlap(){
    difference(){
        dupla_shelly1();
        translate([-30,0.5,-80])cube([100, 20, 100]);
    }
}