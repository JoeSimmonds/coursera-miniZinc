include "alldifferent.mzn";

enum CHR = {a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z};
array[1..26] of var -26..9: digit;

var int: A = digit[1];
var int: B = digit[2];
var int: C = digit[3];
var int: D = digit[4];
var int: E = digit[5];
var int: F = digit[6];
var int: G = digit[7];
var int: H = digit[8];
var int: I = digit[9];
var int: J = digit[10];
var int: K = digit[11];
var int: L = digit[12];
var int: M = digit[13];
var int: N = digit[14];
var int: O = digit[15];
var int: P = digit[16];
var int: Q = digit[17];
var int: R = digit[18];
var int: S = digit[19];
var int: T = digit[20];
var int: U = digit[21];
var int: V = digit[22];
var int: W = digit[23];
var int: X = digit[24];
var int: Y = digit[25];
var int: Z = digit[26];

set of CHR: USEDLETTERS;

constraint alldifferent(digit);
constraint forall(chr in CHR where chr in USEDLETTERS)(digit[chr] >= 0);

function var int: numeric(array[int] of CHR: word) = sum([digit[word[i]] * pow(10, length(word)-i) | i in 1..length(word)]);

predicate firstLetterNonZero(array[int] of CHR: word) = digit[word[1]] != 0;
