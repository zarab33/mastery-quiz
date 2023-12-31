# Write a program that calculates the score for a word in Scrabble.
# It should:
# * Ask the user for a word e.g. `apple`.
# * `puts` the score for the word in Scrabble by totalling the points
#   for each letter in the word.
#   * Points for each letter:
#     * 0 points: blank tile
#     * 1 point: E, A, I, O, N, R, T, L, S, U
#     * 2 points: D, G
#     * 3 points: B, C, M, P
#     * 4 points: F, H, V, W, Y
#     * 5 points: K
#     * 8 points: J, X
#     * 10 points: Q, Z

# * Note: You can assume that the user will enter a word that only
#   contains letters and blanks.  You can assume the word will be in
#   uppercase.

points = {

0 => "",
1 => ["E", "A", "I", "O", "N", "R", "T", "L", "S", "U"],
2 => ["D", "G"],
3 => ["B", "C", "M", "P"],
4 => ["F", "H", "V", "W", "Y"],
5 => ["K"],
8 => ["J", "X"],
10 => ["Q", "Z"]
}
scrabble_points_calculator = {}
puts "Enter a word"
user = gets.chomp.upcase
user.chars.each do |letter|
  points.each do |num, letters|
    if letters.include?(letter)
      if scrabble_points_calculator[letter]
        scrabble_points_calculator[letter] += num
      else
        scrabble_points_calculator[letter] = num
        break
      end
    end
  end
end

puts scrabble_points_calculator.values.sum