class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :sentences, dependent: :destroy
  has_many :other_sentences, dependent: :destroy

  enum :role, { user: 0, admin: 1 }

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :nikname, presence: true, uniqueness: true
end
