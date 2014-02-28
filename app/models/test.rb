class Test < ActiveRecord::Base
  attr_accessible :check, :group, :cost, :popularity
  belongs_to :groups

  COSTS = [2,3]
end
