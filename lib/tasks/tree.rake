namespace :tree do
  desc "Check issues on binary tree"
  task :check_binary_nodes => :environment do
    right_nodes  = User.all.map{|x|x if x.children.where(left_son:false).count > 1 }.compact
    left_nodes   = User.all.map{|x|x if x.children.where(left_son:true).count > 1 }.compact
    double_nodes = User.all.map{|x|x if x.children.count > 2 }.compact
    EmailNotification.system_alert(right_nodes,  "Admin a right node has failed") if right_nodes.count > 0
    EmailNotification.system_alert(left_nodes,   "Admin a left node has failed") if left_nodes.count > 0
    EmailNotification.system_alert(double_nodes, "Admin a node has more than 2 children") if double_nodes.count > 0
  end

  desc "Fix duplicated nodes on the temp table"
  task :fix_duplicated_temp_users => :environment do
    User.all.map{|x| TempUser.find_by(username:x.username).soft_delete if TempUser.exists?(username:x.username) }.compact
  end
end
