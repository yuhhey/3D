use <atis_lib.scad>
inset_first_layer(inset_height=0.31,inset_width=0.25, render=true)
scale(0.99)difference(){
    import("Medence/poolsaugstutzen_32.stl");
    gyuru(r1=50, r2=50, h=30, w=5.5, $fn=600);
}
