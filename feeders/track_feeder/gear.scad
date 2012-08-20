include <configuration.scad>

union(){
    gear(mm_per_tooth=mm_per_tooth,thickness=gear_width,number_of_teeth=8,hole_diameter=6.3);
    #translate(v=[-5,2.2,-gear_width/2]) cube(size=[10,10,gear_width]);

}
