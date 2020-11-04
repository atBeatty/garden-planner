class User < ApplicationRecord
   has_many :plants
   has_many :gardens, through: :plants
   accepts_nested_attributes_for :plants

   validates :email, uniqueness: true
   
   
end
