# Game of Life in Elixir

This project is an implementation of Conway's Game of Life using Elixir, built to understand the basics of the language.

## Overview

The Game of Life simulates the evolution of a grid of cells, where each cell can be alive or dead. The initial state has all cells alive, and their status changes based on the number of live neighbors according to the game’s rules.

### Features

- **Functional Elixir**: Leverages Elixir’s functional programming style.
- **Custom Game Logic**: Determines the state of each cell using neighbor counts.
- **Console Display**: Outputs the game board in the console, with live cells as "O" and dead cells as "X."
- **Recursive Gameplay**: The game runs in an infinite loop, updating the board continuously.
