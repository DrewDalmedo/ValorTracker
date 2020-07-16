class User < ApplicationRecord
    # allows users to create an account without a password (used for omniauth),
    # create a custom validation later for local accounts!!
    has_secure_password :validations => false
    # switch to regular has_secure_password once omniauth stuff is sorted out
    #has_secure_password


    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    has_many :matches
    has_many :guides
    has_many :maps, through: :matches
end
