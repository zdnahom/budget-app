class AddUserRefToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_reference :expenses, :author, null: false, foreign_key: {to_table: :users, on_delete: :cascade}
  end
end
