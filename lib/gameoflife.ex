defmodule Gameoflife do
  use Application

  @moduledoc """
  Documentation for `Gameoflife`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Gameoflife.hello()
      :world

  """
  @impl true
  def start(_type, _args) do
    board = build_board(%{}, 0, -1)

    continue_game(board)

  end

  def build_board(board, x_index, y_index) do
    cond do
      x_index == 9 && y_index == 9 ->
        board

      y_index == 9 ->
        y_index = 0
        x_index = x_index + 1
        board = Map.put(board, {x_index, y_index}, "O")
        build_board(board, x_index, y_index)

      y_index < 9 ->
        y_index = y_index + 1
        board = Map.put(board, {x_index, y_index}, "O")
        build_board(board, x_index, y_index)
    end

  end

  def begin_game(board, x_index, y_index) do

    cond do
      x_index == 9 && y_index == 9 ->
        board

      y_index == 9 ->
        y_index = 0
        x_index = x_index + 1
        is_alive = Logic.determine_alive_or_dead(board,x_index,y_index)
        begin_game(Map.put(board, {x_index, y_index}, is_alive), x_index, y_index)

      y_index < 9 ->
        y_index = y_index + 1
        is_alive = Logic.determine_alive_or_dead(board,x_index,y_index)
        begin_game(Map.put(board, {x_index, y_index}, is_alive), x_index, y_index)
    end

  end


  def print_board(board) do
    board
    |> Map.values()
    |> Enum.chunk_every(10)
    |> Enum.each( fn x ->
      IO.write(Enum.join(x, " "))
      IO.write("\r\n")
    end)
  end

  def continue_game(board) do
    IO.write("\e[H")
    print_board(board)
    :timer.sleep(1000)
    continue_game(begin_game(board, 0, -1))
  end

end
