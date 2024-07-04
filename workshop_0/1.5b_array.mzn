par int: n;
array [1..n] of var 0..9: x;

constraint sum(x) = product(x);
constraint forall(i,j in 1..n where i+1 == j)(x[i] <= x[j]);

output show(x);
