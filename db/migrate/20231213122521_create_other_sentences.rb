class CreateOtherSentences < ActiveRecord::Migration[7.0]
  def change
    create_table :other_sentences do |t|
      t.string :content, null: false
      t.references :sentence, foreign_key: true

      t.timestamps
    end
  end
end
