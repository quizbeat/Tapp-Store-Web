class Report < ActiveRecord::Base
  belongs_to :app
  belongs_to :person
  belongs_to :moderator
end
