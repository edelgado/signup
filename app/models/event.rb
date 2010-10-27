class Event < ActiveRecord::Base
  belongs_to :organizer
  has_many :items, :dependent => :destroy
  has_many :contributions, :through => :items
  
  accepts_nested_attributes_for :items, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  
  def generate_key
    o =  [('a'..'z'),(0..9)].map{|i| i.to_a}.flatten;  
    (0..4).map{ o[rand(o.length)]  }.join;
  end
  
  def before_create
    self.key = generate_key
  end
  
end
