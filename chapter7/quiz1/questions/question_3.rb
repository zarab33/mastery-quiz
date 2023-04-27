# Write a game where the player swims down a river infested with
# crocodiles.  The game should:
# * Use the `river` variable that defines the river (see code below).
#   * `-`: clear water.
#   * `C`: crocodile.
#   * The first five characters represent the first part of the river.
#     The second five characters represent the second part of the
#     river.  And so on.
# * Define the player as one character wide.
# * Start the player at the central position of the first part of the
#   river.
#   * e.g. `C-P--`.
# * Each turn:
#   * Check to see if the player is in the same position as a
#     crocodile.  If they are, `puts` `You were eaten.' and stop the
#     program.
#   * `puts` the whole river.  Include a `P` where the player is.
#   * Ask the player if they want to go to left, right or neither.
#     The player enters `left`, `right` or `neither`.
#   * Make the player float down the river by one river part (one line
#     of digits).  Move them to the left, the right, or keep them
#     where they are.
# Print `You survived!` if the player makes it past all parts of the
# river without hitting a crocodile.
#
# * Note: To stop the game when the user is eaten or survives the
#   whole river, don't use `exit` to quit the program because this
#   will break the automated tests.  To exit a while loop early, use
#   the `break` keyword.
#
# * Note: You can assume the player will never move outside the
#   boundary of the river when they choose left and right.  You can
#   also assume the player will always enter either `left`, `right` or
#   `neither`.
#
# * Example output:
#   ```
#   --P--
#   --C--
#   CC-CC
#   CC-CC
#   Type left, right or neither
#   left
#   -----
#   -PC--
#   CC-CC
#   CC-CC
#   Type left, right or neither
#   right
#   -----
#   --C--
#   CCPCC
#   CC-CC
#   Type left, right or neither
#   neither
#   -----
#   --C--
#   CC-CC
#   CCPCC
#   Type left, right or neither
#   neither
#   You survived!
#   ```
river = "-----,--C--,CC-CC,CC-CC"
river_section = river.split(",").to_a
quit = 0
puts "--P--"
puts river_section[1]
puts river_section[2]
puts river_section[3]
puts "Type left, right or neither"
user = gets.chomp
while true do
  if user == "neither"
    puts "You were eaten."
    quit = 1
    break
  end
  if user == "left"
    puts river_section[0]
    puts "-PC--"
    puts river_section[2]
    puts river_section[3]
  end
  if user == "right"
    puts river_section[0]
    puts "--CP-"
    puts river_section[2]
    puts river_section[3]
  end
  if user == "left"
    puts "Type left, right or neither"
    user = gets.chomp
    if user == "right"
      puts river_section[0]
      puts river_section[1]
      puts "CCPCC"
      puts river_section[3]
    elsif user == "left" or "neither"
      puts "You were eaten."
      quit += 1
      break
    end
  elsif user == "right"
    puts "Type left, right or neither"
    user = gets.chomp
    if user == "left"
      puts river_section[0]
      puts river_section[1]
      puts "CCPCC"
      puts river_section[3]
    elsif user == "right" or "neither"
      puts "You were eaten."
      quit += 1
      break
    end
  end
  puts "Type left, right or neither"
  user = gets.chomp
  if user == "neither"
    puts river_section[0]
    puts river_section[1]
    puts river_section[2]
    puts "CCPCC"
  elsif user == "left" or "right"
    puts "You were eaten."
    quit += 1
    break
  end
  puts "Type left, right or neither"
  user = gets.chomp
  if user == "neither"
    puts "You survived!"
    quit += 1
    break
  end
  if user == "left" or "right"
    puts "You were eaten."
    quit += 1
    break
  end
  if quit == 1
    break
  end
end