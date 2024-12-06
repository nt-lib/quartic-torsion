AttachSpec("mdmagma/v2/mdmagma.spec");
X := MDX1(36,GF(5));
// Claim 1 compute the number of noncuspidal places of degree <= 4
assert [#NoncuspidalPlaces(X,i) : i in [1..4]] eq [ 0, 0, 48, 144 ];
print "Claim 1 successfully verified";

// this means we need to check
// deg3 + cusp
// deg4

// The smallest values of q we can use such that we know
// T_q-q<q>-1 vanishes on Q rational torsion.
q := 7;

// Claim 2: Cannot have reduction of the form deg3
todo4 := [];
for D in NoncuspidalPlaces(X,3) do
  A_qD := HeckeOperator(X,q,D)-q*DiamondOperator(X,q,D)-D;
  if IsPrincipal(A_qD) then
    Append(~todo3, D);
  end if;
end for;
assert #todo3 eq 0;
print "Claim 2 successfully verified";


// Claim 3: Cannot have reduction of the form deg4
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

//Claim 3 successfully verified;

//note: 5 inert in Q(\zeta_{36})^+