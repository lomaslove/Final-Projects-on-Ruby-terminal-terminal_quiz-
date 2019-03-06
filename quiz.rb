require 'colorized_string'

class Question #class to create the questions and answers
    attr_accessor :prompt, :answer
    def initialize(prompt, answer)
        @prompt = prompt
        @answer = answer
    end 
end 

#Different questions
q1 = "What is the capital of australia?\n(a) sydney \n(b) brisbane \n(c) canberra"
q2 ="What number bus goes to spring hill?\n(a) 230 \n(b) 40 \n(c) 30"
q3 = "What level is coder academy? \n(a)2 \n(b)3 \n(c)4"
q4= "How many chamber are there in human heart?\n(a) 1 \n(b) 2 \n(c) 4"
q5= "What kind of mindset do you have?\n(a) growth mindset \n(b) fixed mindset \n(c) not set yet"
#store the questions as new instances of the class with the prompt and answer
questions = [
    Question.new(q1, "c"),
    Question.new(q2, "b"),
    Question.new(q3, "c"),
    Question.new(q4, "c"),
    Question.new(q5, "a")
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
                puts ColorizedString["Invalid input. Please try again:"].colorize(:orange)     
            else 
                system"clear"
                puts ColorizedString["Sorry, the correct answer was (#{question.answer.upcase})"].colorize(:cyan) #if they get the answer wrong they don't get to retry
                looping = false 
            end 
        end 
    end 
    return score #returns the score so that the final score can be displayed outside of the method
end



#the actual program
puts ColorizedString["Welcome to the Quiz! type quit to exit early"].colorize(:magenta).blink
score = run_test(questions) #because the method returns the score you can set it via running the method

#end scoring 
if score == 0 
    puts ColorizedString["Better luck next time! You scored #{score}/#{questions.length}."].colorize(:yellow)
elsif score <= 3
    puts ColorizedString["Good effort! You scored #{score}/#{questions.length}"].colorize(:light_green)
else 
    puts ColorizedString["Congratulations! You scored #{score}/#{questions.length}"].colorize(:green)
end





















 