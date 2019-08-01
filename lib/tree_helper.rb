module TreeHelper

  def self.create_binary(node,depth,lap)
    if lap <= depth
      children  = lap == depth ? nil : node.children.order(left_son: :desc).map{|x| create_binary(x, depth ,lap + 1)}
      last_subs = SubscriptionSerializer.new(node.last_subs) if node.last_subs
      avatar = !node.last_subs && "/img/icons/user-default.svg" || node.last_subs && "/img/icons/plans/#{node.last_subs.plan.code}.svg"
      node     = {
        uuid: node.uuid,
        name: node.username,
        image_url: avatar,
        left_son: node.left_son,
        parent_binary_uuid: node.parent && node.parent.uuid,
        children: children,
        last_subs: last_subs,
        point: PointSerializer.new(node.point)
      }
    end
  end

end
