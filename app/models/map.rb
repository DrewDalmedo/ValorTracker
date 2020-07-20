class Map < ApplicationRecord
    # validations
    validates :name, presence: true, uniqueness: true

    has_many :matches
    has_many :guides
    has_many :users, through: :guides
end
