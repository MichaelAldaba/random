class Game
  attr_accessor :main_menu_list, :marker_select_list, :marker1, :marker2 

  def initialize
    @marker1 = "X"
    @marker2 = "O"

    @main_menu_list = {
      1 => "Go First", 
      2 => "Go Second",
      3 => "Versus",
      4 => "Computer Mode",
      5 => "Marker Select",
      6 => "Exit Game"
    }

    @marker_select_list
    
    main_menu
  end
  
  def main_menu
    case show_menu(
      :menu => main_menu_list,
      :title => "Tic Tac Toe")
    when 1
      go_first
    when 2
      go_second
    when 3
      versus
    when 4
      computer_mode
    when 5
      marker_select
    end
  end

  def show_menu(args)
    selection = nil

    loop do
      print_menu_title(args[:title])
      print_menu_list(args[:menu])

      selection = menu_user_input
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

  def menu_user_input
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

  def marker_select
    update_marker_select_list
    case show_menu(
      :menu => marker_select_list,
      :title => "Marker Select")
    when 1
      self.marker1 = marker_user_input
      marker_select
    when 2
      self.marker1 = marker_user_input
      marker_select
    when 3
      main_menu
    end
  end

  def marker_user_input
    input = ""

    loop do
      print "Please type your MARKER selection. "
      input = gets.chomp.strip
      puts
      break unless input.empty?
      error_message_marker
    end

    sleep(1)

    input[0]
  end

  def error_message_marker
    puts ":ERROR: MARKER MUST BE A NON-WHITESPACE CHARACTER :ERROR:"
    puts

    sleep(1)
  end

  def update_marker_select_list
    self.marker_select_list = {
      1 => "First Player  (#{marker1})",
      2 => "Second Player (#{marker2})",
      3 => "Return to Main Menu"
    }
  end

end

Game.new













=begin

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