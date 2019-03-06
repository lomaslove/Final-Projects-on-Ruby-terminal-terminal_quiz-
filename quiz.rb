
require 'colorized_string'

class Question #class to create the questions and answers
    attr_accessor :prompt, :answer
    def initialize(prompt, answer)
        @prompt = prompt
        @answer = answer
    end 
end 

#Different questions
q1 = "What is the capital of australia?\n (a) Sydney \n (b) Brisbane \n (c) Canberra"
q2 = "What is the number of the bus that goes to Spring Hill?\n (a) 230 \n (b) 40 \n (c) 30"
q3 = "What floor level is Coder Academy? \n (a) 2 \n (b) 3 \n (c) 4"
q4 = "How many chamber are there in human heart?\n (a) 1 \n (b) 2 \n (c) 4"
q5 = "What kind of mindset do you have?\n (a) growth mindset \n (b) fixed mindset \n (c) not set yet"
q6 = "Variables that start with the @ symbol are what type of variables? \n (a) Global \n (b) Instance \n (c) Class"
q7 = "In \"Shrek\", which actor voices Donkey? \n (a) Christopher Walken \n (b) Eddie Murphy \n (c) Chris Rock "
q8 = "In a standard deck of cards, which king is the only one to not have a moustache? \n (a) Hearts \n (b) Clubs \n (c) Diamonds"
q9 = "Who wrote the award winning song \"Who let the dogs out?\" \n (a) Bloodhound gang \n (b) Baha Men \n (c) Miley Cyrus"
q10 = "On the fake shopping website we used to find bugs by Trish Khoo, where was the shop based? \n (a) Dubai, SAE \n (b) Sydney, Australia \n (c) Kathmandu, Nepal"
#store the questions as new instances of the class with the prompt and answer
questions = [
    Question.new(q1, "c"),
    Question.new(q2, "b"),actor
    Question.new(q3, "c"),
    Question.new(q4, "c"),
    Question.new(q5, "a"),
    Question.new(q6, "b"),
    Question.new(q7, "b"),
    Question.new(q8, "a"),
    Question.new(q9, "b"),
    Question.new(q10, "c")
]


def run_test(questions) #method to run the test
    score = 0 #set the initial score to 0
    #p   questions         <- This was a test to see why the looping didn't work and to check the array is correct
    questions.each do |question| #for the actual question in the array of questions
        # p question  <- Another bug check to see why looping wasn't working SPOILER I had the looping set to false
        looping = true  #loop condition
        while looping
            puts question.prompt #puts the question
            answer = gets.chomp.downcase #gets an answer from the quizee
            if answer == question.answer #takes the answer and compares it - then adds one to the score
                system"clear"
                puts ColorizedString["Correct!"].colorize(:green)
                score += 1
                looping = false #ends the loop
            elsif answer == "quit" #allows the user to quit early
            puts ("You have scored" + " " +  score.to_s + "/" + questions.length.to_s)
            puts ColorizedString["Thank you for trying our quiz!"].colorize(:yellow) #gives the final score 
             exit
            elsif answer !=  "a" and answer != "b" and answer != "c"
                #if the answer isn't one of the options let them retry
                system"clear"
                puts ColorizedString["Invalid input. Please try again:"].colorize(:cyan)     
            else 
                system"clear"
                puts ColorizedString["Sorry, the correct answer was (#{question.answer})"].colorize(:red) #if they get the answer wrong they don't get to retry
                looping = false 
            end 
        end 
    end 
    return score #returns the score so that the final score can be displayed outside of the method
end



#the actual program
puts ColorizedString["Welcome to the Quiz!"].colorize(:magenta).blink + ColorizedString["  Type \"quit\" to exit early"].colorize(:light_blue)
score = run_test(questions) #because the method returns the score you can set it via running the method

#end scoring 
if score == 0 
    puts ColorizedString["Better luck next time! You scored #{score}/#{questions.length}."].colorize(:yellow)
elsif score <= 3
    puts ColorizedString["Good effort! You scored #{score}/#{questions.length}"].colorize(:light_green)
else 
    puts ColorizedString["Congratulations! You scored #{score}/#{questions.length}"].colorize(:green)
end




