class Map < ApplicationRecord
    has_many :matches
    has_many :guides
    has_many :users, through: :guides
end
