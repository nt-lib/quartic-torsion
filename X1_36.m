AttachSpec("mdmagma/v2/mdmagma.spec");
X := MDX1(36,GF(5));
// we will sieve ony Y first to make the code faster
Y := MDX1(18,GF(5));
// Claim 1 compute the number of noncuspidal places of degree <= 4
assert [#NoncuspidalPlaces(X,i) : i in [1..4]] eq [ 0, 0, 48, 144 ];
print "Claim 1 successfully verified";

// this means we need to check
// deg3 + cusp
// deg4

// The smallest values of q we can use such that we know
// T_q-q<q>-1 vanishes on Q rational torsion.


//cusp_degrees := Sort([Degree(c) : c in Cusps(X)]);
//assert cusp_degrees eq [ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 6, 6 ];


// Claim 2: Cannot have reduction of the form deg3 +cusp
sieved := HeckeSieve(X, Y, 13, NoncuspidalPlacesUpToDiamond(X,3));
sieved2 := HeckeSieve(X, 13, sieved);
assert #sieved2 eq 0; 
print "Claim 2 successfully verified";

// Claim 3: Cannot have reduction of the form deg4
sieved := HeckeSieve(X, Y, 7, NoncuspidalPlacesUpToDiamond(X,4));
sieved2 := HeckeSieve(X, 7, sieved);
assert #sieved2 eq 0; 


exit;
