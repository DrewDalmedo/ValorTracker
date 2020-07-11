class User < ApplicationRecord
    # allows users to create an account without a password (used for omniauth),
    # create a custom validation later for local accounts!!
    has_secure_password :validations => false
    
    has_many :matches
    has_many :guides
    has_many :agents, through: :matches
    has_many :maps, through: :matches
end
