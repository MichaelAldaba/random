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
    
    main_menu(MAIN_MENU)
  end

  def main_menu(menu)
    print_menu_title("Tic Tac Toe")
    print_menu(menu)
    
    selection = menu_select

    if menu_error?(menu, selection)
      error_message(menu)
      main_menu(MAIN_MENU)
    else
      main_menu_switchboard(selection)
    end
  end

  def print_menu_title(title)
    puts dash(title)
    puts title
    puts dash(title)
  end

  def dash(title)
    "-" * title.length
  end

  def print_menu(menu)
    menu.each do |key, value|
      print_sub_menu(key, value)
    end
  end

  def print_sub_menu(key, value)
    puts "(#{key})" + " " + "#{value}"
  end

  def menu_select
    print "\nPlease type your number selection. "
    selection = gets.chomp.to_i
  end

  def menu_error?(menu, selection)
    !menu.has_key?(selection)
  end

  def error_message(menu)
    puts
    puts ":ERROR: SELECTION MUST BE AN INTEGER FROM 1 TO #{menu.length} :ERROR:"
    puts
    sleep(2)
  end

  def main_menu_switchboard(selection)
    case selection
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