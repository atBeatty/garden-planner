class Plant < ApplicationRecord
    belongs_to :user
    belongs_to :garden, optional: true

     
end
