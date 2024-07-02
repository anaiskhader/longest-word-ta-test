DICTIONARY_WORDS = Set.new

dictionary_path = Rails.root.join('lib', 'data', 'dictionary.txt')

File.foreach(dictionary_path) do |word|
  DICTIONARY_WORDS.add(word.downcase)
end
