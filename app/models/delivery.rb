class Delivery < ApplicationRecord
  belongs_to :motorized
  belongs_to :clerk
end
