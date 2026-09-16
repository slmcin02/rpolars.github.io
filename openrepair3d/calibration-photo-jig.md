# Calibration Photo Jig — OpenRepair3D Tool 001

**Status:** v0.1 concept; not yet printed or physically validated.

## Why it exists

Small broken parts are difficult to reconstruct from ordinary photos because perspective, camera distance, and missing geometry make dimensions ambiguous. This jig provides known references in the same frame as the broken part so photographs can be reconciled with direct caliper measurements before CAD reconstruction.

## v0.1 features

- 140 × 100 mm base plate
- 10 mm reference grid
- two perpendicular datum walls
- three 6 mm datum holes
- elongated slots for soft clamps or zip ties
- known 90° corner for positioning parts
- parametric OpenSCAD source

Source: [`calibration-photo-jig.scad`](./calibration-photo-jig.scad)

## Intended workflow

1. Place the failed component or assembly against the datum walls without forcing it into shape.
2. Photograph from multiple prescribed angles with the grid and datum holes visible.
3. Record critical dimensions separately with calipers.
4. Reconcile image-derived estimates against direct measurements.
5. Build candidate CAD geometry.
6. Print and fit-test revisions.
7. Publish the validated model only after physical testing.

## Planned validation

Once OpenRepair3D has printer access, Tool 001 will be printed and checked for:

- actual grid spacing versus nominal 10.00 mm
- datum-wall squareness
- base flatness
- repeatability of image-based measurements on known objects
- whether shallow grid grooves remain visible under common lighting
- whether clamp slots are useful without obscuring photographed geometry

The dimensions and geometry may change after physical testing. This file should **not** be represented as a validated metrology tool yet.
