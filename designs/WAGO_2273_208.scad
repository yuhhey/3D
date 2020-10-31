
difference(){
    wago_holder();
    translate([-28,0,-0.5])kivagas();
}
scale([1,11/8.4,1])
intersection()
{
    wago_holder();
    translate([-28,0,-0.5])kivagas();
}

module wago_holder(){
    import("wago_3x_souple.stl");
}

module kivagas(){
    linear_extrude(height=21)polygon([[2,0],[21,20],[21,60],[0,60],[0,0]]);
}

#translate([-28,0,0])linear_extrude(height=20) polygon([[6.6,4.5],[21,20],[21,20*11/8.4],[6.6             ,8    ],[6.6,4.5]]);