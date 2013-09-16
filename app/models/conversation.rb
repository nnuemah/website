class Conversation < ActiveRecord::Base
  attr_accessible :content, :id, :title
  validates_uniqueness_of :id
  has_many :comments, :dependent => :delete_all

  validates_presence_of :title
  validates_presence_of :content
  validates_length_of :title, :maximum=>50
  validates_length_of :content, :maximum=>500

end
