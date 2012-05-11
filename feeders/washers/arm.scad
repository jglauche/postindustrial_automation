

hole1 = 3.3;
hole2 = 4.3;

difference(){
	union(){
		cube(size=[12.2,42,4]);
		translate(v=[2,25,0]) rotate(a=-30,v=[0,0,1]) cube(size=[10,42,4]);
	
	}
	#translate(v=[62,25,0]) cylinder(r=102/2,h=4);

	translate(v=[11,0,0]) cylinder(r=2,h=4);
	translate(v=[11,1,0]) cylinder(r=2,h=4);
	
	translate(v=[5,6,0]) cylinder(r=hole1/2,h=4);
	translate(v=[4,15,0]) cylinder(r=hole2/2,h=4);

	#rotate(a=45,v=[0,0,1]) translate(v=[20,21,0]) cube(size=[50,10,4]);
}

