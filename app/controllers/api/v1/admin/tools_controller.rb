class Api::V1::Admin::ToolsController < Api::V1::Admin::AdminsController

  def index
    result = Tool.all.order(created_at: :desc)
    render json: result, staut:200
  end

  def create
    tool = Tool.new(tool_params)
    aws_file_handler(tool)
    if tool.save
      render json: tool, status: :ok
    else
      render json: tool.errors.map { |x, mess| "#{x} #{mess}".capitalize }, status: :unprocessable_entity
    end
  end

  def show
    tool = Tool.find_by(uuid: params[:id])
    render json: tool, status: :ok
  end

  def update
    tool = Tool.find_by(uuid: params[:id])
    tool.assign_attributes(tool_params)
    aws_file_handler(tool)

    if tool.save
      render json: tool, status: :ok
    else
      render json: tool.errors.map { |x, mess| "#{x} #{mess}".capitalize }, status: :unprocessable_entity
    end
  end

  def destroy
    tool = Tool.find_by(uuid: params[:id])
    render json: { m: 'Destroyed' }, status: 200 if tool.destroy
  end

  private

  def aws_file_handler(tool)
    return if params[:file].blank?
    key_file = "tools/#{tool.id}/#{params[:file].original_filename}"
    S3_BUCKET.object(key_file).put(body: params[:file].tempfile)
    if tool.post?
      tool.post_file = key_file
    else
      tool.resource = key_file
    end
  end

  def tool_params
    params.permit(
      :uuid,
      :title,
      :tool_type,
      :resource,
      :code
    )
  end
end