include "common.mzn";

array[int] of CHR: word1 = [s, e, v, e, n];
array[int] of CHR: word2 = [p, a, c, e, s];
array[int] of CHR: total = [v, e, r, s, e];

allwords = word1 ++ word2 ++ total; 

constraint firstLetterNonZero(word1);
constraint firstLetterNonZero(word2);
constraint firstLetterNonZero(total);

constraint numeric(word1) + numeric(word2) == numeric(total);

solve maximize(numeric(total));

output  "\(S) \(E) \(V) \(E) \(N) + \n" ++
        "\(P) \(A) \(C) \(E) \(S) \n" ++
        "-----------\n" ++ 
        "\(V) \(E) \(R) \(S) \(E) \n";
        
