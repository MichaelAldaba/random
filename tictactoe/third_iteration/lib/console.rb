class Console
  PLAYER1_DEFAULT_MARKER = "X".freeze
  PLAYER2_DEFAULT_MARKER = "O".freeze

  @@player1_marker = PLAYER1_DEFAULT_MARKER
  @@player2_marker = PLAYER2_DEFAULT_MARKER

  @@main_menu_list = {
    1 => "Vs. Computer",
    2 => "Vs. Human",
    3 => "Computer Mode",
    4 => "Marker Select",
    5 => "Exit Game"
  }

  def self.start
    main_menu
  end

  def self.main_menu
    case show_menu(
      :menu => @@main_menu_list,
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

  def self.show_menu(args)
    selection = nil

    loop do
      print_menu_title(args[:title])
      print_menu_list(args[:menu])

      selection = menu_user_selection
      break if args[:menu].has_key?(selection)

      error_message(args[:menu])
    end

    selection
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

end		