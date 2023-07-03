class AddExpenseRefToExpenseCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :expense_categories, :expense, null: false, foreign_key: {on_delete: :cascade}
  end
end
