# == Schema Information
#
# Table name: tools
#
#  id           :integer          not null, primary key
#  uuid         :string
#  title        :string
#  tool_type    :integer          default("url")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  resource     :string
#  lock_version :integer
#  post_file    :string
#  code         :integer
#
# Indexes
#
#  index_tools_on_code  (code) UNIQUE
#

require 'test_helper'

class ToolTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
