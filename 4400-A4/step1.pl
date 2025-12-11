word(['P','R','O','L','O','G']).
word(['P','E','R','L']).
word(['O','N','L','I','N','E']).
word(['W','E','B']).
word(['G','N','U']).
word(['N','F','S']).
word(['S','Q','L']).
word(['M','A','C']).
word(['E','M','A','C','S']).
word(['X','M','L']).
word(['L','I','N','U','X']).
word(['J','A','V','A']).
word(['G','O','O','G','L','E']).
word(['P','Y','T','H','O','N']).
word(['P','A','R','S','E','R']).
word(['C','O','O','P']).
word(['L','O','O','P']).
word(['F','O','R','K']).
word(['K','E','R','N','E','L']).
word(['A','P','I']).
word(['M','O','U','S','E']).
word(['F','I','F','O']).
word(['P','I','P','E']).

crossword(H1, H2, H3, H4, H5, V1, V2, V3, V4, V5, V6) :-
    length(H1, 6),
    length(H2, 5),
    length(H3, 3),
    length(H4, 3),
    length(H5, 3),
    length(V1, 4),
    length(V2, 6),
	length(V3, 3),
    length(V4, 3),
    length(V5, 3),
    length(V6, 5),
    
    word(H1), 
    word(H2), 
    word(H3), 
    word(H4), 
    word(H5), 
    word(V1), 
    word(V2), 
    word(V3), 
    word(V4), 
    word(V5), 
    word(V6),

	nth(0, H1, I1), nth(0, V1, I1),
	nth(2, H1, I2), nth(0, V2, I2),
	nth(5, H1, I3), nth(0, V4, I3),
    nth(0, H2, I4), nth(2, V2, I4),
	nth(2, H2, I5), nth(0, V3, I5),
	nth(3, H2, I6), nth(2, V4, I6),
	nth(4, H2, I7), nth(0, V5, I7),
	nth(0, H3, I8), nth(1, V5, I8),
	nth(2, H3, I9), nth(3, V6, I9),
    nth(0, H4, I10), nth(2, V3, I10),
    nth(2, H4, I11), nth(2, V5, I11),
    nth(1, H5, I12), nth(5, V2, I12),
    
    all_unique([H1,H2,H3,H4,H5,V1,V2,V3,V4,V5,V6]).

nth(0, [X|_], X).
nth(N, [_|T], X) :-
    N > 0,
    N1 is N - 1,
    nth(N1, T, X).

all_unique([]).
all_unique([X|Xs]) :- \+ member(X, Xs), all_unique(Xs).