defmodule Logic do

  def determine_alive_or_dead(board, x_index, y_index) do
    current_spot = is_alive(board, x_index, y_index);
    amount_alive = amount_of_alive_around(board, x_index, y_index);
    
    if((amount_alive == 2 && current_spot == :alive) || amount_alive == 3) do "O"
    else "X"
    end
  end

  def is_alive(board, x_index, y_index) do
    if Map.get(board, {x_index, y_index}) == "O" do
      :alive
    else
      :dead
    end

  end

  def amount_of_alive_around(board, x_index, y_index) do
    left = is_alive(board, x_index - 1, y_index);
    top_left = is_alive(board, x_index - 1, y_index - 1);
    bottom_left = is_alive(board, x_index - 1, y_index + 1);
    bottom = is_alive(board, x_index, y_index + 1);
    bottom_right = is_alive(board, x_index + 1, y_index + 1);
    top_right = is_alive(board, x_index + 1, y_index - 1);
    right = is_alive(board, x_index + 1, y_index);
    top = is_alive(board, x_index, y_index - 1);

    temp_structure = [left, top_left, bottom_left, bottom, bottom_right, top_right, right, top]

    Enum.reduce(temp_structure, 0, fn x, acc -> if x == :alive, do: acc + 1, else: acc end)
  end
end
