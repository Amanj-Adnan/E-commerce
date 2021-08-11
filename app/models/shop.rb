class Shop < ApplicationRecord
  has_one :user, :as => :profileable
  accepts_nested_attributes_for :user

  has_many :products
end
