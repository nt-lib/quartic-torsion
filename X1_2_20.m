// This file depends on mdmagma v2 which can be found at https://github.com/koffie/mdmagma/
// It is already included as a subrepo so the following ensures that mdmagma v2 is loaded.
AttachSpec("mdmagma/v2/mdmagma.spec");

// working over GF(3) doesn't work since there are
// noncuspidal degree 4 places that survive the filtering

// 7 is inert in Q(zeta_20)^+ so all frobenius orbits of cusps
// over F_7 lift to Q.


X := MDX11(2,20,GF(7));

// Claim 1 compute the number of noncuspidal places of degree <= 4
assert [#NoncuspidalPlaces(X,i) : i in [1..4]] eq [0, 16, 128, 704];                                                                                                                            
print "Claim 1 successfully verified";

// this means we need to check
// deg2 + two cusps
// deg2 + deg2
// deg3 + cusp
// deg4

// The smallest values of q we can use such that we know
// T_q-q<q>-1 vanishes on Q rational torsion.
q := 3;

// Claim 2: Cannot have reduction of the form deg2 + 2 cusps
assert #HeckeSieve(X, q, NoncuspidalPlaces(X,2)) eq 0;
print "Claim 2 successfully verified";


// Claim 3: Cannot have reduction of the form deg2 + deg2
S := [x+y: x,y in NoncuspidalPlaces(X,2)];
assert #HeckeSieve(X, q, S) eq 0;
print "Claim 3 successfully verified";


// Claim 4: Cannot have reduction of the form deg3 + cusp
assert #HeckeSieve(X, q, NoncuspidalPlaces(X,3)) eq 0;
print "Claim 4 successfully verified";

// Claim 5: Cannot have reduction of the form deg4
assert #HeckeSieve(X, q, NoncuspidalPlaces(X,4)) eq 0;
print "Claim 5 successfully verified";

exit;
