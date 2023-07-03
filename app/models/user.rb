class User < ApplicationRecord
    has_many :categories, foreign_key: :author_id, dependent: :destroy
    has_many :expense, foreign_key: :author_id, dependent: :destroy

    validates :name, presence: true
  
  end
  