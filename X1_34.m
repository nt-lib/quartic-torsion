AttachSpec("mdmagma/v2/mdmagma.spec");
X := MDX1(34,GF(3));
// Claim 1 compute the number of noncuspidal places of degree <= 4
assert [#NoncuspidalPlaces(X,i) : i in [1..4]] eq [ 0, 0, 0, 26 ];
print "Claim 1 successfully verified";

// this means we need to check
// deg4

// The smallest values of q we can use such that we know
// T_q-q<q>-1 vanishes on Q rational torsion.
q := 5;

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