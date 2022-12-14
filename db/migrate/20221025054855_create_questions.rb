class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.string :name
      t.string :video
      t.string :youtube_url
      t.references :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
