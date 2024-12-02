// This file depends on mdmgamga v2 which can be found at https://github.com/koffie/mdmagma/
// We ensure that mdmagma v2 is loaded.
AttachSpec("mdmagma.spec");

// working over GF(3) doesn't work since there are
// noncuspidal degree 4 places that survive the filtering

// 7 is inert in Q(zeta_20)^+ so all frobenius orbits of cusps
// over F_7 lift to Q.


X := MDX11(2,20,GF(7));

// Claim 1 compute the number of noncuspidal places of degree <= 4
assert [#NoncuspidalPlaces(X,i) : i in [1..4]] eq [0, 16, 128, 704];                                                                                                                            
print "Claim 1 successfully verified";

// this means we need to check
// deg2 + two cusps
// deg2 + deg2
// deg3 + cusp
// deg4

// The smallest values of q we can use such that we know
// T_q-q<q>-1 vanishes on Q rational torsion.
q := 3;

// Claim 2: Cannot have reduction of the form deg2 + 2 cusps
todo2 := [];
for D in NoncuspidalPlaces(X,2) do
  A_qD := HeckeOperator(X,q,D)-q*DiamondOperator(X,q,D)-D;
  if IsPrincipal(A_qD) then
    Append(~todo2, D);
    print "todo";
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
      print "todo";
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
    print "todo";
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
    print "todo";
  end if;
end for;
assert #todo4 eq 0;
print "Claim 5 successfully verified";

exit
