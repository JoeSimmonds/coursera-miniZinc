include "common.mzn";

array[int] of CHR: word1 = [c, a, o];
array[int] of CHR: word2 = [z, h, i];
array[int] of CHR: word3 = [c, a, o];
array[int] of CHR: word4 = [p, i];
array[int] of CHR: total = [t, e, s, t];

allwords = word1 ++ word2 ++ word3 ++ word4 ++ total; 

constraint firstLetterNonZero(word1);
constraint firstLetterNonZero(word2);
constraint firstLetterNonZero(word3);
constraint firstLetterNonZero(word4);
constraint firstLetterNonZero(total);

constraint numeric(word1) + numeric(word2) + numeric(word3) + numeric(word4) == numeric(total);

constraint digits[U(p)] = digits[U(z)] * 3;

constraint digits[U(o)] = 0;

output  "  \(C) \(A) \(O) + \n" ++
        "  \(Z) \(H) \(I) \n" ++
        "  \(C) \(A) \(O) \n" ++
        "    \(P) \(I) \n" ++
        "--------\n" ++ 
        "\(T) \(E) \(S) \(T) \n";