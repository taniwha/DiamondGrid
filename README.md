# Diamond Grid Trusses and Containers
This is a parts mod loosely based on the old Tri-Hexagonal Structural Strut
(THSS) mod by Semni, who has long since disappeared from the KSP community.
Sadly, he had released THSS as All Rights Reserved so nobody could pick it
up for him. This pack contains several truss and matching container parts,
along with a support part for bases (requires Extraplanetary Launchpads)
and a "balloon" tank. More parts will come later, including larger
versions.

## Measurements
Smaller parts:
* Long edge of tri-hex is 1.25m.
* Short edge of tri-hex is 0.625m.
* Diameter of circular section: 1.25m.
* Heights: 0.46875m, 0.9375m and 1.875m.
* Face centers: 0.9375m from center on all faces for orthogonal parts.
  Non-orthogonal part centers are dictated by geometry and thus are
  irrational. However, all face centers are in-line with the part center.
* Balloon tank itself is 3.75m long, but 2.8125m between nodes.

Larger parts:
* Long edge of tri-hex is 2.5m.
* Short edge of tri-hex is 1.25m.
* TriAdapter face centers are 1.25m from the part center (thus are on a
  2.5m diameter circle).

## Nodes
All hub side nodes support stack symmetry, whether orthogonal or oblique.
TriAdapter bottom nodes support stack symmetry.

Snapping to the Tetra or Octa hubs works well if the part to be placed is
first oriented such that its long edge is parallel to the long edge. This
may mean pitching (W/S) the part 90 degrees then rolling (Q/E) the part
multiples of 30 degrees (6x shift-Q/E for 30 degrees, 12x for 60).

The balloon tank's nodes are at the ends of the truss. This is so a
DGT-Segment can be used to join two balloon tanks, a DGT-Adapter can be
used to cap off the end, or the end of the balloon tank fits nicely in one
of the hub truss parts.

## Colliders
All truss parts are fully hollow: a kerbal can walk or fly through the
parts. Also, a kerbal can walk on the grill of the DGT-Segment, but will
fall through the short side in a 1g environment.
