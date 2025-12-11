Muhammad Sawaiz Karim A3 readme

To run this program, just paste the contents of the knight.pl file into a new https://swish.swi-prolog.org/ program. Query is "knight_path(N, X)." where N is the size of the chessboard you want along one dimension. 

knight_path/2: this predicate takes in two arguments, N and SolutionPath. It is just used to call the main recursive predicate.

solution/4: this is the main recursive predicate. It takes in the size of the chessboard N, the current position of the knight, the squares visited so far (CurrentPath), and a SolutionPath variable.

Base case: when the length of CurrentPath is equal to NxN,our knight will have visited all the squares. It binds this CurrentPath to SolutionPath, and that is what's returned when knight_path is queried.

Recursive case: the program makes a valid move using the validMove/4 predicate, and then calls the solution predicate again, having prepended the valid move to CurrentPath.

validMove/4: using the nextMove/2 helper predicate, it tries a move. Then it does some checks to ensure that the knight doesn't go off the board and that the move it made wasn't in the CurrentPath.

nextMove/2: this just calculates the next x and y coordinates for the knight. There's eight different moves defined. 