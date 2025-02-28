
# Tic-Tac-Toe using MATLAB

This repository contains a Tic-Tac-Toe game built using MATLAB's Graphical User Interface (GUI). The game allows two players to take turns placing 'X' and 'O' on a 3x3 grid until one player wins or the game results in a draw.


## Features

- Interactive GUI: Clickable buttons for each move.

- Two-Player Mode: Players alternate turns automatically.

- Win Detection: Identifies row, column, and diagonal victories.

- Draw Detection: Recognizes when the board is full with no winner.

- Restart Button: Easily reset the game at any time.


## Code Overview

- tic_tac_toe: Initializes the game and GUI.

- button_callback: Handles player moves and updates the board.

- check_winner: Checks for a winning condition.

- disable_buttons: Disables buttons after game completion.

- restart_game: Resets the board for a new round.
## Game Logic

- Player 1 uses 'O' and Player 2 uses 'X'.

- The game checks for a win after each move.

- If a player gets three marks in a row, column, or diagonal, they win.

- If all spots are filled and no player wins, the game is a draw.
## Requirements

- Matlab should be installed on system