class Console
  FIRST_DEFAULT_MARKER = "X".freeze
  SECOND_DEFAULT_MARKER = "O".freeze
  VS_COMPUTER = "Vs. Computer".freeze
  VS_HUMAN = "Vs. Human".freeze
  COMPUTER_MODE = "Computer Mode".freeze
  MARKER_SELECT = "Marker Select".freeze
  RETURN = "Return to Main Menu".freeze
  HUMAN_TYPE = "H".freeze
  COMPUTER_TYPE = "C".freeze
  PLAYER = "Player".freeze
  PLAYER1 = "Player 1".freeze
  PLAYER2 = "Player 2".freeze
  COMPUTER = "Computer".freeze
  COMPUTER1 = "Computer 1".freeze
  COMPUTER2 = "Computer 2".freeze

  @@first_marker = FIRST_DEFAULT_MARKER
  @@second_marker = SECOND_DEFAULT_MARKER

  @@main_menu_list = {
    1 => VS_COMPUTER,
    2 => VS_HUMAN,
    3 => COMPUTER_MODE,
    4 => MARKER_SELECT,
    5 => "Exit Game"
  }

  @@vs_computer_list = {
    1 => "#{PLAYER} goes first",
    2 => "#{COMPUTER} goes first",
    3 => RETURN
  }

  @@vs_human_list = {
    1 => "#{PLAYER1} goes first",
    2 => "#{PLAYER2} goes first",
    3 => RETURN
  }

  @@play_again_list = {
    1 => "Yes",
    2 => "No"
  }

  def self.start
    main_menu
  end

  def self.main_menu
    system("clear")
    case show_menu(
      :title => "TIC TAC TOE",
      :menu  => @@main_menu_list)
    when 1
      vs_computer
    when 2
      vs_human
    when 3
      computer_mode
    when 4
      marker_select
    when 5
      goodbye
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

      error_message_menu_select(args[:menu])
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

  def self.error_message_menu_select(menu)
    system("clear")
    puts ":ERROR: SELECTION MUST BE AN INTEGER FROM 1 TO #{menu.size} :ERROR:"
    puts
  end

  def self.goodbye
    system("clear")
    puts "Goodbye!"
    puts
    exit
  end

  def self.vs_computer
    system("clear")
    case show_menu(
      :title => VS_COMPUTER,
      :menu  => @@vs_computer_list)
    when 1
      players = {:player1 => {:type => HUMAN_TYPE, :name => PLAYER, :marker => @@first_marker},
                :player2 => {:type => COMPUTER_TYPE, :name => COMPUTER, :marker => @@second_marker}}
    when 2
      players = {:player1 => {:type => COMPUTER_TYPE, :name => COMPUTER, :marker => @@first_marker},
                :player2 => {:type => HUMAN_TYPE, :name => PLAYER, :marker => @@second_marker}}
    when 3
      main_menu
    end
  end

  def self.vs_human
    system("clear")
    case show_menu(
      :title => VS_HUMAN,
      :menu  => @@vs_human_list)
    when 1
      players = {:player1 => {:type => HUMAN_TYPE, :name => PLAYER1, :marker => @@first_marker},
                :player2 => {:type => HUMAN_TYPE, :name => PLAYER2, :marker => @@second_marker}}
    when 2
      players = {:player1 => {:type => HUMAN_TYPE, :name => PLAYER2, :marker => @@first_marker},
                :player2 => {:type => HUMAN_TYPE, :name => PLAYER1, :marker => @@second_marker}}
    when 3
      main_menu
    end
  end

  def self.computer_mode
    players = {:player1 => {:type => COMPUTER_TYPE, :name => COMPUTER1, :marker => @@first_marker},
              :player2 => {:type => COMPUTER_TYPE, :name => COMPUTER2, :marker => @@second_marker}}
  end

  def self.marker_select
    system("clear")
    update_marker_select_list
    case show_menu(
      :title => MARKER_SELECT,
      :menu  => @@marker_select_list)
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
      1 => "First Player  (#{@@first_marker})",
      2 => "Second Player (#{@@second_marker})",
      3 => RETURN
    }
  end

  def self.assign_marker(marker)
    loop do
      @@first_marker  = marker_user_selection("First Player") if marker == 1
      @@second_marker = marker_user_selection("Second Player") if marker == 2
      break unless @@first_marker == @@second_marker
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

  def self.display(args = {})
    system("clear")
    puts error_message_index_select if args[:error] == true

    print_menu_title("Tic Tac Toe")

    puts "First Player:  (#{args[:first_player].marker}) #{args[:first_player].name}"
    puts "Second Player: (#{args[:second_player].marker}) #{args[:second_player].name}"
    
    puts
    show_board(args[:board])
    puts

    puts "Current Player: #{args[:current_player].name}" if args[:over] == nil
  end

  def self.show_board(board)
    0.upto(board.size ** 2 - 1) do |n|
      if board.state[n] == nil
        if n < 10
          print "  #{n}  "
        else
          print " #{n}  "
        end
      else
        print "  #{board.state[n]}  "
      end

      if ((n + 1) % board.size) == 0
        print "\n"
        unless (n + 1) == board.size ** 2 
          print "-" * (board.size * 6 - 1)
          print "\n"
        end
      else
        print "|"
      end
    end
  end

  def self.human_input(board)
    print "Please type your POSITION selection for your marker: "
    input = gets.strip.to_i
  end

  def self.valid_input?(num, board)
    num < board.state.size && board.state[num] == nil
  end

  def self.error_message_index_select
    puts ":ERROR: POSITION MUST BE AN AVAILABLE SPACE :ERROR:"
  end

  def self.show_winner(winner)
    puts "#{winner.name} wins!"
  end

  def self.show_tie(player1, player2)
    puts "#{player1.name} & #{player2.name} ties!"
  end

  def self.play_again?
    puts
    case show_menu(
      :title => "Play again?",
      :menu => @@play_again_list)
    when 1
      true
    when 2
      false
    end
  end

end