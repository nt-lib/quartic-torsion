// This file depends on mdmagma v2 which can be found at https://github.com/koffie/mdmagma/
// It is already included as a subrepo so the following ensures that mdmagma v2 is loaded.
AttachSpec("mdmagma/v2/mdmagma.spec");

// We work over GF(3) since 3 is inert Q(zeta_25)^+ so that all cusps lift

X := MDX1(25,GF(3));


// Claim 1 compute the number of noncuspidal places of degree <= 4
assert [#NoncuspidalPlaces(X,i) : i in [1..4]] eq [0, 0, 0, 10];
print "Claim 1 successfully verified";


// this means we need to check
// deg4


// The smallest values of q we can use
q := 7;

// Claim 2: Cannot have reduction of the form deg4
todo4 := [];
for D in NoncuspidalPlaces(X,4) do
  A_qD := HeckeOperator(X,q,D)-q*DiamondOperator(X,q,D)-D;
  if IsPrincipal(A_qD) then
    Append(~todo4, D);
  end if;
end for;
assert #todo4 eq 0;
print "Claim 2 successfully verified";

exit;
