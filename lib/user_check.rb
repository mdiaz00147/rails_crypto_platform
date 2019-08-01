module UserCheck
  def self.country_api(ip)
    require 'rest_client'
    headers = {
      :accept => 'application/json'
    }
    url = 'https://api.ipdata.co/' + ip + '?api-key=dde9d5a90f31ee00b51224cdff6ec4e27533b5b1ca34ee0664048358'
    # response = RestClient.get url, headers
    return url
    # url
  end

  # check if user has two directs
  def self.user_has_two_directs_each_side?(user)
    children = user.children
    two_directs_on_tree = false if children.count < 2
    two_directs_on_tree = true if children.map { |x| x.left_son }.include?(true) && children.map { |x| x.left_son }.include?(false)

    left_direct_childs  = []
    right_direct_childs = []

    if two_directs_on_tree
      query = user.children.where(parent_uuid:user.uuid).select(:id,:left_son)
      query.map { |x| left_direct_childs <<   x if x.left_son  }
      query.map { |x| right_direct_childs <<  x if !x.left_son  }
      # s
      left_descendants  = user.children.where(left_son:true).last.descendants.select(:id,:parent_uuid).map { |x|  left_direct_childs << x if x.parent_uuid == user.uuid  }.compact
      right_descendants = user.children.where(left_son:false).last.descendants.select(:id,:parent_uuid).map { |x| right_direct_childs << x   if x.parent_uuid == user.uuid  }.compact
    end
    if left_direct_childs.count > 0 && right_direct_childs.count > 0
      user.update(active_binary: true)
      return true 
    else
      return false
    end
  end
  
  def self.user_has_two_directs?(user)
    childs = User.where(parent_uuid:user.uuid).select(:id).count
    return true if childs > 1
    false
  end

end