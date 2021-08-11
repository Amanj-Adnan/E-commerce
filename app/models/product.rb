class Product < ApplicationRecord
  include ImageUploader.attachment(:image)
  belongs_to :shop
end
