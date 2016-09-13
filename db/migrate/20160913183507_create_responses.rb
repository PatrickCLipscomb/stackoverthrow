class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.string :author
      t.string :content
      t.integer :votes

      t.timestamps
    end
  end
end
