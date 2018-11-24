/*
   Connector to repair a Hozelock hose reel inlet
   This is Hozelock part 2169
   It is NOT a tap connector.

   This file can be found at http://www.thingiverse.com/thing:350791/#files
   It was created by "sprue" and is a remix of two other thingiverse things.

*/

include <screwthread_v2.scad>        // www.thingiverse.com/thing:31363

module connector () {
include <water_house_connector.scad> // http://www.thingiverse.com/thing:14028
}

$fn=50;

screw_conn_height=15;
screw_conn_radius=19;

// The thread bit
difference () {
  cylinder(h = screw_conn_height, r=screw_conn_radius);

  union() {
    thread(1.8, 24, 1.5, 6);
    cylinder(h = screw_conn_height*2, r=8);
  }
}

// Add some grippy bits to the outside of the screw connector

for ( i = [0 : 5] ) {
    rotate( i * 360 / 6, [0, 0, 1])
    translate([0, screw_conn_radius, 0])
    cylinder(h=screw_conn_height, r=3);
}

// Add the hose connector

translate([0, 0, screw_conn_height])
  connector();
