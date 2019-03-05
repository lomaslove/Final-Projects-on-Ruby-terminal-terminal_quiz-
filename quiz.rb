class Question
    attr_accessor :prompt, :answer
    def initialize(prompt, answer)
        @prompt = prompt
        @answer = answer
    end 
end 


q1 = "what is the capital of australia?\n(a) sydney \n(b) brisbane \n(c) canberra"
q2 ="what number bus goes to spring hill?\n(a) 230 \n(b) 40 \n(c) 30"
q3 = "what level is coder academy? \n(a)2 \n(b)3 \n(c)4"
q4= "how many chamber are there in human heart?\n(a) 1 \n(b) 2 \n(c) 4"
q5= "what kind of mindset do you have?\n(a) growth mindset \m(b) fixed mindset \(c) not set yet"

questions = [
    Question.new(q1, "c"),
    Question.new(q2, "b"),
    Question.new(q3, "c"),
    Question.new(q4, "c"),
    Question.new(q5, "a")
 ]


def run_test(questions)
    score = 0
    answer=""
    # p   questions  <- This was a test to see why the looping didn't work and to check the array is correct
    questions.each do |question| #for the actual question in the array of questions
        # p question <- Another bug check to see why looping wasn't working SPOILER I had the looping set to false
        looping = true
        while looping
            puts question.prompt
            answer = gets.chomp
            if answer == question.answer
                puts "Correct!"
                score += 1
                looping = false
            elsif answer == "quit"
            puts ("your have scored" + " " +  score.to_s + "/" + questions.length.to_s)
             exit
            elsif answer == "quit" # option to quit the quiz anytime.
            elsif answer !=  "a" and answer != "b" and answer != "c"
                puts "Invalid input. Please try again:"     
            else 
                puts "Sorry, the correct answer was #{question.answer}"
                looping = false 
            end 
        end 
    end 
    return score
end

puts "Welcome to the Quiz! type quit to exit early"
score = run_test(questions) 
puts ("your have scored" + " " +  score.to_s + "/" + questions.length.to_s)

    