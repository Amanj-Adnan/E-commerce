class Costumer < ApplicationRecord
  has_one :user, :as => :profileable , dependent: :destroy
  accepts_nested_attributes_for :user
end
