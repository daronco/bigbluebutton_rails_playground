class Profile < ActiveRecord::Base
  belongs_to :user

  attr_accessible :organization, :address, :phone, :city, :country, :about
end
