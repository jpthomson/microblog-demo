class Bleat < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content
  
  has_many :hash_tags
  
  before_save :build_index
  
  def build_index
    self.hash_tags.clear
    
    self.content.scan(/#[A-Za-z0-9]+/) do |tag|
      self.hash_tags.build :tag => tag
    end
  end
end
