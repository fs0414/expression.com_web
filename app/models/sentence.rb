class Sentence < ApplicationRecord
  belongs_to :user
  has_many :other_sentences, dependent: :destroy

  validates :content, presence: true
end
