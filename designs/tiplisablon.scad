d = 6;
falvastagsag = 5;
butorlapvastagsag = 18;

elsolyuk_60 = 60;
masodiklyuk_60 = 180;
elsolyuk_47 = 47;
masodiklyuk_47 = 141;
lyukak = [elsolyuk_60, elsolyuk_47, masodiklyuk_60, masodiklyuk_47];

masodiklyuk = max(masodiklyuk_47, masodiklyuk_60);
difference(){
    cube([2 * butorlapvastagsag + falvastagsag, masodiklyuk+falvastagsag+30, 30]);
    translate([0,falvastagsag,0]){
        translate([-0.5, 0, falvastagsag])cube([butorlapvastagsag+0.5, masodiklyuk+falvastagsag+100, 30]);
        translate([butorlapvastagsag+falvastagsag, 0, falvastagsag])cube([butorlapvastagsag+0.5, masodiklyuk+falvastagsag+100, 30]);
        for(y = lyukak){
            translate([0,y,0]){
                translate([butorlapvastagsag/2,0,-0.1]){
                    cylinder(h=2*falvastagsag, r=d/2, $fn=d*12);
                    translate([butorlapvastagsag+falvastagsag,0,0])cylinder(h=2*falvastagsag, r=d/2, $fn=d*12);
                }
                translate([butorlapvastagsag-0.5,0,falvastagsag+butorlapvastagsag/2])rotate([0,90,0])cylinder(h=2*falvastagsag, r=d/2, $fn=d*12);
                translate([1.5*butorlapvastagsag,-3,-0.1])mirror()linear_extrude(2)text(str(y), size=6);
            }
            
        }
    }
    translate([1.5*butorlapvastagsag,masodiklyuk/2,-0.1]){
        translate([0,0,0])mirror([])linear_extrude(2)text(str("bv=", butorlapvastagsag), size=6,halign="center");
        translate([0,10,0])mirror([])linear_extrude(2)text(str("d=", d), size=6,halign="center");
    }

}
