// This file depends on mdmagma v2 which can be found at https://github.com/koffie/mdmagma/
// It is already included as a subrepo so the following ensures that mdmagma v2 is loaded.
AttachSpec("mdmagma/v2/mdmagma.spec");

// We work over GF(11) since 11 is inert Q(zeta_42)^+ so that all cusps lift

X := MDX1(42,GF(11));


// Claim 1 compute the number of noncuspidal places of degree <= 4
assert [#NoncuspidalPlaces(X,i) : i in [1..4]] eq [0, 48, 456, 3471];
print "Claim 1 successfully verified";


//this shows that the degree 1 and degree 2 cusps lift, by comparing to: https://beta.lmfdb.org/ModularCurve/Q/42.1152.25-42.c.1.8/
assert Sort([Degree(c) : c in Cusps(X)]) eq [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 6, 6 ];


// this means we need to check
// deg2 + two cusps
// deg2 + deg2
// deg3 + cusp
// deg4

// The smallest values of q we can use
q := 5;
// In all cases we will filter on X1(21) first because this is faster
Y := MDX1(21,GF(11));

// Claim 2: Cannot have reduction of the form deg2 + 2 cusps
assert #HeckeSieve(X, Y, q, NoncuspidalPlaces(X,2)) eq 0;
print "Claim 2 successfully verified";


// Claim 3: Cannot have reduction of the form deg2 + deg2
S := [x+y: x,y in NoncuspidalPlaces(X,2)];
sieved := HeckeSieve(X, Y, q, S);
assert #sieved eq 12;
assert #HeckeSieve(X, q, sieved) eq 0;
print "Claim 3 successfully verified";


// Claim 4: Cannot have reduction of the form deg3 + cusp
sieved := HeckeSieve(X, Y, q, NoncuspidalPlaces(X,3));
assert #sieved eq 12;
assert #HeckeSieve(X, q, sieved) eq 0;
print "Claim 4 successfully verified";


// Claim 5: Cannot have reduction of the form deg4
sieved := HeckeSieve(X, Y, q, NoncuspidalPlaces(X,4));
assert #sieved eq 93;
assert #HeckeSieve(X, q, sieved) eq 0;
print "Claim 5 successfully verified";

exit;
