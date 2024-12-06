// This file depends on mdmagma v2 which can be found at https://github.com/koffie/mdmagma/
// It is already included as a subrepo so the following ensures that mdmagma v2 is loaded.
AttachSpec("mdmagma/v2/mdmagma.spec");

// We work over GF(5) since 5 is the smallest prime of good reduction
X := MDX11(2,24,GF(5));

// Claim 1: compute the number of noncuspidal places of degree <= 4
assert [#NoncuspidalPlaces(X,i) : i in [1..4]] eq [ 0, 0, 16, 96 ];                                                                                                                            
print "Claim 1 successfully verified";

// this means we need to check
// deg3 + cusp
// deg4


// Claim 2: There is only one place of degree 3 up to isomorphisms
// This will help us speed up the computation by a factor of 16.
js := {@ MinimalPolynomial(jInvariant(EllipticCurve(X,x))) : x in NoncuspidalPlaces(X,3) @}; 
assert #js eq 1;
// #js eq 1 implies that all elliptic curves with 2x24 torsion over F_{5^3} are twists of a 
// single elliptic curve
assert Degree(js[1]) eq 3;
// Degree(js[1]) eq 3; implies that the curve only has +/- as geometric endomoprhisms
// in particular there is only a quadratic twists and no higher order twists.
E := EllipticCurve(X, NoncuspidalPlaces(X,3)[1]);
assert Invariants(AbelianGroup(E)) eq [2, 72];
// The above assertion implies that there is only one subgroup of E(F_{5^3}) isomorphic to 2x24
assert Invariants(AbelianGroup(QuadraticTwist(E))) eq [2, 54];
// This implies that the quadratic twist of E doesn't have 2x24 as torsion subgroup
print "Claim 2 successfully verified";


// Claim 3: Cannot have reduction of the form deg3 + cusp
D := NoncuspidalPlaces(X,3)[1];
// By claim 2 we only need to check D + cusp
// Note that not all cusps lift to Q, some also lift to Q(sqrt(6))
// So we can only use q that split Q(sqrt(6))
// the smallest such q we can use is 19
q := 19;
A_qD := HeckeOperator(X,q,D)-q*DiamondOperator(X,q,D)-D;
assert not IsPrincipal(A_qD);
print "Claim 3 successfully verified";


// Claim 4: Cannot have reduction of the form deg4 + cusp
// Degree 0 cusps don't exist so we can use q=7
q := 7;
time sieved := HeckeSieve(X, q, NoncuspidalPlaces(X,4));
assert #sieved eq 32;
// Not all degree 4 places got ruled out, so we try the same
// with the next value of q
q := 11;
assert #HeckeSieve(X, q, sieved) eq 0;
print "Claim 4 successfully verified";

exit;

