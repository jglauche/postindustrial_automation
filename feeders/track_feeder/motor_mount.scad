use <../../scadlib/gearmotor.scad>;



difference(){
    cube([40,55,5]);
    #translate([20,25,6]) rotate(-90) gearmotor_pgm37dc12_77();
    #translate([10,50,0]) cylinder(r=2.8,h=10);
    #translate([30,50,0]) cylinder(r=2.8,h=10);
}



translate([50,0,0]) difference(){
    translate([0,20,0]) cube([40,35,5]);
    #translate([20,25,0]) cylinder(r=2.8,h=10);
    #translate([10,50,0]) cylinder(r=2.8,h=10);
    #translate([30,50,0]) cylinder(r=2.8,h=10);
}

