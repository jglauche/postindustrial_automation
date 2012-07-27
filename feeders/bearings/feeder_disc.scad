use <../../scadlib/gearmotor.scad>;
bearing_dia = 22;
margin = 1.5;
bearing_height=7;

motor_mount();
feeder_disc();
o=7;

translate([0,0,o-16.5]) rotate(-90) gearmotor_pgm37dc12_77();

// motor mount
module motor_mount(){
    translate(v=[0,0,-16.5]){
        difference(){
            union(){
                cylinder(r=31, h=16); 
                translate(v=[0,0,(16+bearing_height+0.5)/2]) cube(size=[80,20,16+bearing_height+0.5], center=true);
            }
            // cut mounting part away
            translate(v=[0,0,16]) cylinder(r=31+1, h=16);
            // side mounting bolts
            for(i=[-1,1]) translate([35*i,0,-1]){
                translate([0,0,3.2]) cylinder(r=3.5/2,h=80);
                cylinder(r=6.2/2,h=3,$fn=6);
            }
            // eject part
            translate(v=[0,30,8]) rotate([-30,0,0]) cube(size=[25,60,16], center=true);
            rotate(-90) translate([0,0,o]) gearmotor_pgm37dc12_77(negative=true);
        }
    }
}


module feeder_disc(){
	difference(){
		cylinder(r=31, h=bearing_height); 
		// motor shaft
        translate([0,0,-1]) linear_extrude(height=bearing_height+2) rotate(-90) gearmotor_shaft_pgm37dc12_77();
		for(i=[0:3]){
			rotate(120*i) translate(v=[0,sqrt(330),-1]){
                cylinder(r=(bearing_dia+margin)/2, h=bearing_height+1);
                translate([0,0,bearing_height]) cylinder(r1=(bearing_dia+margin)/2,r2=(bearing_dia+margin)/2+2, h=2);
            }
		}	

	}
}
