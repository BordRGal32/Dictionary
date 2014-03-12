# require 'word_def'

class Term
  @@all_terms = []
  attr_reader :words, :definitions, :id

  def initialize(id)
    @words = []
    @definitions = []
    @id = id
  end

  def Term.all_terms
    @@all_terms
  end

  def Term.search(word)
    desired_term = ""
    @@all_terms.each do |term|
      term.words.each do |current_word|
        if current_word.value == word
          desired_term = term
        end
      end
    end
    desired_term
  end

  def save
    @@all_terms << self
  end

  def Term.create(word, definition, language='English')
    term = Term.new(@@all_terms.length + 1)
    term.words << Word.new(word, language)
    term.definitions << Definition.new(definition, language)
    term.save
    term
  end

  def Term.clear
    @@all_terms = []
  end

  def set_id(id)
    @id = id
  end

  def add_word(new_word, language)
    @words << Word.new(new_word, language)
  end

  def add_definition(new_definition, language)
    @definitions << Definition.new(new_definition, language)
  end

  def remove_word(index)
    @words.delete_at(index)
  end

  def remove_definition(index)
    @definitions.delete_at(index)
  end

  def remove
    @@all_terms.delete_at(@id - 1)
    @@all_terms.each_with_index do |term, index|
      term.set_id(index + 1)
    end
  end
end


