class Book < ApplicationRecord
  belongs_to :publisher                     
  has_many :book_authors
  has_many :authors, through: :book_authors 

  scope :alphabetical, ->{order('title')}

    scope :last_decade, ->{where('year_published>?', 2011)}



end
