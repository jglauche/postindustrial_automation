use <../../scadlib/gearmotor.scad>
$fn=42;

module round_item_storage(x,y,z,inner_radius){

    difference(){
        cube([x,y,z]);
        
        translate([x/2,inner_radius,-0.1]) cylinder(r=inner_radius, h=z+0.2);
        // fixme: x
        translate([5.5,-0.1,-0.1]) cube([inner_radius*2,y/2+0.1,z+0.2]);
        
        // holes to mount something with self tappign bolts
        for(i=[0:z/10-1]) {
            translate([-0.1,y-5,10+i*10]) rotate([0,90,0]) cylinder(r=1.5,h=14);
            translate([x-14+0.1,y-5,10+i*10]) rotate([0,90,0]) cylinder(r=1.5,h=14);    
        }
        
    }
}

module motor_holder(x,y,z=30){
    difference(){
        union(){
            cube([x+10,y+10,z]);
            translate([0,y+5,0]) cube([x+10,40,5]);
        }
        translate([5-0.1,-0.1,-0.1]) cube([x+0.2,y+0.2,z+0.2]); 
        // yes, that motor is overkill
#        translate([x/2+5,y+22,-1.1]) rotate([180,0,90]) gearmotor_pgm37dc12_77();
        
        // holes to mount something with self tappign bolts
        
        translate([0,-20,0]) for(i=[0:z/10-1]) {
            translate([-0.1,y-5,5+i*10]) rotate([0,90,0]) cylinder(r=1.4,h=6);
            translate([x+5,y-5,5+i*10]) rotate([0,90,0]) cylinder(r=1.4,h=6);    
        }

    }

}

// using m5 rod
module puller(x,y,z,inner_radius, rod_position){
    difference(){
        union(){
            translate([0,-y,0]) cube([x,y,8]);
            translate([x/2,0,0]) cylinder(r=inner_radius, h=z);
        }
        translate([x/2,-rod_position,-0.1]) cylinder(r=2.8,h=3);
        #translate([x/2,-rod_position,-0.1+6.5]) cylinder(r=2.8,h=10);
        translate([x/2,-rod_position+2,4]) cube([8.2,9.2*2,4.3], center = true);

    }

}

// this doesn't work
module nozzle(x,y,z, radius, object_width,clearance=0.3){
    difference(){
        translate([-x/2,-y/2,0]) cube([x,y,z]);
    //    translate([0,0,-0.1]) cylinder(r=radius,h=object_width+clearance+0.1);
        translate([-radius,-y/2,0]) cube([radius*2,y,object_width*1.5+clearance]);
  #      translate([-radius,0,-2]) rotate([30,0,0]) cube([radius*2,y*2,object_width*2]);


        translate([-18,-15,-5]) for(i=[0:z/10-1]) {
            translate([-0.1,y-5,10+i*10]) rotate([0,90,0]) cylinder(r=1.5,h=14);
            translate([x-13+0.1,y-5,10+i*10]) rotate([0,90,0]) cylinder(r=1.5,h=14);    
        }
                  
    } 
}

module hole_piece(length){
   difference(){
       cube([length,10,4]);
       for(i=[0:length/10-1]) {
            translate([5+i*10,5,-5]) rotate([0,0,0]) cylinder(r=1.5,h=14);
        }       
   
   }
}


//%translate([35/2,15,225]) nozzle(35,30,30,12,7);

//%translate([6,11.5,0]) puller(24-1,40,35, 12-0.5, 33.5);

//%round_item_storage(35,30,225,12);

//%translate([5+35,30,225-30]) rotate([180,180,0]) motor_holder(35,30);

//translate([x/2,inner_rad,0]) cylinder(r=11,h=7);


// print stuff

// puller
//rotate([0,0,90])puller(24-1,40,35, 12-0.5, 33.5);
// motor mount
// motor_holder(35,30);

//hole_piece(40);




