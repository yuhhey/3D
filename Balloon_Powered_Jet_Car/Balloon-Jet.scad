/* This model was created by Jesse Dean and is licensed under the Creative Commons
 * Attribution-ShareAlike 3.0 2011.  Please feel free to modify and share this model while
 * including mention of the original authorship.
 */

$fn=75;

nose_radius=16;
back_radius=28;
car_length=100;	//length of the body cylinder, doens't include nose
balloon_tube=7;	//Inner radius
tube_height=15;	//height from the top of back_radius
tube_position=40;//distance from back of car, 0 is flush
tube_thickness=2;//wall thickness of tube
exhaust_position=8;//height to center of exhaust port
axel_width = 78;	//distance between wheels on each axel
axel_bushing = 3;	//'diameter' of axel bushing
bushing_width = 2;//width of each axel bushing
axel_size = 4;	//'diameter' of inner axel
axel_body = 7;	//radius of axel cylinders
port_diameter = 7;	//'diameter' of exhaust port
port_thickness = 2;//thickness of rear wall at exhaust port
nail_diameter = 1.7; 


wheel_diameter = 35;
wheel_width = 10;
wheel_shaft_OD = 7;
wheel_shaft_width = 5;
wheel_shaft_ID = nail_diameter + 0.2;
spoke_width = 3;
spoke_count = 8;
spoke_thickness = 3;
tire_thickness = 3;

module wheel() {
  union() {
    difference() { // outer "tire"
      cylinder(r=wheel_diameter/2, h=wheel_width);
      translate([0,0,-0.5])cylinder(r=wheel_diameter/2-tire_thickness, h=wheel_width+1);
    }
    difference() { // center shaft
      cylinder(r=wheel_shaft_OD/2, h=wheel_shaft_width);
      cylinder(r=wheel_shaft_ID/2, h=wheel_shaft_width);
    }
    for ( a = [0 : 360/spoke_count : 360] ) {
      rotate(a=a, v=[0,0,1])
        translate([0, wheel_shaft_ID/2,0])
        cube([spoke_width, wheel_diameter/2 - tire_thickness/2 - wheel_shaft_ID/2, spoke_thickness]);
    }
  }
}


module teardrop(ra,he) {
  union() {
    cylinder(r=ra, h=he);
    translate([-ra*0.7,-ra*0.7,0]) rotate([0,0,45]) cube([ra,ra,he]);
  }
}


module car() {
    difference() {
      union() {
        sphere(r=nose_radius);
        rotate([0,90,0]) cylinder(r1=nose_radius, r2=back_radius, h=car_length);
        //front axel
        translate([0,-axel_width/2,0]) rotate([0,90,90])
          cylinder(r=axel_body, h=axel_width);
        //rear axel
        translate([car_length-8,-axel_width/2,0]) rotate([0,90,90])
          cylinder(r=axel_body, h=axel_width);
        //balloon stem
        translate([car_length-tube_position-balloon_tube-tube_thickness,0,0]) {
	      cylinder(r=balloon_tube+tube_thickness, h=tube_height+back_radius);
	    translate([0,0,tube_height+back_radius*0.9])
	      cylinder(r1=(balloon_tube+tube_thickness)*1.1, r2 =balloon_tube+tube_thickness , h=(tube_height+back_radius)*0.1);
        }
	
      }
      //chop bottom flat
      translate([(car_length-back_radius)/2,0,-back_radius/2])
        cube([(car_length+back_radius)+1,axel_width+1,back_radius], center=true);

      //hollow out balloon stem
      translate([car_length-tube_position-balloon_tube-tube_thickness,
                 0,back_radius-balloon_tube-exhaust_position])
        cylinder(r=balloon_tube, h=tube_height+back_radius+1);

      //hollow out balloon channel
      translate([car_length-tube_position-balloon_tube-tube_thickness,
                 0,back_radius-balloon_tube-exhaust_position])
        rotate([0,90,0])
          teardrop(ra=balloon_tube, 
                   he=tube_position+balloon_tube+tube_thickness-port_thickness);

      //round out the corner of hollowed out channel
      translate([car_length-tube_position-balloon_tube-tube_thickness,
                 0,back_radius-balloon_tube-exhaust_position])
	    sphere(r=balloon_tube);

      //carve out axels to bushing size
    translate([0,0,1+(axel_size/2)]) {
        rotate(a=90, v=[1,0,0]) {
            cylinder(r = nail_diameter / 2, h = axel_width+1, center=true);
        }
    }
    translate([car_length-8,0,1+(axel_size/2)]) {
        rotate(a=90, v=[1,0,0]) {
            cylinder(r = nail_diameter / 2, h = axel_width+1, center=true);
        }
    }

      //carve out exhaust port
      translate([car_length,0,back_radius-balloon_tube-exhaust_position])
        rotate(a=90,v=[0,1,0])
        cylinder(r=port_diameter/2, h=20, center=true);
    }
}

module full_plate() {
  union() {
    car();
    translate([car_length * 0.3, axel_width *0.5, 0])
      wheel();
    translate([car_length * 0.65, axel_width *0.6, 0])
      wheel();
    translate([car_length * 0.3, -axel_width *0.5, 0])
      wheel();
    translate([car_length * 0.65, -axel_width *0.6, 0])
      wheel();
  }
}

//car();

//wheel();

full_plate();