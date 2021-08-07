class Shop < ApplicationRecord
  has_one :user, :as => :profileable
end
