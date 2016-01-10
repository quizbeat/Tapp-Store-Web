class Category < ActiveRecord::Base

    validates :category_name,
              presence: true,
              length: { maximum: 40 }

    validates :description,
              presence: true,
              length: { maximum: 200 }
              
end
