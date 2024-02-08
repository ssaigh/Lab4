class Publisher < ApplicationRecord
    ruby
    has_many :books 
    scope :alphabetical, -> { order('name') }
end
