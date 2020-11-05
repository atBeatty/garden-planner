class Plant < ApplicationRecord
    belongs_to :user
    belongs_to :garden, optional: true

    validates :name, presence: true
    validates :species, presence: true
    

     
end
