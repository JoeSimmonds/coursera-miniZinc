array[int] of int: readings;
int: start;
int: n = length(readings);
set of int: HOUR = 1..n;

enum CHOICE = {heat, strongly_heat, cool, strongly_cool, do_nothing};
array[CHOICE] of int: price = [1, 5, 3, 9, 0];
array[CHOICE] of int: delta = [1, 4, -2, -5, 0];


array[0..n] of var int: temp;
array[HOUR] of var CHOICE: choice;
var int:cost;
var int:obj;

constraint cost = sum([price[x] | x in choice]);
constraint obj = cost;
constraint temp[0] = start;

constraint forall(h in HOUR)
                 (temp[h] = ((temp[h-1] + readings[h]) div 2) + delta[choice[h]]);
constraint forall(h in HOUR)
                 (temp[h] <= 30 /\ temp[h] >= 25);
                 
solve minimize(cost);

