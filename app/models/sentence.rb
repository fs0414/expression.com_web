class Sentence < ApplicationRecord
  belongs_to :user
  has_many :other_sentences, dependent: :destroy
end
