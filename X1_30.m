// This file depends on mdmagma v2 which can be found at https://github.com/koffie/mdmagma/
// It is already included as a subrepo so the following ensures that mdmagma v2 is loaded.
AttachSpec("mdmagma/v2/mdmagma.spec");

X := MDX1(30,GF(7));

// Claim 1 compute the number of noncuspidal places of degree <= 4
assert [#NoncuspidalPlaces(X,i) : i in [1..4]] eq [ 0, 20, 128, 602 ];
print "Claim 1 successfully verified";


// this means we need to check
// deg2 + two cusps
// deg2 + deg2
// deg3 + cusp
// deg4

// The smallest values of q we can use
q := 13;

// Claim 2: Cannot have reduction of the form deg2 + 2 cusps
time sieved := HeckeSieve(X, q, NoncuspidalPlacesUpToDiamond(X,2));
assert #sieved eq 0;
print "Claim 2 successfully verified";


// Claim 3: Cannot have reduction of the form deg2 + deg2
time S := [x+y: x in NoncuspidalPlacesUpToDiamond(X,2), y in NoncuspidalPlaces(X,2)];
time sieved := HeckeSieve(X, 11, S);
assert #sieved eq 2;
// These last two places seem impossible to sieve out even with other values of q.
// So we directly check that these divisors cannot be written as a sum of cusps
G, m1, m2 := CuspidalClassGroupQ(X);
assert #[P : P in sieved | m2(P) in G] eq 0;
print "Claim 3 successfully verified";


// Claim 4: Cannot have reduction of the form deg3 + cusp
time sieved := HeckeSieve(X, q, NoncuspidalPlacesUpToDiamond(X,3));
assert #sieved eq 0;
print "Claim 4 successfully verified";

// Claim 5: Cannot have reduction of the form deg4
time sieved := HeckeSieve(X, 11, NoncuspidalPlacesUpToDiamond(X,4));
assert #sieved eq 0;
print "Claim 5 successfully verified";

exit;
