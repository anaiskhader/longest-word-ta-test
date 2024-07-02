class Game < ApplicationRecord
  belongs_to :user
  has_many :parties, class_name: 'Partie', dependent: :destroy
end
