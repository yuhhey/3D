//import("/home/grof/Letöltések/Bottom_Mesh_SM.stl");

difference(){
    import( "/home/grof/Letöltések/pi-4-ssd-poe-server-case.stl");
    translate([-50,-8.5,0])cube([100,50,100]);
    translate([0,-80,0])cube([100,100,10], center=true);
}