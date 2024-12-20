// This file depends on mdmagma v2 which can be found at https://github.com/koffie/mdmagma/
// It is already included as a subrepo so the following ensures that mdmagma v2 is loaded.
AttachSpec("mdmagma/v2/mdmagma.spec");

X_F7 := MDX11(3,15,GF(7));
X_F4 := MDX11(3,15,GF(4));

// Claim 1: The 2 torsion over GF(7) is (Z/2Z)^3
G := ClassGroup(X_F7);
assert Invariants(G) eq [ 3, 3, 3, 24, 480, 480, 0 ];
print "Claim 1 successfully verified";


// Claim 2: The cuspidal 2 torsion over GF(4) is (Z/2Z)^3
G := CuspidalClassGroup(X_F4, 1);
assert Invariants(G) eq [ 3, 3, 24, 96, 96, 0 ];
print "Claim 2 successfully verified";

exit;
