class Console
  PLAYER1_DEFAULT_MARKER = "X".freeze
  PLAYER2_DEFAULT_MARKER = "O".freeze
  TITLE = "TIC TAC TOE".freeze
  VS_COMPUTER = "Vs. Computer".freeze
  VS_HUMAN = "Vs. Human".freeze
  COMPUTER_MODE = "Computer Mode".freeze
  MARKER_SELECT = "Marker Select".freeze
  RETURN = "Return to Main Menu".freeze


  @@player1_marker = PLAYER1_DEFAULT_MARKER
  @@player2_marker = PLAYER2_DEFAULT_MARKER

  @@main_menu_list = {
    1 => VS_COMPUTER,
    2 => VS_HUMAN,
    3 => COMPUTER_MODE,
    4 => MARKER_SELECT,
    5 => "Exit Game"
  }

  def self.start
    main_menu
  end

  def self.main_menu
    system("clear")
    case show_menu(
      :title => TITLE,
      :menu => @@main_menu_list)
    when 1
      vs_computer
    when 2
      vs_human
    when 3
      computer_mode
    when 4
      marker_select
    when 5
      system("clear")
      puts "Goodbye!"
      puts
      exit
    end
  end

  def self.show_menu(args)
    selection = nil

    loop do
      print_menu(
        :title => args[:title],
        :menu  => args[:menu])

      selection = menu_user_selection
      break if args[:menu].has_key?(selection)

      error_message(args[:menu])
    end

    selection
  end

  def self.print_menu(args)
    print_menu_title(args[:title])
    print_menu_list(args[:menu])
  end

  def self.print_menu_title(title)
    puts dash(title)
    puts title
    puts dash(title)
  end

  def self.dash(title)
    "-" * title.length
  end

  def self.print_menu_list(menu)
    menu.each do |key, value|
      print_sub_menu(key, value)
    end
  end

  def self.print_sub_menu(key, value)
    puts "(#{key})" + " " + "#{value}"
  end

  def self.menu_user_selection
    print "\nPlease type your NUMBER selection. "
    selection = gets.chomp.to_i
    puts
    selection
  end

  def self.error_message(menu)
    system("clear")
    puts ":ERROR: SELECTION MUST BE AN INTEGER FROM 1 TO #{menu.size} :ERROR:"
    puts
  end

  def self.marker_select
    system("clear")
    update_marker_select_list
    case show_menu(
      :title => MARKER_SELECT,
      :menu => @@marker_select_list)
    when 1
      assign_marker(1)
    when 2
      assign_marker(2)
    when 3
      main_menu
    end
  end

  def self.update_marker_select_list
    @@marker_select_list = {
      1 => "First Player  (#{@@player1_marker})",
      2 => "Second Player (#{@@player2_marker})",
      3 => RETURN
    }
  end

  def self.assign_marker(marker)
    loop do
      @@player1_marker = marker_user_selection("Player 1") if marker == 1
      @@player2_marker = marker_user_selection("Player 2") if marker == 2
      break unless @@player1_marker == @@player2_marker
      error_message_marker_match
      print_marker_select
    end

    system("clear")
    marker_select
  end

  def self.marker_user_selection(player)
    selection = nil

    loop do
      print "Please type your MARKER selection for #{player}. "
      selection = gets.chomp.strip
      puts
      break unless (selection.empty? || selection.to_i.to_s == selection)
      error_message_marker_digit_empty
      print_marker_select
    end

    selection[0]
  end

  def self.error_message_marker_digit_empty
    system("clear")
    puts ":ERROR: MARKER MUST BE A NON-WHITESPACE, NON-DIGIT CHARACTER :ERROR:"
    puts
  end

  def self.error_message_marker_match
    system("clear")
    puts ":ERROR: MARKERS CANNOT MATCH :ERROR:"
    puts
  end

  def self.print_marker_select
    print_menu(
      :title => MARKER_SELECT,
      :menu  => @@marker_select_list)
    puts
  end

end		