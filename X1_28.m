// This file depends on mdmagma v2 which can be found at https://github.com/koffie/mdmagma/
// It is already included as a subrepo so the following ensures that mdmagma v2 is loaded.
AttachSpec("mdmagma/v2/mdmagma.spec");

// We work over GF(5) since 5 is inert Q(zeta_28)^+ so that all cusps lift

X := MDX1(28,GF(5));


// Claim 1 compute the number of noncuspidal places of degree <= 4
assert [#NoncuspidalPlaces(X,i) : i in [1..4]] eq [0, 12, 48, 84];
print "Claim 1 successfully verified";


// this means we need to check
// deg2 + two cusps
// deg2 + deg2
// deg3 + cusp
// deg4

// The smallest values of q we can use
q := 3;

// Claim 2: Cannot have reduction of the form deg2 + 2 cusps
todo2 := [];
for D in NoncuspidalPlaces(X,2) do
  A_qD := HeckeOperator(X,q,D)-q*DiamondOperator(X,q,D)-D;
  if IsPrincipal(A_qD) then
    Append(~todo2, D);
  end if;
end for;
assert #todo2 eq 0;
print "Claim 2 successfully verified";


// Claim 3: Cannot have reduction of the form deg2 + deg2
todo2_2 := [];
for x in NoncuspidalPlaces(X,2) do
  for y in NoncuspidalPlaces(X,2) do
    D := x+y;
    A_qD := HeckeOperator(X,q,D)-q*DiamondOperator(X,q,D)-D;
    if IsPrincipal(A_qD) then
      Append(~todo2_2, <x,y>);
    end if;
  end for;
end for;
assert #todo2_2 eq 0;
print "Claim 3 successfully verified";


// Claim 4: Cannot have reduction of the form deg3 + cusp
todo3 := [];
for D in NoncuspidalPlaces(X,3) do
  A_qD := HeckeOperator(X,q,D)-q*DiamondOperator(X,q,D)-D;
  if IsPrincipal(A_qD) then
    Append(~todo3, D);
  end if;
end for;
assert #todo3 eq 0;
print "Claim 4 successfully verified";

// Claim 5: Cannot have reduction of the form deg4
todo4 := [];
for D in NoncuspidalPlaces(X,4) do
  A_qD := HeckeOperator(X,q,D)-q*DiamondOperator(X,q,D)-D;
  if IsPrincipal(A_qD) then
    Append(~todo4, D);
  end if;
end for;
assert #todo4 eq 0;
print "Claim 5 successfully verified";

exit;
