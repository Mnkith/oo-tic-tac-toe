require 'pry'
# require_relative '../lib/tic_tac_toe.rb'

class TicTacToe 
  WIN_COMBINATIONS = [[0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [2, 4, 6]]
                     
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def position_taken?(i)
    @board[i] == "O" || @board[i] == "X"
  end 
  
  def valid_move?(i)
    !position_taken?(i) && (i >= 0 && i <= 8)
  end
  
  def input_to_index(ind)
    ind.to_i - 1
  end
  
  def move(ind, xo = "X")
    @board[ind] = xo;
  end
  
  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
      return turn_count % 2 == 0 ? "X" : "O"
    if valid_move?()
      move(index, current_player(board))
      display_board()
    else
      turn()
    end
  end
  
  def turn_count()
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player()
      return turn_count() % 2 == 0 ? "X" : "O"
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def won?()
    WIN_COMBINATIONS.find do |win|
      (@board[win[0]] == "X" || @board[win[0]] == "O") &&
       @board[win[0]] == @board[win[1]] &&
       @board[win[1]] == @board[win[2]]
    end
  end
  
  def full?
    !@board.any? { |i| i != "X" && i != "O"}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    full? || won? || draw?
  end
  # 
  def winner
    a = won?
    a == nil ? nil : @board[a[0]]
  end
  
  def play
    until over?
      turn
    end
    if winner != nil
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat\'s Game!"
    end
  end
end
