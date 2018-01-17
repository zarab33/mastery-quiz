# Fixing problems

## I can't find the quizzes in mastery-quizzes

* You need to manually request a quiz.  See ["Get the quiz" in the README](README.md#get-the-quiz).

## One or more of the commands I ran on the command line during the setup result in an error

* Contact @maryrosecook on Slack with a description of what you did and the full error message.

## I can't get a quiz

### Do the setup instructions

* Make sure you did all the instructions in order and none of them produced any errors.

### Check the get_quiz command you ran

* Is your GitHub username correct?
* Does your GitHub username have the correct capitalisation?

## My program won't do what I want it to do and I don't know why

### Watch the video guide to effective debugging

https://www.youtube.com/watch?v=Bt4Q0nP9Igc

## When I run the tests with `rspec`, they fail

### I don't know what my program should do

* The automated tests are small test programs that live in a file like `question_1_spec.rb`.  These small test programs run parts of the program that you wrote (e.g. the program in `question_1.rb`) to check it conforms to the program specification.

* To get the tests to pass, you just need to write a program that does the things required by the program specification.

* When your code makes all the tests pass, you're done!

* Your program should have tho *bare minimum* of code needed to follow this program specification.

#### You can get information about what your program needs to do from the program specification itself

e.g.

```ruby
# Write a program that `puts`es a number.
```

#### You can get information about what your program needs to do from the test descriptions in the test file (e.g. `question_1_spec.rb`).

Look at the lines that look like this:

```ruby
context "user enters many numbers: 10,4,2,7,5,1" do
```

and

```ruby
it "`puts`es one bar for each number" do
```

#### You can get information about what your program needs to do from the actual test code

e.g.:

```ruby
let (:user_input) { "10,4,2,7,5,1\n" }
let (:expected_output) {
  ["----------",
  "----",
  "--",
  "-------",
  "-----",
  "-"].join("\n")
}
```

This code might be hard to read right now, but if you squint you might be able to guess that the user seems to be inputting 10, 4, 2, 7, 5 and 1 and the program is supposed to `puts` a line of ten dashes, a line of 4 dashes...

### I can't understand the test failure error message

#### The error message is confusing me

Let's wring every single piece of information we can from this error!

```
 1.  Q2. Sum integers
 2.    calculates 1 + 2 + 3 + ... + 250 and `puts`es the result (FAILED - 1)
 3.
 4.  Failures:
 5.
 6.    1) Q2. Sum integers calculates 1 + 2 + 3 + ... + 250 and `puts`es the result
 7.       Failure/Error:
 8.         expect { load "questions/question_2.rb" }
 9.           .to output(/#{expected}$/).to_stdout
10.
11.       NameError:
12.         undefined local variable or method `numbers' for main:Object
13.       # questions/question_2.rb:7:in `looping_adder'
14.       # questions/question_2.rb:11:in `<top (required)>'
15.       # ./spec/question_2_spec.rb:7:in `load'
16.       # ./spec/question_2_spec.rb:7:in `block (3 levels) in <top (required)>'
17.       # ./spec/question_2_spec.rb:7:in `block (2 levels) in <top (required)>'
```

* `1` tells us which question has the error.

* `2` tells us what the test is expecting the program to do.  That is: which part of the program specification it is checking.

* `8` shows us a relevant part of the test code.  We can tell that our `question_2.rb` file is being run.

* `9` shows us the next line of the relevant part of the test code.  We can tell that the test is expecting some particular output.  We can look in the `question_2_spec.rb` test file to see what `expected` is.

* `11` tells us that an exception has been raised that has caused the program to terminate.

* `11` tells us what type of error was the cause of the exception.  In this case, it's a NameError, which is raised when either a variable doesn't exist, or when a variable name is syntactically invalid.

* `12` gives us the details of the exception.  In this case, it tells us exactly what is wrong with the program! We've tried to use a variable or method called `numbers` and it doesn't exist.

* `13` is the start of the stack trace.  It tells us which line was the last to execute in our program before it terminated.  We should start our search for the error here.

* `14` to `17` show the rest of the stack trace.  These are lines that were executed before the line indicated by `13`.

* `17` tells us the file and line number of the first line of code run right at the beginning of the program.  In this case, it tells us which test caused the error.

#### The test that fails is called "has acceptable code quality" and I don't know how to fix it

* For more general help on reading test failures, see "The error message is confusing me" above.
* This section focuses on resolving code quality problems.

```
 1.  Q1. FizzBuzz to 20
 2.    `puts`es numbers 1 - 20, except Fizz if divisible by 3, Buzz if divisible by 5, FizzBuzz if divisible by 3 and 5
 3.    has acceptable code quality (FAILED - 1)
 4.
 5.  Failures:
 6.
 7.    1) Q1. FizzBuzz to 20 has acceptable code quality
 8.       Failure/Error: expect(code_quality.acceptable?).to(eq(true), code_quality.problems)
 9.
