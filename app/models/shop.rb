class Shop < ApplicationRecord
  has_one :user, :as => :profileable , dependent: :destroy
  accepts_nested_attributes_for :user

  has_many :products , dependent: :destroy
end
