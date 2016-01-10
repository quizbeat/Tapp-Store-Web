class Report < ActiveRecord::Base
    belongs_to :app
    belongs_to :person
    belongs_to :moderator

    before_save :default_values

    validates :reason,
              presence: true,
              length: { maximum: 40 }

    validates :description,
              presence: true,
              length: { maximum: 2000 }

    validates :app_id,
              presence: true,
              numericality: true

    validates :person_id,
              presence: true,
              numericality: true

    def default_values
        self.status ||= 'waiting'
    end

    def self.search(search)
        where("reason ILIKE ?", "%#{search}")
    end

end