10.         Inspecting 1 file
11.         C
12.
13.         Offenses:
14.
15.         questions/question_1.rb:14:5: W: Lint/UselessAssignment: Useless assignment to variable - a.
16.             a = 1
17.             ^
18.         questions/question_1.rb:23:11: C: Layout/SpaceAroundOperators: Surrounding space missing for operator +=.
19.             number+= 1
20.                   ^^
21.
22.         1 file inspected, 2 offenses detected
23.       # ./spec/question_1_spec.rb:32:in `block (2 levels) in <top (required)>'
```

* `7` tells us that the test has failed because one or more parts of the code in the question file are not high enough quality.

* `15` tells us the file and line number of a piece of code that is not high enough quality.

* `15` Tells us the quality rule that this line of code breaks: `Lint/UselessAssignment`.

* `15` Gives us more details on why the line of code broke the quality rule `Useless assignment to variable - a`

* `16` Shows us the code of the line that breaks the quality rule.

* `17` Shows us the part of the line of code that breaks the quality rule.

* `18` to `20` Give us the details for another bit of code that breaks a different quality rule.

#### The `rspec` error says something about a `Diff`

* A "diff" is a list of differences between two pieces of text.

* An rspec error that mentions a diff usually means that your program is outputting something different from what the test wants to be output.

##### The contents of the diff tells you exactly what this test wants to see your program output

* A diff tells us two different things e.g.

```diff
expected block to output /31375
$/ to stdout, but output "The sum of all integers from 1' to '250' is 249\n"
Diff:
@@ -1,3 +1,2 @@
-/31375
-$/
+The sum of all integers from 1' to '250' is 249
```

1. The first two lines tell us exactly what the test was expecting the program to output:

```
31375

```

and exactly what it actually output:

```
The sum of all integers from 1' to '250' is 249
```

2. The last three lines tell us what the differences were between the two versions.  The `-`s indicate lines it didn't see but expected to see.  And the `+`s tells us lines it didn't expect to see but did see.

##### Check the spelling, capitalisation, spacing and line breaks of your program's output

* Computers require high precision.  If the computer checks for `E`, it very often very precise.  It won't accept `e` or `E ` or `E\n`.







## The tests for a quiz pass on my computer, but when I submit them with `rake submit_and_verify_quiz_answers`, they fail

### Check the tests really do pass on your computer

* When you run the tests, you should see something like this:

```
Finished in 0.0034 seconds (files took 0.20204 seconds to load)
1 example, 0 failures
```

It should say `0 failures`.

### Check you've pushed your code to GitHub

* Look at the latest commit on your repo on GitHub and check it has the same hash (the 40-character alphanumeric string) as the latest commit on your local repository.

### Check you're not running your program in the top level of your question file

* Does the question file (e.g. `question_1.rb`) have a comment like "Note: When you run the automated tests, make sure to remove from the top level of the file any calls to `run_test` or other methods."? If so, make sure you haven't done this.
