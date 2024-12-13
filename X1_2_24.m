// This file depends on mdmagma v2 which can be found at https://github.com/koffie/mdmagma/
// It is already included as a subrepo so the following ensures that mdmagma v2 is loaded.
AttachSpec("mdmagma/v2/mdmagma.spec");

X := MDX11(2,24,GF(5));
// we will sieve ony Y first to make the code faster
Y := MDX1(24,GF(5));

// Claim 1: compute the number of noncuspidal places of degree <= 4
assert [#NoncuspidalPlaces(X,i) : i in [1..4]] eq [ 0, 0, 16, 96 ];                                                                                                                            
print "Claim 1 successfully verified";

// this means we need to check
// deg3 + cusp
// deg4

// Claim 2: Cannot have reduction of the form deg3 + cusp
sieved := HeckeSieve(X, Y, 17, NoncuspidalPlacesUpToDiamond(X,3));
assert #sieved eq 2;
assert #HeckeSieve(X, Y, 17, sieved : i:=1 ) eq 0;
print "Claim 2 successfully verified";


// Claim 3: Cannot have reduction of the form deg4 + cusp
sieved := HeckeSieve(X, 7, NoncuspidalPlaces(X,4));
assert #sieved eq 32;
// Not all degree 4 places got ruled out, so we try the same
// with the next value of q
assert #HeckeSieve(X, 11, sieved) eq 0;
print "Claim 3 successfully verified";

exit;
