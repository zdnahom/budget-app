# frozen_string_literal: true

class AddCategoryRefToExpenseCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :expense_categories, :category, null: false, foreign_key: { on_delete: :cascade }
  end
end
