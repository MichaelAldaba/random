require_relative 'board.rb'
require_relative 'human.rb'
require_relative 'computer.rb'

class Game
  attr_reader :main_menu_list, :vs_computer_list, :start_game_list
  attr_accessor :board, :marker1, :marker2, :marker_select_list

  def initialize
    @board
    @marker1 = "X"
    @marker2 = "O"

    @main_menu_list = {
      1 => "Vs. Computer", 
      2 => "Vs. Human",
      3 => "Computer Mode",
      4 => "Marker Select",
      5 => "Exit Game"
    }

    @vs_computer_list = {
      1 => "Go First",
      2 => "Go Second",
      3 => "Return to Main Menu"
    }

    @start_game_list = {
      1 => "Start Game",
      2 => "Return to Main Menu"
    }
    
    @marker_select_list

    main_menu
  end
  
  def main_menu
    case show_menu(
      :menu => main_menu_list,
      :title => "Tic Tac Toe")
    when 1
      vs_computer
    when 2
      vs_human
    when 3
      computer_mode
    when 4
      marker_select
    when 5
      puts "Goodbye!"
    end
  end

  def show_menu(args)
    selection = nil

    loop do
      print_menu_title(args[:title])
      print_menu_list(args[:menu])

      selection = menu_user_selection
      break if args[:menu].has_key?(selection)

      error_message(args[:menu])
    end

    sleep(1)
    selection
  end

  def print_menu_title(title)
    puts dash(title)
    puts title
    puts dash(title)
  end

  def dash(title)
    "-" * title.length
  end

  def print_menu_list(menu)
    menu.each do |key, value|
      print_sub_menu(key, value)
    end
  end

  def print_sub_menu(key, value)
    puts "(#{key})" + " " + "#{value}"
  end

  def menu_user_selection
    print "\nPlease type your NUMBER selection. "
    selection = gets.chomp.to_i
    puts
    selection
  end

  def error_message(menu)
    puts ":ERROR: SELECTION MUST BE AN INTEGER FROM 1 TO #{menu.size} :ERROR:"
    puts

    sleep(1)
  end

  def vs_computer
    case show_menu(
      :menu => vs_computer_list,
      :title => "Vs. Computer")
    when 1
      start_game(
        Human.new(
          :marker => marker1,
          :name => "Player"),
        Computer.new(
          :marker => marker2,
          :name => "Computer",
          :other_marker => marker1))
    when 2
      start_game(
        Computer.new(
          :marker => marker1,
          :name => "Computer",
          :other_marker => marker2),
        Human.new(
          :marker => marker2,
          :name => "Player"))
    when 3
      main_menu
    end
  end

  def start_game(player1, player2)
    self.board = Board.new
    
    loop do
      player_turn(player1)
      break if board.game_over?
      player_turn(player2)
      break if board.game_over?
    end

    game_over_message(player1, player2)
  end

  def player_turn(player)
    board.show
    #sleep(2)
    puts "#{player.name}'s Turn"
    board.list[player.turn(board)] = player.marker
  end

  def game_over_message(player1, player2)
    board.show

    if board.win? && board.list.count(player1.marker) > board.list.count(player2.marker)
      puts "#{player1.name} Wins!"

    elsif board.win?
      puts "#{player2.name} Wins!"
    else
      puts "#{player1.name} & #{player2.name} Ties!"
    end
    puts

    sleep(2)
    main_menu
  end

  def vs_human
    case show_menu(
      :menu => start_game_list,
      :title => "Vs. Human")
    when 1
      start_game(
        Human.new(
          :marker => marker1,
          :name => "Player 1"),
        Human.new(
          :marker => marker2,
          :name => "Player 2"))
    when 2
      main_menu
    end
  end

  def computer_mode
    case show_menu(
      :menu => start_game_list,
      :title => "Computer Mode")
    when 1
      start_game(
        Computer.new(
          :marker => marker1,
          :name => "Computer 1",
          :other_marker => marker2),
        Computer.new(
          :marker => marker2,
          :name => "Computer 2",
          :other_marker => marker1))
    when 2
      main_menu
    end
  end

  def marker_select
    update_marker_select_list
    case show_menu(
      :menu => marker_select_list,
      :title => "Marker Select")
    when 1
      assign_marker(1)
    when 2
      assign_marker(2)
    when 3
      main_menu
    end
  end

  def update_marker_select_list
    self.marker_select_list = {
      1 => "First Player  (#{marker1})",
      2 => "Second Player (#{marker2})",
      3 => "Return to Main Menu"
    }
  end

  def assign_marker(marker_number)
    loop do
      self.marker1 = marker_user_selection if marker_number == 1
      self.marker2 = marker_user_selection if marker_number == 2
      break unless marker1 == marker2
      error_message_marker_match
    end

    sleep(1)
    marker_select
  end

  def marker_user_selection
    selection = nil

    loop do
      print "Please type your MARKER selection. "
      selection = gets.chomp.strip
      puts
      break unless (selection.empty? || selection.to_i.to_s == selection)
      error_message_marker_digit_empty
    end

    selection[0]
  end

  def error_message_marker_digit_empty
    puts ":ERROR: MARKER MUST BE A NON-WHITESPACE, NON-DIGIT CHARACTER :ERROR:"
    puts

    sleep(1)
  end

  def error_message_marker_match
    puts ":ERROR: MARKERS CANNOT MATCH :ERROR:"
    puts

    sleep(1)
  end

end

Game.new