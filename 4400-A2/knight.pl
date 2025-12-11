knight_path(N, SolutionPath) :-
    solution(N, [1, 1], [[1, 1]], SolutionPath).
    
solution(N, [_, _], CurrentPath, SolutionPath) :-
    length(CurrentPath, L),
    L =:= (N * N),
    SolutionPath = CurrentPath.
    
solution(N, [X, Y], CurrentPath, SolutionPath) :-
    validMove(N, [X, Y], CurrentPath, [NextX, NextY]),
    solution(N, [NextX, NextY], [[NextX, NextY] | CurrentPath], SolutionPath).

validMove(N, [X, Y], CurrentPath, [NextX, NextY]) :-
    nextMove([X, Y], [NextX, NextY]),
    NextX =< N,
    NextX > 0,
    NextY =< N,
    NextY > 0,
    \+ member([NextX, NextY], CurrentPath).

nextMove([X, Y], [NextX, NextY]) :- NextX is X + 1, NextY is Y + 2.
nextMove([X, Y], [NextX, NextY]) :- NextX is X + 2, NextY is Y + 1.
nextMove([X, Y], [NextX, NextY]) :- NextX is X + 2, NextY is Y - 1.
nextMove([X, Y], [NextX, NextY]) :- NextX is X + 1, NextY is Y - 2.
nextMove([X, Y], [NextX, NextY]) :- NextX is X - 1, NextY is Y - 2.
nextMove([X, Y], [NextX, NextY]) :- NextX is X - 2, NextY is Y - 1.
nextMove([X, Y], [NextX, NextY]) :- NextX is X - 2, NextY is Y + 1.
nextMove([X, Y], [NextX, NextY]) :- NextX is X - 1, NextY is Y + 2. 