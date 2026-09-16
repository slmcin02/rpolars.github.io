// OpenRepair3D Calibration Photo Jig v0.1
// Status: concept / unprinted / not yet physically validated
// Purpose: provide known geometric references for photographing broken parts
// before CAD reconstruction. Units: millimeters.

$fn = 48;

plate_w = 140;
plate_d = 100;
plate_t = 3;
wall_h  = 45;
wall_t  = 3;
grid    = 10;
grid_groove_w = 0.5;
grid_groove_d = 0.35;
slot_w = 5;
slot_l = 28;

module rounded_plate(w, d, t, r=4) {
    linear_extrude(height=t)
        offset(r=r)
            offset(delta=-r)
                square([w,d]);
}

module grid_grooves() {
    // shallow grooves every 10 mm; intended to create a visible scale reference
    for (x=[grid:grid:plate_w-grid])
        translate([x-grid_groove_w/2, 0, plate_t-grid_groove_d])
            cube([grid_groove_w, plate_d, grid_groove_d+0.05]);
    for (y=[grid:grid:plate_d-grid])
        translate([0, y-grid_groove_w/2, plate_t-grid_groove_d])
            cube([plate_w, grid_groove_w, grid_groove_d+0.05]);
}

module clamp_slots() {
    // elongated slots for temporary zip ties / soft clamps
    for (x=[25,70,115]) {
        translate([x-slot_l/2, 15-slot_w/2, -0.1])
            cube([slot_l,slot_w,plate_t+0.2]);
        translate([x-slot_l/2, plate_d-15-slot_w/2, -0.1])
            cube([slot_l,slot_w,plate_t+0.2]);
    }
}

module datum_holes() {
    // three known-diameter holes help check perspective/scale
    for (x=[20,40,60])
        translate([x,plate_d-32,-0.1])
            cylinder(h=plate_t+0.2,d=6);
}

module base() {
    difference() {
        rounded_plate(plate_w,plate_d,plate_t,4);
        grid_grooves();
        clamp_slots();
        datum_holes();
    }
}

module datum_walls() {
    // rear and left 90-degree datum walls
    translate([0,plate_d-wall_t,plate_t])
        cube([plate_w,wall_t,wall_h]);
    translate([0,0,plate_t])
        cube([wall_t,plate_d,wall_h]);

    // 10 mm wall ticks on both datum walls
    for (x=[10:grid:plate_w-10])
        translate([x,plate_d-wall_t-0.35,plate_t+5])
            cube([0.45,0.4,8]);
    for (y=[10:grid:plate_d-10])
        translate([wall_t-0.05,y,plate_t+5])
            cube([0.4,0.45,8]);
}

union() {
    base();
    datum_walls();
}
