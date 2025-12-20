class AddUniqueIndexToCustomersEmail < ActiveRecord::Migration[7.2]
  def change
    add_index :customers, :email, unique: true, where: "email IS NOT NULL"
  end
end
