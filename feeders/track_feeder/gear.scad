include <configuration.scad>


bearing625_OD=16.25;
bearing625_height=5;

union(){
    gear(mm_per_tooth=mm_per_tooth,thickness=gear_width,number_of_teeth=6,hole_diameter=7);
    #translate(v=[-5,2.4,-gear_width/2]) cube(size=[10,3,gear_width]);

}


//    gear(mm_per_tooth=mm_per_tooth,thickness=gear_width,number_of_teeth=6,hole_diameter=bearing625_OD);


