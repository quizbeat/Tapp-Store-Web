class Application < ActiveRecord::Base

    belongs_to :category
    belongs_to :developer

    validates :app_name,
              presence: true,
              length: { maximum: 20 }

    validates :description,
              presence: true,
              length: { maximum: 10000 }

    validates :category_id,
              presence: true,
              numericality: true

    validates :price,
              presence: true,
              numericality: { greater_than_or_equal_to: 0.0 }

    validates :app_version,
              presence: true,
              numericality: { greater_than_or_equal_to: 0.0 }

    validates :app_size,
              presence: true,
              numericality: { greater_than_or_equal_to: 0.01 }

    validates :status,
              presence: true,
              length: { maximum: 20 }

    validates :developer_id,
              presence: true,
              numericality: true

end
