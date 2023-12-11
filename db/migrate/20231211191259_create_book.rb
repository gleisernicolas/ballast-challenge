class CreateBook < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :author
      t.string :genre
      t.string :isbn
      t.integer :copies_amount

      t.timestamps
    end
  end
end
