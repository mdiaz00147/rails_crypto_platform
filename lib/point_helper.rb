include ActionView::Helpers::DateHelper
module PointHelper

  def self.filter(object)
    object_tmp = object
    object     = object.attributes.except('id')
    object['next_reset'] = object_tmp.balanced_at ? (distance_of_time_in_words((Time.now), (object_tmp.balanced_at + 2.month))) : (distance_of_time_in_words((Time.now), (object_tmp.created_at + 2.month)))
    return object
  end

end
