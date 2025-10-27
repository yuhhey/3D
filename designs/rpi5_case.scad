//import("/Users/grof/Downloads/rpi5_case_top.stl");
module rpi5_holder_bottom(){
  import("/Users/grof/Downloads/rpi5_case_bottom.stl");
}
//  2 kártya közti távolság 20mm
// 14mm a kamera lencsének szükséges átmérő
// pi5 méretei: 85x56mm
// sense-hat méretei: 57x65mm
// rögzítő lyukak átmérője: 2.75mm a sarkoktól 3.5x3.5mm-re vannak

//translate([-40, -31, 10.5])cube([80,2.5,30]);

hat_holder();

module hat_holder(){
    intersection(){
        rpi5_holder_bottom();
        #cube([100,100,20], center=true);
    }
}
    