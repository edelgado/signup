class Contributor < ActiveRecord::Base
  has_many :contributions, :dependent => :destroy
  has_many :items, :through => :contributions
end
