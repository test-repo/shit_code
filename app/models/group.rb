class Group < ActiveRecord::Base
  attr_accessible :group
  has_many :tests
end
