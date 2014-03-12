require 'rspec'
require 'term'
require './lib/word_def'

describe Term do
  before do
    Term.clear
  end
  describe 'initialize' do
    it 'initializes the term with a word and definition' do
      test_term = Term.new(1)
      test_term.should be_an_instance_of Term
    end
  end

  describe '#save' do
    it'saves every instance of the Term class to the all array' do
    test_term = Term.new(1).save
    Term.all_terms.length.should eq 1
    end
  end
  describe '.create' do
    it 'creates an initialized instance of Term' do
      test_term = Term.create('koala','the original drug addicts')
      test_term.should be_an_instance_of Term
    end

    it 'creates an initialized instance of Term' do
      test_term = Term.create('koala','the original drug addicts')
      Term.all_terms.length.should eq 1
    end
  end
  describe '#remove' do
    it 'removes a term from the all_terms array' do
      test_term = Term.create('lion', 'animal that eats zebras')
      test_term.remove
      Term.all_terms.length.should eq 0
    end
  end
  describe'#set_id' do
    it 'resets the id for each term' do
      test_term = Term.create('panda', 'the animal with the most youtube hits for sneezing')
      test_term.set_id(5)
      test_term.id.should eq 5
    end
  end
  describe '#add_word' do
    it 'allows a user to edit the word associated with a definition' do
      test_term = Term.create('cow', 'the subject of the infamous game "cow tipping" in rural areas of the United States')
      test_word = Word.new('pig')
      test_term.add_word(test_word)
      test_term.words.length.should eq 2
    end
  end
  describe '#add_definition' do
    it 'allows a user to update the definition of a word' do
      test_term = Term.create('shark', 'related to Bruce the shark known to chant "fish are friends not food" in finding Nemo')
      test_definition = Definition.new("but they are so scary")
      test_term.add_definition(test_definition)
      test_term.definitions.length.should eq 2
    end
  end
  describe '.search' do
    it 'allows a user to search all the all of the terms for the desired word' do
      test_term = Term.create('lioness', 'the lions wife')
      test_term1 = Term.create('cricket', 'the animal that makes the sound that lulls you to sleep at night')
      Term.search('cricket').should eq test_term1
    end
  end
end
