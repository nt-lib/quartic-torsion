// This file depends on mdmagma v2 which can be found at https://github.com/koffie/mdmagma/
// It is already included as a subrepo so the following ensures that mdmagma v2 is loaded.
AttachSpec("mdmagma/v2/mdmagma.spec");

// todo verify all deg 1 cusps lift to Q

X := MDX1(32,GF(3));

// Claim 1 compute the number of noncuspidal places of degree <= 4
assert [#NoncuspidalPlaces(X,i) : i in [1..4]] eq [0, 0, 8, 8];
print "Claim 1 successfully verified";

// this means we need to check
// deg3 + cusp
// deg4

// The smallest values of q we can use such that we know
// T_q-q<q>-1 vanishes on Q rational torsion.
q := 5;

// Claim 2: Cannot have reduction of the form deg3 + cusp
assert #HeckeSieve(X, q, NoncuspidalPlaces(X,3)) eq 0;
print "Claim 2 successfully verified";

// Claim 3: Cannot have reduction of the form deg4
assert #HeckeSieve(X, q, NoncuspidalPlaces(X,4)) eq 0;
print "Claim 3 successfully verified";

exit;
