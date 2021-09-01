class Product < ApplicationRecord
  include ImageUploader.attachment(:image)
  belongs_to :shop  , dependent: :destroy
end
