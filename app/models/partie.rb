class Partie < ApplicationRecord
  before_create :initialize_ten_letters_list

  belongs_to :game
  has_many :solutions, dependent: :destroy

  # validates :word, presence: true
  # validates :word_in_dictionary
  # validates :word_is_valid

  def initialize_ten_letters_list
    self.ten_letters_list = generate_ten_letter_list.join(',')
  end

  def generate_ten_letter_list
    ten_letters_list = Array.new(5) { ['a', 'e', 'i', 'o', 'u'].sample } + Array.new(5) { %w[b c d f g h j k l m n p q r s t v w x y z].sample }
  end

  private

  def word_in_dictionary
    unless DICTIONARY_WORDS.include?(word.downcase)
      errors.add(:word, 'is not a valid word')
    end
  end

  def word_is_valid
    word.chars.each do |letter|
      unless ten_letters_list.include?(letter)
        errors.add(:word, 'contains invalid letters')
      end
    end
  end
end
