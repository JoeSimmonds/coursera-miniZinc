include "common.mzn";

array[int] of CHR: word1 = [b, e, a, n, s];
array[int] of CHR: word2 = [b, e, a, n, s];
array[int] of CHR: total = [c, r, y, i, n, g];

allwords = word1 ++ word2 ++ total;

constraint firstLetterNonZero(word1);
constraint firstLetterNonZero(word2);
constraint firstLetterNonZero(total);

constraint numeric(word1) + numeric(word2) == numeric(total);

output  "  \(B) \(E) \(A) \(N) \(S) + \n" ++
        "  \(B) \(E) \(A) \(N) \(S) \n" ++
        "-----------\n" ++ 
        "\(C) \(R) \(Y) \(I) \(N) \(G)\n";
        