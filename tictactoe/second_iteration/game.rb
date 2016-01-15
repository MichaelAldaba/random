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
    print_menu_title("Tic Tac Toe")
  end

  def print_menu_title(title)
    puts dash(title)
    puts title
    puts dash(title)
  end

  def dash(title)
    "-" * title.length
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

  def print_menu(menu)
    menu.each do |key, value|
      print_sub_menu(key, value)
    end
  end

  def print_sub_menu(key, value)
    puts "(#{key})" + " " + "#{value}"
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

end

Game.new