class Game
  attr_reader :main_menu
  attr_accessor :player1marker, :player2marker

  def initialize
    @main_menu = { 
    	1 => "Go First", 
    	2 => "Go Second",
    	3 => "Versus",
    	4 => "Computer Mode",
    	5 => "Marker Selection"
    }
    @player1marker = "X"
    @player2marker = "O"
    
  end

  def show_menu_title(title)
    puts "-" * title.length
    puts title
    puts "-" * title.length
  end

  def dash
    puts "-" * title.length
  end

  def title
    puts "-----------"
    puts "Tic Tac Toe"
    puts "-----------"
    
    main_menu_select
  end
  def main_menu_select
    main_menu_switchboard(show_main_menu)
  end

  def show_main_menu
    show_menu(main_menu)
  end

  def show_menu(menu)
    selection = nil
    until menu.has_key?(selection)
      print_menu(menu)
      print "\nPlease type your number selection. "
      selection = gets.chomp.to_i
    end
    selection
  end

  def main_menu_switchboard(input)
    case input
    when 1
      go_first
    when 2
      go_second
    when 3
      versus
    when 4
      computer_mode
    when 5
      marker_selection
    end
  end

  def marker_selection
    puts
    puts "----------------"
    puts "Marker Selection"
    puts "----------------"
    show_markers
  end

  def show_markers
    puts
    puts "Player 1: #{player1marker}"
    print "Please type your marker selection. "
    input = gets.chomp

    puts "Player 2: #{player2marker}"
  end

  def print_menu(menu)
    menu.each do |key, value|
      print_sub_menu(key, value)
    end
  end

  def print_sub_menu(key, value)
    puts "(#{key})" + " " + "#{value}"
  end

end

Game.new