# == Schema Information
#
# Table name: points
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  left_points        :integer          default(0)
#  right_points       :integer          default(0)
#  diff               :integer          default(0)
#  left_total_points  :integer          default(0)
#  right_total_points :integer          default(0)
#  lock_version       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_points_on_user_id  (user_id) UNIQUE
#

class Point < ApplicationRecord
  belongs_to :user, required: false


end
