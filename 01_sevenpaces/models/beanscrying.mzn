include "alldifferent.mzn";

enum CHR = {A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z};
array[1..length(CHR)] of var -26..9: digit;

array[int] of CHR: word1 = [B, E, A, N, S];
array[int] of CHR: word2 = [B, E, A, N, S];
array[int] of CHR: total = [C, R, Y, I, N, G];

set of CHR: LETTER = {x | x in CHR where x in word1 ++ word2 ++ total}; 



constraint alldifferent(digit);
constraint forall(c in CHR where c in LETTER)(digit[c] >= 0);

constraint digit[word1[1]] != 0;
constraint digit[word2[1]] != 0;
constraint digit[total[1]] != 0;

var int:n1 = sum([digit[word1[i]] * pow(10, length(word1)-i) | i in 1..length(word1)]);
var int:n2 = sum([digit[word2[i]] * pow(10, length(word2)-i) | i in 1..length(word2)]);
var int:n3 = sum([digit[total[i]] * pow(10, length(total)-i) | i in 1..length(total)]);

constraint n1 + n2 == n3;

output "\(n1) + \n" ++
        "\(n2)\n" ++
        "---------\n" ++ 
        "\(n3)\n";