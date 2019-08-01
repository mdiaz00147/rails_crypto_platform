class Api::V1::Client::TreesController < Api::V1::Client::ClientsController

  # show current user tree
  def show
    user = @current_user
    user = User.find_by(uuid: params[:uuid]) if params[:uuid]
    user = User.find_by(username: params[:username]) if params[:username]
    if user
      # tree_array(user)
      render json: TreeHelper.create_binary(user, 2, 0), status: :ok
    else
      render json: { error: 'Invalid user' }, status: :unauthorized
    end
  end

  # show user selected above on the tree
  def show_parent_user_subtree
    temp_user = User.find_by(uuid: params[:uuid])
    temp_user = temp_user.parent if temp_user != @current_user
    user = temp_user.subtree(:to_depth => 2).arrange_serializable[0]
    if user
      tree_array(user)
      render json: {uuid: temp_user.uuid, tree_array: tree_array(user)}, status: :ok
    else
      render json: { error: 'Invalid user' }, status: :unauthorized
    end
  end

  # search user node on the user tree
  def show_search_user_subtree
    temp_user = User.find_by(username: params[:username])
    user = @current_user.subtree(:to_depth => 2).arrange_serializable[0]
    user = temp_user.subtree(:to_depth => 2).arrange_serializable[0] if @current_user.subtree.include?(temp_user)
    if user
      tree_array(user)
      render json: {uuid: user["uuid"], tree_array: tree_array(user)}, status: :ok
    else
      render json: { error: 'Invalid user' }, status: :unauthorized
    end
  end

  private
    def tree_array(user)
      array = []
      array.push(user["username"], user["uuid"])
      if user["children"][0].nil?
        array.push("No User", "No User", "No User", "No User", "No User", "No User", "No User", "No User", "No User", "No User", "No User", "No User")
      else
        if user["children"][0]["left_son"]
          if user["children"][1].nil?
            array.push(user["children"][0]["username"], user["children"][0]["uuid"], "No User", "No User")
            if user["children"][0]["children"][0].nil?
              array.push("No User", "No User", "No User", "No User", "No User", "No User", "No User", "No User")
            else
              if user["children"][0]["children"][0]["left_son"]
                if user["children"][0]["children"][1].nil?
                  array.push(user["children"][0]["children"][0]["username"], user["children"][0]["children"][0]["uuid"], "No User", "No User", "No User", "No User", "No User", "No User")
                else
                  array.push(user["children"][0]["children"][0]["username"], user["children"][0]["children"][0]["uuid"], user["children"][0]["children"][1]["username"], user["children"][0]["children"][1]["uuid"], "No User", "No User", "No User", "No User")
                end
              else
                if user["children"][0]["children"][1].nil?
                  array.push("No User", "No User", user["children"][0]["children"][0]["username"], user["children"][0]["children"][0]["uuid"], "No User", "No User", "No User", "No User")
                else
                  array.push(user["children"][0]["children"][1]["username"], user["children"][0]["children"][1]["uuid"], user["children"][0]["children"][0]["username"], user["children"][0]["children"][0]["uuid"], "No User", "No User", "No User", "No User")
                end
              end
            end
          else
            array.push(user["children"][0]["username"], user["children"][0]["uuid"], user["children"][1]["username"], user["children"][1]["uuid"])
            if user["children"][0]["children"][0].nil?
              array.push("No User", "No User", "No User", "No User")
            else
              if user["children"][0]["children"][0]["left_son"]
                if user["children"][0]["children"][1].nil?
                  array.push(user["children"][0]["children"][0]["username"], user["children"][0]["children"][0]["uuid"], "No User", "No User")
                else
                  array.push(user["children"][0]["children"][0]["username"], user["children"][0]["children"][0]["uuid"], user["children"][0]["children"][1]["username"], user["children"][0]["children"][1]["uuid"])
                end
              else
                if user["children"][0]["children"][1].nil?
                  array.push("No User", "No User", user["children"][0]["children"][0]["username"], user["children"][0]["children"][0]["uuid"])
                else
                  array.push(user["children"][0]["children"][1]["username"], user["children"][0]["children"][1]["uuid"], user["children"][0]["children"][0]["username"], user["children"][0]["children"][0]["uuid"])
                end
              end
            end
            if user["children"][1]["children"][0].nil?
              array.push("No User", "No User", "No User", "No User")
            else
              if user["children"][1]["children"][0]["left_son"]
                if user["children"][1]["children"][1].nil?
                  array.push(user["children"][1]["children"][0]["username"], user["children"][1]["children"][0]["uuid"], "No User", "No User")
                else
                  array.push(user["children"][1]["children"][0]["username"], user["children"][1]["children"][0]["uuid"], user["children"][1]["children"][1]["username"], user["children"][1]["children"][1]["uuid"])
                end
              else
                if user["children"][1]["children"][1].nil?
                  array.push("No User", "No User", user["children"][1]["children"][0]["username"], user["children"][1]["children"][0]["uuid"])
                else
                  array.push(user["children"][1]["children"][1]["username"], user["children"][1]["children"][1]["uuid"], user["children"][1]["children"][0]["username"], user["children"][1]["children"][0]["uuid"])
                end
              end
            end
          end
        else
          if user["children"][1].nil?
            array.push("No User", "No User", user["children"][0]["username"], user["children"][0]["uuid"])
            if user["children"][0]["children"][0].nil?
              array.push("No User", "No User", "No User", "No User", "No User", "No User", "No User", "No User")
            else
              if user["children"][0]["children"][0]["left_son"]
                if user["children"][0]["children"][1].nil?
                  array.push("No User", "No User", "No User", "No User", user["children"][0]["children"][0]["username"], user["children"][0]["children"][0]["uuid"], "No User", "No User")
                else
                  array.push("No User", "No User", "No User", "No User", user["children"][0]["children"][0]["username"], user["children"][0]["children"][0]["uuid"], user["children"][0]["children"][1]["username"], user["children"][0]["children"][1]["uuid"])
                end
              else
                if user["children"][0]["children"][1].nil?
                  array.push("No User", "No User", "No User", "No User", "No User", "No User", user["children"][0]["children"][0]["username"], user["children"][0]["children"][0]["uuid"])
                else
                  array.push("No User", "No User", "No User", "No User", user["children"][0]["children"][1]["username"], user["children"][0]["children"][1]["uuid"], user["children"][0]["children"][0]["username"], user["children"][0]["children"][0]["uuid"])
                end
              end
            end
          else
            array.push(user["children"][1]["username"], user["children"][1]["uuid"], user["children"][0]["username"], user["children"][0]["uuid"])
            if user["children"][1]["children"][0].nil?
              array.push("No User", "No User", "No User", "No User")
            else
              if user["children"][1]["children"][0]["left_son"]
                if user["children"][1]["children"][1].nil?
                  array.push(user["children"][1]["children"][0]["username"], user["children"][1]["children"][0]["uuid"], "No User", "No User")
                else
                  array.push(user["children"][1]["children"][0]["username"], user["children"][1]["children"][0]["uuid"], user["children"][1]["children"][1]["username"], user["children"][1]["children"][1]["uuid"])
                end
              else
                if user["children"][1]["children"][1].nil?
                  array.push("No User", "No User", user["children"][1]["children"][0]["username"], user["children"][1]["children"][0]["uuid"])
                else
                  array.push(user["children"][1]["children"][1]["username"], user["children"][1]["children"][1]["uuid"], user["children"][1]["children"][0]["username"], user["children"][1]["children"][0]["uuid"])
                end
              end
            end
            if user["children"][0]["children"][0].nil?
              array.push("No User", "No User", "No User", "No User")
            else
              if user["children"][0]["children"][0]["left_son"]
                if user["children"][0]["children"][1].nil?
                  array.push(user["children"][0]["children"][0]["username"], user["children"][0]["children"][0]["uuid"], "No User", "No User")
                else
                  array.push(user["children"][0]["children"][0]["username"], user["children"][0]["children"][0]["uuid"], user["children"][0]["children"][1]["username"], user["children"][0]["children"][1]["uuid"])
                end
              else
                if user["children"][0]["children"][1].nil?
                  array.push("No User", "No User", user["children"][0]["children"][0]["username"], user["children"][0]["children"][0]["uuid"])
                else
                  array.push(user["children"][0]["children"][1]["username"], user["children"][0]["children"][1]["uuid"], user["children"][0]["children"][0]["username"], user["children"][0]["children"][0]["uuid"])
                end
              end
            end
          end
        end
      end
    end
end
