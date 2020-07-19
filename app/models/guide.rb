class Guide < ApplicationRecord
    # validations
    # title must be present
    validates :title, presence: true
    # minimum guide body length
    validates :body, length: {minimum: 50}
    # should never not be present, but just in case:
    validates :map_id, presence: true

    # scope method
    scope :created_after, -> (time) { where("created_at > ?", time) }

    # relationships
    belongs_to :map
    belongs_to :user
end
