require './lib/term'

@current_term

def main_menu
  puts "press n if you want to add a new term to your fantastic animal dictionary"
  puts "press l to list the animals in your fantastic animal dictionary"
  puts "press s to search for an animal"
  puts "press x to exit this fantastic dictionary"
  main_choice = gets.chomp
  case main_choice
  when 'n'
    add_term
  when 'l'
    list_terms
  when 's'
    search_terms
  when 'x'
    puts "You have terminated the dictionary."
    exit
  else
    "that was not a valid choice"
    main_menu
  end
end

def add_term
  puts "please enter the animal you want to define"
  current_animal = gets.chomp
  puts "please enter the definition you want to add"
  current_definition = gets.chomp
  current_term = Term.create(current_animal, current_definition)
  puts "the definition for #{current_animal} was succesfully created"
  main_menu
end

def list_terms
  Term.all_terms.each do |term|
    puts "#{term.id}. #{words[0].value} - #{term.definitions[0].value}"
  end
  edit_menu
end

def edit_menu
  puts "Enter the id of a term to edit it"
  puts "Press 'm' to return to the main menu"

  user_choice = gets.chomp

  if user_choice == 'm'
    main_menu
  elsif !user_choice.match(/\d/).nil?
    @current_term = Term.all_terms[user_choice.to_i - 1]
    edit_term
  else
    puts "That choice was not valid. Idiot."
    edit_menu
  end
end

def edit_term
  puts "press r to remove the term"
  puts "press w to list all of the words associated with the term"
  puts "press d to list all of the definitions associated with the term"
  puts "press m to return to the main menu"

  edit_term_choice = gets.chomp

  case edit_term_choice
  when 'r'
    @current_term.remove
  when 'w'
    list_words
  when 'd'
    list_definitions
  when 'm'
    main_menu
  else
    puts "that was not a valid input...please learn how to read and think"
    edit_term
  end
end

def list_words
  @current_term.words.each_with_index do |word, index|
    puts "#{index +1}. #{word.value}"
  end
end

def list_definitions
  @current_term.definitions.each_with_index do |definition, index|
    puts "#{index +1}. #{definition.value}"
  end
end

def search_terms(word)
  puts "enter the word that you want to search"
  desired_word = gets.chomp
  desired_term = Terms.search(desired_word)
  @current_term = desired_term
  list_words
  list_definitions
  puts "Press s to search for another word"
  puts "Press m to return to the main menu"

  user_choice = gets.chomp

  case user_choice
  when 's'
    puts "Enter a word to search for"
    word_choice = gets.chomp
    search_terms(word_choice)
  when 'm'
    main_menu
  else
    "You are a dumbass"
    search_terms(word)
  end
end
main_menu
