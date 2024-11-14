class Payment < ApplicationRecord
  belongs_to :cashier_id
  belongs_to :sale
end
