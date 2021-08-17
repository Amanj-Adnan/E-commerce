class ProductPolicy < ApplicationPolicy

    def new?
      @user.profileable_type == "Shop"
    end

end
