class Guide < ApplicationRecord
    # validations
    # title must be present
    validates :title, presence: true
    # minimum guide body length
    validates :body, length: {minimum: 50}
    # should never not be present, but just in case:
    validates :map_id, presence: true

    belongs_to :map
    belongs_to :user
end
