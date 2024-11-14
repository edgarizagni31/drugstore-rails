class SalesDetail < ApplicationRecord
  belongs_to :sample
  belongs_to :sale
end
