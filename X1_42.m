// This file depends on mdmagma v2 which can be found at https://github.com/koffie/mdmagma/
// It is already included as a subrepo so the following ensures that mdmagma v2 is loaded.
AttachSpec("mdmagma/v2/mdmagma.spec");

// We work over GF(5) since 5 is the smallest prime of good reduction
X := MDX1(42,GF(5));

// Claim 1: compute the number of noncuspidal places of degree <= 4
assert [#NoncuspidalPlaces(X,i) : i in [1..4]] eq [0, 0, 4, 183];
print "Claim 1 successfully verified";

// this means we need to check
// deg3 + cusp
// deg4


// Claim 2: Cannot have reduction of the form deg3 + cusp
// Note that not all cusps lift to Q, some also lift to Q(sqrt(21))
// So we can only use q that split Q(sqrt(21))
// the smallest such q we can use is 17
q := 17;
todo3 := [];
for D in  do
  A_qD := HeckeOperator(X,q,D)-q*DiamondOperator(X,q,D)-D;
  if IsPrincipal(A_qD) then
    Append(~todo3, D);
  end if;
end for;
assert #todo3 eq 0;
print "Claim 2 successfully verified";


// Claim 3: Cannot have reduction of the form deg4 + cusp
// Degree 0 cusps don't exist so we can use q=5
q := 5;
todo4 := [];
for D in NoncuspidalPlaces(X,4) do
  A_qD := HeckeOperator(X,q,D)-q*DiamondOperator(X,q,D)-D;
  if IsPrincipal(A_qD) then
    Append(~todo4, D);
  end if;
end for;
assert #todo4 eq 0;
print "Claim 3 successfully verified";

exit;

