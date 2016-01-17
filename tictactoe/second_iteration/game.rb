class Game
  attr_accessor :marker1, :marker2

  MAIN_MENU = { 
    1 => "Go First", 
    2 => "Go Second",
    3 => "Versus",
    4 => "Computer Mode",
    5 => "Marker Selection"
  }

  def initialize
    @marker1 = "X"
    @marker2 = "O"
    
    main_menu
  end

  def main_menu
    print_menu_title("Tic Tac Toe")
    main_menu_switchboard
  end

  def print_menu_title(title)
    puts dash(title)
    puts title
    puts dash(title)
  end

  def dash(title)
    "-" * title.length
  end

  def main_menu_switchboard
    case show_menu(MAIN_MENU)
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

  def show_menu(menu)
    selection = nil
    until menu.has_key?(selection)
      print_menu(menu)
      print "\nPlease type your number selection. "
      selection = gets.chomp.to_i
      puts
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

  def marker_selection
    print_menu_title("Marker Selection")
    puts "First Player:  (#{marker1})"
    puts "Second Player: (#{marker2})"

    marker = ""
    until marker.length > 0
      print "\nPlease type your marker selection for [First Player] "
      marker = gets.chomp
    end
    self.marker1 = marker

    marker = ""
    until marker.length > 0
      print "\nPLease type your marker selection for [Second Player] "
      marker = gets.chomp
      puts
    end
    self.marker2 = marker

    puts "First Player:  (#{marker1})"
    puts "Second Player: (#{marker2})"
  end

end

Game.new