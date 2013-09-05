class Comment < ActiveRecord::Base
  attr_accessible :body, :conversation_id, :id, :user_id

  belongs_to :user
  belongs_to :conversation

  validates_presence_of :body
  validates_length_of :body, :maximum=>500

end
