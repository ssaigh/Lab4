class Publisher < ApplicationRecord
    has_many :books 
    scope :alphabetical, -> { order('name') }
end
