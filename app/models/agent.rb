class Agent < ApplicationRecord
    has_many :matches
    has_many :guides
end
