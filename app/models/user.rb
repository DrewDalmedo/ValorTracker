class User < ApplicationRecord
    has_secure_password
    has_many :matches
    has_many :guides
    has_many :agents, through: :matches
    has_many :maps, through: :matches
end
