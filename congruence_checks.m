//This procedure prints out the CC in our Table 1 and verifies Claim 1 - for given p and n it verifies that if a cusp of X_1(n) or X_1(m,n) not defined over Q becomes defined over F_p, then q must split completely in the field of defintiion of the cusp. 

CC:=procedure(n,p)
	for d in [a: a in Divisors(n)|a lt n/2] do 
		g:= n div d;
		if d eq 1 and ((p mod n) eq 1 or (p mod n) eq -1) then print("q has to be congruent to +-1 modulo "),n; end if;
		if d eq 2 and ((p mod (n div 2)) eq 1 or (p mod (n div 2)) eq -1) then print("q has to be congruent to +-1 modulo "), n div 2; end if;
		if d ge 3 and (p mod (n div d)) eq 1 then print("q has to be congruent to 1 modulo "), n div d; end if;
	end for;
end procedure;

// we now call this function for the values in our table

pairs:=[[25,3],[26,7],[28,5],[32,3],[34,3],[36,5],[42,11],[20,7],[24,5]];
for x in pairs do 
	x[1];
	CC(x[1],x[2]);
end for;

mominus:= function(p,a) //determines the order of p in (Z/aZ)^x/(-1)
i:=1; t:=p mod a; while (t ne 1) and (t ne (a-1)) do t:=t*p mod a; i:=i+1; end while;
return i;
end function;

mo:= function(p,a) //determines the order of p  in (Z/aZ)^x
	i:=1; t:=p mod a; while (t ne 1) do t:=t*p mod a; i:=i+1; end while;
	return i;
end function;

cusp_degree_fp:=function(p,n,d) // computes the degree of the cusp of X_1(N) corresponding to d over F_p
	assert (n mod d) eq 0;
	a:=n div d;
	if d le 2 then ord:=mominus(p,a);
	else ord:=mo(p,a);
	end if;
return ord;
end function;

cusp_degree:=function(n,d) // computes the degree of the cusp of X_1(N) corresponding to d over Q
	assert (n mod d) eq 0;
	a:= n div d;
	if d le 2 then ord:=EulerPhi(a) div 2;
	else ord:=EulerPhi(a);
	end if;
	return ord;
end function;

//We now check that when there are degree 2 points on Y_{F_p}, that the degree 1 and 2 cusps all reduce to degree 1 and 2 points. This should not be run in the cases where there are no degree 2 points on Y_{F_p}.
deg2cuspcheck:=procedure(n,p)
	for d in [b: b in Divisors(n)|b lt n/2] do
		degfp:=cusp_degree_fp(p,n,d); // this is 
		deg:=cusp_degree(n,d);
		if (degfp le 2) then 
			if deg gt 2 then print "We have a problem!";
				else if (degfp lt deg) then
					assert degfp eq 1 and deg eq 2;
					if d le 2 then 
					print "n=",n,", q has to be congruent to +-1 modulo ", n div d;
					else print "n=",n,", q has to be congruent to 1 modulo ", n div d;
					end if;
				end if;
			end if;
		end if;		
	end for;
end procedure;

//Now we verify Claim 2 for the pairs (n,p) where are degree 2 points on Y_{F_p}

pairs:=[[26,7],[28,5],[42,11],[20,7]];
for x in pairs do 
	deg2cuspcheck(x[1],x[2]);
end for;
// n= 28 , q has to be congruent to 1 modulo  4
// we get only one condition that has already been included for the degree 3 case, so nothing is added.