class Download < ActiveRecord::Base
  belongs_to :app
  belongs_to :person
end
