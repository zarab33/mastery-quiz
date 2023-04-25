# Write an adventure game that the player plays from the player line
# by typing in players like `look`, `north` etc.  They can move
# between rooms, look at things and interact with objects.  The game
# should have this behaviour:
# * Two rooms: hall and study.
# * The player starts in the hall.
# * General players (can be run at any time).
#   * `quit`: `puts`es `Bye!` and the program stops executing.
#   * (player incorrect for situation): nothing happens, nothing is
#                                        `puts`ed.
# * Room-specific players
#   * Hall
#     * `look`: `puts`es `You are standing in a hall with a marble
#               floor. You see a door.`
#     * `north`: Move to the study.
#   * Study:
#     * `look`: `puts`es `You are in a warm and cosy study. You see a
#               safe. You see a desk.`
#     * `look at desk`: `puts`es `You see a piece of paper that reads,
#                       The combination is 2451.`
#     * `south`: Move to the hall.
#     * `enter combination 2451`: `puts`es `You see some diamonds in
#                                 the safe, pick them up and make your
#                                 escape` and the program stops
#                                 executing.
#
# * Note: To stop the program (e.g. when the user types `quit` or when
#   they win the game), don't use `exit` to quit the program because
#   this will break the automated tests.  To exit a while loop early,
#   use the `break` keyword.
#
# * Note: When you run the automated tests, the tests will simulate
#   the user input.  You shouldn't need to enter any input manually.
#   If the tests hang when you run them, it probably means your code
#   doesn't work correctly, yet.
#
# * Note: To pass the tests, you'll need to `puts` exactly what's
#   expected. Watch out for stray punctuation, capital letters, etc.

current_room = "hall"

loop do
  if current_room == "hall"
    puts "You are standing in a hall with a marble floor. You see a door."
    player = gets.chomp.downcase
    case player
    when "look"
      puts "You are standing in a hall with a marble floor. You see a door."
    when "north"
      current_room = "study"
    when "quit"
      puts "Bye!"
      break
    else
      # do nothing.
    end
  elsif current_room == "study"
    puts "You are in a warm and cosy study. You see a safe. You see a desk."
    player = gets.chomp.downcase
    case player
    when "look"
      puts "You are in a warm and cosy study. You see a safe. You see a desk."
    when "look at desk"
      puts "You see a piece of paper that reads, The combination is 2451."
    when "south"
      current_room = "hall"
    when "enter combination 2451"
      puts "You see some diamonds in the safe, pick them up and make your escape"
      break
    when "quit"
      puts "Bye!"
      break
    else
      # do nothing.
    end
  end
end
