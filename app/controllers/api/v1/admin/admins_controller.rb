class Api::V1::Admin::AdminsController  < ApplicationController
  before_action :authenticate_request!
  before_action :admin_user
  
end
