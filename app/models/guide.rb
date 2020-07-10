class Guide < ApplicationRecord
    belongs_to :agent
    belongs_to :map
    belongs_to :user
end
