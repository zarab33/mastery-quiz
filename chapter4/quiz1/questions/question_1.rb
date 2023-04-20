# Write a program that:
# * Calculates the "FizzBuzz sequence" from 1 to 20.
#   * For each integer between 1 and 20 (inclusive).
#     * If the number is divisible by 3, replace the number with `Fizz`.
#     * If the number is divisible by 5, replace the number with `Buzz`
#     * If the number is divisible by 3 and 5, replace the number with
#       `FizzBuzz`.
#     * If the number is divisible by neither 3 or 5, keep the number.
# * `puts`es these "FizzBuzz sequence" entries, one per line.

(1..20).each do |fizzbuzz|
    if fizzbuzz % 3 == 0 && fizzbuzz % 5 == 0
    puts "FizzBuzz"
elsif fizzbuzz % 3 == 0 
    puts "Fizz"
 elsif fizzbuzz % 5 == 0 
    puts "Buzz"
    else
    puts fizzbuzz
end
end