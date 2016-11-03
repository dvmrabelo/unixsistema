class Product < ApplicationRecord
  belongs_to :size
  belongs_to :color

  validates :name, presence: true
  validates :description, presence: true
end
