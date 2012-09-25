use <../../scadlib/gearmotor.scad>
$fn=42;

module round_item_storage(x,y,z,inner_radius){

    difference(){
        cube([x,y,z]);
        
        translate([x/2,inner_radius,-0.1]) cylinder(r=inner_radius, h=z+0.2);
        // fixme: x
        translate([5.5,-0.1,-0.1]) cube([inner_radius*2,y/2+0.1,z+0.2]);
        
        // holes to mount something with self tappign bolts
        for(i=[0:z/20-1]) {
            translate([-0.1,y-5,10+i*20]) rotate([0,90,0]) cylinder(r=1.4,h=6);
            translate([x-6+0.1,y-5,10+i*20]) rotate([0,90,0]) cylinder(r=1.4,h=6);    
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
        translate([x/2+5,y+20,6]) rotate([0,0,90]) gearmotor_pgm37dc12_77();
        // holes to mount something with self tappign bolts
        
        translate([0,-20,0]) for(i=[0:z/10-1]) {
            translate([-0.1,y-5,5+i*10]) rotate([0,90,0]) cylinder(r=1.4,h=6);
            translate([x+5,y-5,5+i*10]) rotate([0,90,0]) cylinder(r=1.4,h=6);    
        }

    }

}

module puller(x,y,z,inner_radius){
    

}

//motor_holder(35,30);

round_item_storage(35,30,225,12);
translate([-5,30,225]) rotate([180,0,0]) motor_holder(35,30);

//translate([x/2,inner_rad,0]) cylinder(r=11,h=7);
