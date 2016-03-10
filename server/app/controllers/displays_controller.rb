class DisplaysController < ApplicationController

  def index
    offset = params[:offset].to_i
    limit = params[:limit].to_i.nonzero? ? params[:limit].to_i : Display::DEFAULT_PER_PAGE

    @displays = Display.eager_load(:manufacturer).eager_load(:resolution).offset(offset).limit(limit).order(:id)
    total_count = Display.count

    render json: {
        success: true,
        errors: [],
        meta: {
            pagination: {
                per_page: limit,
                total_count: total_count
            }
        },
        data: @displays.as_json(except: [:created_at, :updated_at, :resolution_id, :manufacturer_id],
                                include: {manufacturer: {only: :title}, resolution: {only: [:width, :height]}})
    }
  end
end
