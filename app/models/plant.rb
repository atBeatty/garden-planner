class Plant < ApplicationRecord
    belongs_to :user
    belongs_to :garden, optional: true
    accepts_nested_attributes_for :garden

    # validates :name, presence: true
    # validates :species, presence: true


     
end
