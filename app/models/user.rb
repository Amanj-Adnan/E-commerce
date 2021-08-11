class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :profileable, :polymorphic => true
  accepts_nested_attributes_for :profileable

  def build_profileable(params)
    self.profileable = profileable_type.constantize.new(params)
  end

  delegate_missing_to :@profileable

end
