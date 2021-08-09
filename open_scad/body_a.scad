module original() {
import_stl("/home/tyler/repos/tron-cosplay/stl/base/BLK_BODYA_2AM.STL");
}

inch=25.4;
cutter_x=1000;
cutter_z=5;
cutter_size = [cutter_x,inch,cutter_z];

module cutter() {
translate([0,0,-33.2])
    rotate([0,0,45])
        cube(cutter_size,true);
}

difference() {
    original();
    cutter();
}