module Game
  WINNING_CONDITION = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 9], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  
  @@count = 0
  
  def play(board)
    board.display
    controller = false
    @@count.even? ? player = 'X' : player = 'O'
    puts "Player #{player} make your move"
    move = gets.to_i

    board.array.each_with_index do |position, idx|
      if position == move && board.array[idx].is_a?(Fixnum)
        board.array[idx] = player
        controller = true
      end
    end

    if controller == true
      @@count += 1
    else puts "You can't do that!"
    end

    if game_finished(board, player)
      puts "Player #{player} has won!"
      board.display
      return
    end

    if @@count == 9
      puts "It's a draw!"
      board.display
      return
    end
      
    play(board)
  end

  private

  def game_finished(board, player)
    WINNING_CONDITION.any? do |combination|
      combination.all? { |p| board.array[p - 1] == player}
    end
  end
end

class Board 
  attr_accessor :array

  def initialize(array)
    @array = array
  end

  def display
    puts ""
    puts " #{@array[0]} | #{@array[1]} | #{@array[2]}"
    puts " ---------"
    puts " #{@array[3]} | #{@array[4]} | #{@array[5]}"
    puts " ---------"
    puts " #{@array[6]} | #{@array[7]} | #{@array[8]}"
    puts ""
  end
end

include Game

board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])

play(board)









    