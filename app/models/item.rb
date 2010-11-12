class Item < ActiveRecord::Base
  belongs_to :event
  has_many :contributions, :dependent => :destroy
  has_many :contributors, :through => :contributions
  
  def remaining_count
    count = 0
    qty = self.quantity || 0
    self.contributions.each do |c|
      count += c.quantity
    end
    qty - count
  end
  
  def contribution_count
    count = 0
    self.contributions.each do |c|
      count += c.quantity
    end
    count
  end
end
