class Category < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: :author_id

    validates :name, :icon, presence: true
    # validates :icon, format: { with: /\.(png|jpg|jpeg|gif)\z/i, message: 'must be a valid image URL' }
end