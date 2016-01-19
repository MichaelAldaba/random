class Game
  attr_accessor :marker1, :marker2

  MAIN_MENU = { 
    1 => "Go First", 
    2 => "Go Second",
    3 => "Versus",
    4 => "Computer Mode",
    5 => "Marker Selection"
  }

  MARKER_SELECTION = {
    1 => "First Player",
    2 => "Second Player"
  }

  def initialize
    @marker1 = "X"
    @marker2 = "O"
    
    main_menu
  end
  
  def main_menu
    case show_main_menu(MAIN_MENU)
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

  def show_main_menu(menu)
    selection = nil

    loop do
      print_menu_title("Tic Tac Toe")
      print_menu_list(menu)

      selection = menu_user_input
      break if menu.has_key?(selection)

      error_message(menu)
    end

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

  def menu_user_input
    print "\nPlease type your number selection. "
    selection = gets.chomp.to_i
  end

  def error_message(menu)
    puts "\n:ERROR: SELECTION MUST BE AN INTEGER FROM 1 TO #{menu.size} :ERROR:"
    puts

    sleep(2)
  end

end

Game.new




















=begin
  def marker_selection
    print_menu_title("Marker Selection")
    show_markers
    
    marker_selection_switchboard
    #show_markers
    
    #sleep(2)

    main_menu
  end

  def show_markers
    puts "First Player:  (#{marker1})"
    puts "Second Player: (#{marker2})"
    puts
  end

  def marker_selection_switchboard
    show_menu(MARKER_SELECTION) == 1 ? assign_marker1 : assign_marker2
  end

  def assign_marker1
    puts "ASSIGN MARKER 1"
  end

  def assign_marker2
    puts "ASSIGN MARKER 2"
  end

  def assign_markers
    self.marker1 = get_marker("First")
    self.marker2 = get_marker("Second")
  end

  def get_marker(player)
    input = ""

    until input.length > 0
      print "Please type your marker selection for [#{player} Player]. "
      input = gets.chomp
      puts
    end
    
    input
  end
=end