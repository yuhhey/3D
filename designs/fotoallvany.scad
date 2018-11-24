// az stl-ek köre rajzoljuk az alsó befúződést.

use <atis_lib.scad>

//jobb_allvany();
//bal_allvany();

spring_clip();

module spring_clip(){
    inset_first_layer(inset_height=0.31,inset_width=0.2, render=true) import("/home/grof/Maszek/3DNyomtatas/FotoAllvany/files/photo_backdrop_stand_spring_clip.stl");
}

module bal_allvany(){
    inset_first_layer(inset_height=0.31,inset_width=0.2) import("/home/grof/Maszek/3DNyomtatas/FotoAllvany/files/photo_backdrop_stand_left_no_spring.stl");
}

module jobb_allvany(){
    inset_first_layer(inset_height=0.31,inset_width=0.2) mirror() import("/home/grof/Maszek/3DNyomtatas/FotoAllvany/files/photo_backdrop_stand_left_no_spring.stl");
}
