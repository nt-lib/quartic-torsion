// This file depends on mdmagma v2 which can be found at https://github.com/koffie/mdmagma/
// It is already included as a subrepo so the following ensures that mdmagma v2 is loaded.
AttachSpec("mdmagma/v2/mdmagma.spec");

X := MDX1(30,GF(17));

// Claim 1 compute the number of noncuspidal places of degree <= 4
assert [#NoncuspidalPlaces(X,i) : i in [1..4]] eq [ 0, 136, 1728, 20948 ];
print "Claim 1 successfully verified";


// this means we need to check
// deg2 + two cusps
// deg2 + deg2
// deg3 + cusp
// deg4

// The smallest values of q we can use
q := 7;

// Claim 2: Cannot have reduction of the form deg2 + 2 cusps
time sieved := HeckeSieve(X, q, NoncuspidalPlacesUpToDiamond(X,2));
assert #sieved eq 0;
print "Claim 2 successfully verified";


// Claim 3: Cannot have reduction of the form deg2 + deg2
time S := [x+y: x in NoncuspidalPlacesUpToDiamond(X,2), y in  NoncuspidalPlaces(X,2)];
time sieved := HeckeSieve(X, q, S);
assert #sieved eq 0;
print "Claim 3 successfully verified";


// Claim 4: Cannot have reduction of the form deg3 + cusp
time sieved := HeckeSieve(X, q, NoncuspidalPlacesUpToDiamond(X,3));
assert #sieved eq 6;
for p in [11,13,19,23] do
  time sieved := HeckeSieve(X, p, sieved);
  print p, #sieved;
end for;
print "Claim 4 successfully verified";

// Claim 5: Cannot have reduction of the form deg4
time sieved := HeckeSieve(X, q, NoncuspidalPlacesUpToDiamond(X,4));
print #sieved;
print "Claim 5 successfully verified";

exit;
