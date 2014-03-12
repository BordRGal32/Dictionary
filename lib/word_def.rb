class WordDef
  attr_reader :value
  def initialize(value, language)
    @value = value
    @language = language
  end
end

class Word < WordDef

end

class Definition < WordDef

end
