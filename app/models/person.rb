class Person < ActiveRecord::Base

    validates :first_name,
              presence: true,
              length: { maximum: 20 }

    validates :last_name,
              presence: true,
              length: { maximum: 20 }

    validates :birth_date,
              presence: true

    validates :gender,
              presence: true

    validates_format_of :gender, :with => /[male|female]/i

    validates :email,
              presence: true,
              length: { maximum: 1000 }

    validates :balance,
              numericality: { greater_than_or_equal_to: 0.0 }

end
