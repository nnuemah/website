require 'test_helper'
require 'test/unit'

class ConversationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def new_comment
    @conversation = Conversation.new(:id => 1, :title => "First Post", :content => "I have a  question.")
    assert_equal(1, @conversation.id)
  end
end
