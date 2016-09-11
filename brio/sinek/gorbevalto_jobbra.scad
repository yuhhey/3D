use <gorbevalto_balra.scad>
$fn=200;

curved_switch_right();

module curved_switch_right(){
  mirror([0,1,0]) curved_switch_left();
}

