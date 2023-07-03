# frozen_string_literal: true

class CreateExpenseCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_categories, &:timestamps
  end
end
