// This file depends on mdmagma v2 which can be found at https://github.com/koffie/mdmagma/
// It is already included as a subrepo so the following ensures that mdmagma v2 is loaded.
AttachSpec("mdmagma/v2/mdmagma.spec");

X := MDX1(30,GF(7));

// Claim 1 compute the number of places of degree <= 4
places := [[Divisor(P) : P in Places(Curve(X),i)] : i in [1..4]];
assert  [#places[i] : i in [1..4]] eq [ 16, 20, 128, 606 ];
print "Claim 1 successfully verified";

// We were unable to get the Hecke Sieve to work
// so we use a different strategy.
G, m1, m2 := CuspidalClassGroupQ(X);


// Claim 2: 484 reductions of the form deg1+deg1+deg1+deg1
count1_1_1_1 := #[S : S in Multisets(Seqset(places[1]),4) | m2(&+S) in G];
assert count1_1_1_1 eq 484;
assert 484 eq Binomial(11,4)+Binomial(9,2)*4+Binomial(5,2);
/*
 Over Q there are
 - 8 rational cusps
 - 4 galois orbits of cusps of size 2
 - 4 galois obtirs of cusps of size 4
 Binomial(11,4) is the number of degree 4 divisors supported at the rational cusps
 Binomial(9,2)*4 is the number of degree 4 divisors containing 2 rational cusps and one galois orbit of cusps of size 2
 Binomial(5,2) is the number of degree 4 divisors supported on the galois orbits of cusps of size 2
 */
print "Claim 2 successfully verified";


// Claim 3: No reductions of the form deg2+deg1+deg1
count2_1_1 := #[<S,P> : P in places[2], S in Multisets(Seqset(places[1]),2) | m2(P)+m2(&+S) in G];
assert count2_1_1 eq 0;
print "Claim 3 successfully verified";

// Claim 4: No reductions of the form deg2+deg2
count2_2 := #[S : S in Multisets(Seqset(places[2]),2) | m2(&+S) in G];
assert count2_2 eq 0;
print "Claim 4 successfully verified";

// Claim 5: No reductions of the form deg3+deg1
count3_1 := #[[P,Q] : P in places[3],Q in places[1] | m2(P)+m2(Q) in G];
assert count3_1 eq 0;
print "Claim 5 successfully verified";


// Claim 6: Four reductions of the form deg4
count4 := #[P : P in places[4] | m2(P) in G];
assert count4 eq 4;
print "Claim 6 successfully verified";



// The commented out code below is only for the curious reader and shows the case
// where we were unable to make the Hecke Sieve work
/*
S := [x+y: x in NoncuspidalPlacesUpToDiamond(X,2), y in NoncuspidalPlaces(X,2)];
sieved := HeckeSieve(X, 11, S);
assert #sieved eq 2;
*/

exit;
