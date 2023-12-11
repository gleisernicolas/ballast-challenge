class CrateLoan < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :due_at, null: false
      t.datetime :returned_at
      t.datetime :checked_out_at, null: false

      t.timestamps
    end
  end
end
