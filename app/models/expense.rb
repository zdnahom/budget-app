class Expense < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: :author_id

    validates :name, :amount, presence: true
    validates :amount, numericality: {greater_than_or_equal_to: 0}
end