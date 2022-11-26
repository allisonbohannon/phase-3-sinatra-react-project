class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.boolean :read_status
      t.integer :author_id
      t.integer :genre_id
    end
  end
end
