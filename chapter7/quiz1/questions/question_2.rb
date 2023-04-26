# Write a program that puts people into groups.  It should:
# * Ask the user to enter the number of groups they want to create.
# * Ask for people's names, one at a time, until the user enters `stop`.
# * Grouping strategy
#   * As an example, imagine there are three groups.
#   * First person goes in the first group.
#   * Second person goes in the second group.
#   * Third person goes in the third group.
#   * Fourth person goes in the first group.
#   * Fifth person goes in the second group.
#   * etc.
# * Ask the user for the number of a group.
# * Print the people in that group, each separated by a comma and a
#   space.  Group numbers are "1-indexed".  This means that, if the
#   user enters `1`, the first group should be printed, not the second
#   group.
# * Keep on asking the user for group numbers until the user enters
#   `stop`.
#
# * Example output
#   ```
#   Enter number of groups
#   3
#   Enter a name
#   Mary
#   Enter a name
#   Lauren
#   Enter a name
#   Awad
#   Enter a name
#   Govind
#   Enter a name
#   Isla
#   Enter a name
#   stop
#   Enter the number of a group to print out
#   1
#   Mary, Govind
#   Enter the number of a group to print out
#   2
#   Lauren, Isla
#   Enter the number of a group to print out
#   3
#   Awad
#   Enter the number of a group to print out
#   stop
#   ```
#
# * Note: You can assume the user will input an integer when asked how
#   many groups they want to create.  You can assume the user will
#   input integers for group numbers that exist when they are asked
#   for the number of a group to print out.

groups = []
puts "Enter number of groups"
num_groups = gets.chomp.to_i
num_groups.times { groups.push(Array.new) }

sub_group = 0
while true
  puts "Enter a name"
  name = gets.chomp
  break if name == "stop"
  
  groups[sub_group].push(name)
  sub_group += 1
  sub_group = 0 if sub_group > groups.length - 1
end

while true
  puts "Enter the number of a group to print out"
  input = gets.chomp
  break if input == "stop"

  group_num = input.to_i - 1
  if groups[group_num]
    puts groups[group_num].join(", ")
  else
    puts "Group does not exist"
  end
end

print groups
