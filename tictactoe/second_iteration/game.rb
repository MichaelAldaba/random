class Game
  attr_reader :main_menu

  def initialize
    @main_menu = { 
    	1 => "Go First", 
    	2 => "Go Second",
    	3 => "Versus",
    	4 => "Computer Mode",
    	5 => "Marker Selection"
    }
    puts "-----------\nTic Tac Toe\n-----------"
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
      puts "Please type your number selection."
      print_menu(menu)
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