class Developer < ActiveRecord::Base

    belongs_to :person

    validates :person_id,
              presence: true,
              numericality: true
              
end
