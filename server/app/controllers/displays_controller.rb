class DisplaysController < ApplicationController

  def index
    @displays = Display.eager_load(:manufacturer).eager_load(:resolution).paginate(:page => params[:page]).order(:id)
    response.headers['X-Total-Entries'] = @displays.total_entries.to_s
    render json: @displays.to_json(except: [:created_at, :updated_at, :resolution_id, :manufacturer_id], include: {manufacturer: {only: :title}, resolution: {only: [:width, :height]}})
  end
end
