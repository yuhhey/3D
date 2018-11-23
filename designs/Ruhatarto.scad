$fn=50;
difference(){
    minkowski(){
        difference(){
            cube([150, 4*50+5*5-4, 100]);
            for(y=[1,56,111,166]){
                translate([0,y,5])cube([150,54,150]);
                translate([10,y+4,-1]) cube([60,45,150]);
                translate([80,y+4,-1]) cube([60,45,150]);
            }
        }
        sphere(r=2);
        
    }
    nevek=["Bulcsú", "Hanga", "Kamilla", "Olívia"];
    yok = [28, 28+55, 28+110, 28+165];
    for (i=[0:3]){
        translate([150,yok[i],5])rotate([0,0,90])linear_extrude(height=2)text(text=nevek[i], font="Courier Bold", size=10, halign="center");
    }
}