require './lib/term'
require './lib/word_def'

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
  puts "enter the language of the term you want to add"
  language = gets.chomp
  puts "please enter the animal you want to define"
  current_animal = gets.chomp
  puts "please enter the definition you want to add"
  current_definition = gets.chomp
  current_term = Term.create(current_animal, current_definition, language)
  puts "the definition for #{current_animal} was succesfully created"
  main_menu
end

def list_terms
  Term.all_terms.each do |term|
    puts "#{term.id}. #{term.words[0].value} - #{term.definitions[0].value}"
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
    idiot_menu
  end
end

def edit_term
  puts "press r to remove the term"
  puts "press w to list all of the words associated with the term: here you can remove, edit, or ....ADDDDD a term"
  puts "press d to list all of the definitions associated with the term: here! you can remove, edit or add a definition:-)"
  puts "press m to return to the main menu"

  edit_term_choice = gets.chomp

  case edit_term_choice
  when 'r'
    @current_term.remove
  when 'w'
    edit_words
  when 'd'
    edit_definitions
  when 'm'
    main_menu
  else
    puts "that was not a valid input...please learn how to read and think"
    edit_term
  end
end

def list_words
  @current_term.words.each_with_index do |word, index|
    puts "#{index +1}. #{word.value} #{word.language}"
  end
end

def list_definitions
  @current_term.definitions.each_with_index do |definition, index|
    puts "#{index +1}. #{definition.value} #{definition.language}"
  end
end

def search_terms
  puts "enter the word that you want to search"
  desired_word = gets.chomp
  desired_term = Term.search(desired_word)
  p desired_term
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

def edit_words
  list_words
  puts "Enter the number of a word to change or remove it"
  puts "Press m to go back to the main menu"
  puts "press a to add a new word associated with the current definition"

  user_choice = gets.chomp

  if user_choice == 'm'
    main_menu
  elsif user_choice == 'a'
    puts "what language is the word you want to add in?"
    language = gets.chomp
    puts "please enter the word that you want to add"
    new_word = gets.chomp
    @current_term.add_word(new_word, language)
  elsif !user_choice.match(/\d/).nil?
    puts "Press r to remove the word from the term"
    puts "Enter an updated word to change word"

    edit_choice = gets.chomp

    case edit_choice
    when 'r'
      @current_term.remove_word(user_choice.to_i - 1)
    else
      @current_term.remove_word(user_choice.to_i - 1)
      @current_term.add_word(edit_choice)
    end
  else
    "Seriously? You haven't gotten this yet??"
    edit_words
  end
  main_menu
end

def edit_definitions
  list_definitions
  puts "Enter the number of a definition to change or remove it"
  puts "Press m to go back to the main menu"
  puts "Press a to add a new definition to a term"

  user_choice = gets.chomp

  if user_choice == 'm'
    main_menu
  elsif user_choice == 'a'
    puts "please enter the language of the definition"
    language = gets.chomp
    puts "pleae enter the new definition you want added to the term"
    new_definition = gets.chomp
    @current_term.add_definition(new_definition, language)
  elsif !user_choice.match(/\d/).nil?
    puts "Press r to remove the definition from the term"
    puts "Enter an updated definition to change definition"
    edit_choice = gets.chomp
    case edit_choice
    when 'r'
      @current_term.remove_definition(user_choice.to_i - 1)
    else
      @current_term.remove_definition(user_choice.to_i - 1)
      @current_term.add_definition(edit_choice)
    end
  else
    "Seriously? You haven't gotten this yet??"
    edit_definitions
  end
  main_menu
end

def idiot_menu
puts"holy crap why do you keep getting this wrong"
puts "press a if you want your punishment in lashes"
puts "press b if you would prefer chinese water torutre"
puts "press c if old fasion flogging is your style"
idiot_choice = gets.chomp
case idiot_choice
  when 'a'
    puts "you are still an idiot"
    edit_menu
  when 'b'
    puts "your are an even larger idiot...who wants chinese water torutre"
    edit_menu
  when 'c'
    puts "flogging is the worst choice, have you watched game of thrones?"
    edit_menu
  end
end
main_menu
