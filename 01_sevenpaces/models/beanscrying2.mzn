include "alldifferent.mzn";

enum CHR = {a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z};

function var int: lookup(CHR: item) = if has_index(U(item)::maybe_partial, digits) then digits[U(item)] else -1 endif;

var int: A = lookup(a);
var int: B = lookup(b);
var int: C = lookup(c);
var int: D = lookup(d);
var int: E = lookup(e);
var int: F = lookup(f);
var int: G = lookup(g);
var int: H = lookup(h);
var int: I = lookup(i);
var int: J = lookup(j);
var int: K = lookup(k);
var int: L = lookup(l);
var int: M = lookup(m);
var int: N = lookup(n);
var int: O = lookup(o);
var int: P = lookup(p);
var int: Q = lookup(q);
var int: R = lookup(r);
var int: S = lookup(s);
var int: T = lookup(t);
var int: U = lookup(u);
var int: V = lookup(v);
var int: W = lookup(w);
var int: X = lookup(x);
var int: Y = lookup(y);
var int: Z = lookup(z);


function var int: numeric(array[int] of CHR: word) = sum([digits[U(word[idx])] * pow(10, length(word)-idx) | idx in 1..length(word)]);

predicate firstLetterNonZero(array[int] of CHR: word) = digits[U(word[1])] != 0;

array[int] of CHR: allwords;

enum USEDLETTERS = U(array2set(allwords));
array[USEDLETTERS] of var 0..9: digits;


%%%%%%%%%%%%%%%%%%%%%

array[int] of CHR: word1 = [b, e, a, n, s];
array[int] of CHR: word2 = [b, e, a, n, s];
array[int] of CHR: total = [c, r, y, i, n, g];



allwords = word1 ++ word2 ++ total;

constraint alldifferent(digits);

var int: n1 = numeric(word1);
var int: n2 = numeric(word2);
var int: nt = numeric(total);

constraint n1 + n2 = nt;
constraint firstLetterNonZero(word1);
constraint firstLetterNonZero(word2);
constraint firstLetterNonZero(total);

output  " \(n1) \n" ++
        " \(n2) \n" ++ 
        "-------------\n" ++
        "\(nt)\n" ++
        "-------------\n"



% USEDLETTERS = {letter | letter in CHR where letter in word1 ++ word2 ++ total}; 

% constraint firstLetterNonZero(word1);
% constraint firstLetterNonZero(word2);
% constraint firstLetterNonZero(total);

% constraint numeric(word1) + numeric(word2) == numeric(total);

% output  "  \(B) \(E) \(E) \(N) \(S) + \n" ++
%         "  \(B) \(E) \(A) \(N) \(S) \n" ++
%         "-----------\n" ++ 
%         "\(C) \(R) \(Y) \(I) \(N) \(G)\n";