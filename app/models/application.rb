class Application < ActiveRecord::Base
  belongs_to :category
  belongs_to :developer
end
