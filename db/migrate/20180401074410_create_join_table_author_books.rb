class CreateJoinTableAuthorBooks < ActiveRecord::Migration[5.1]
  def change
    create_join_table :authors, :books do |t|
      t.index [:author_id, :book_id]
    end
  end
end
