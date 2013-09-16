class Comment < ActiveRecord::Base
  attr_accessible :body, :conversation_id, :id
  validates_uniqueness_of :id
  belongs_to :conversation

  validates_presence_of :body
  validates_length_of :body, :maximum=>500

end
