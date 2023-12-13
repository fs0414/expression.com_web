class AddUserIdToOtherSentences < ActiveRecord::Migration[7.0]
  def change
    add_reference :other_sentences, :user, foreign_key: true
  end
end
