// This is an adapter for BT200
// 
// Idea: push empty bins from a pile to the scale, which will eject the existing one by falling off an angle
include<shapes.scad>
include<../../libs/tslot.scad>
include<../../libs/container.scad>


post_x = 152;
post_y = 134;

container_x = 99;
container_y = 99;
container_z = 40;


scale_plate_diameter = 116+7;

post_height = 3;
scale_plate_height_min = 12;
scale_plate_height_max = 14;

// container display
//translate([-container_x/2,-container_y/2,scale_plate_height_min]) container(container_x,container_y,container_z);

// slots to guide the container
//rotate(a=90,v=[0,1,0]) translate([-20-scale_plate_height_min-post_height,0,0]){
//	 translate([0,50,-50]) tslot20holes(100);
//	 translate([0,-70,-50]) tslot20holes(100);
//}


// make 2 parts for easier printing
rotate(a=180,v=[1,0,0]){
	difference(){		
		 scale();
		 #translate([0,-(post_y+20)/2,0]) cube([post_x/2+5,post_y+40,100]);
	}

}


module scale(){
	difference(){
		translate(v=[0,0,(scale_plate_height_min+post_height)/2]) cube(size=[post_x+5, post_y+5, scale_plate_height_min+post_height], center=true);
		cylinder(r=scale_plate_diameter/2,h=scale_plate_height_min+post_height);

		translate(v=[0,0,(post_height)/2]) cube(size=[post_x, post_y, post_height], center=true);

		// tslot mounts
		translate([-65,0,0]){
			for(i=[0,1,2,3,4,9,10,11,12,13]){
				translate(v=[i*10,60,0]){
					cylinder(r=2,h=20);
					translate(v=[0,0,post_height+1]) hexagon(5.8,4);
				}				
				translate(v=[i*10,-60,0]){
				 		cylinder(r=2,h=20);
						translate(v=[0,0,post_height+1]) hexagon(5.8,4);
				}
			}

		}


	}
}


