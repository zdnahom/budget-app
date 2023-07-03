# frozen_string_literal: true

class ExpenseCategory < ApplicationRecord
  belongs_to :expense
  belongs_to :category
end
