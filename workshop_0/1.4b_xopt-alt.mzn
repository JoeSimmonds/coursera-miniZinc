var 0..10: x;

% constraint (x div 4) * 4 == x;
var int: y;
constraint y * 4 == x;

solve minimize pow(x-7, 2);

output show(x);