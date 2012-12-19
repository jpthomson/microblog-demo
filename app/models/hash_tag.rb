class HashTag < ActiveRecord::Base
  belongs_to :bleat
  attr_accessible :tag
  
  def self.trending(limit = 5)
    trending = HashTag.count :group => :tag,
      :order => 'count(*) desc',
      :limit => limit
      
    trending.keys
  end
end
