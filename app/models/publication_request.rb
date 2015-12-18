class PublicationRequest < ActiveRecord::Base
  belongs_to :application
  belongs_to :moderator
end
