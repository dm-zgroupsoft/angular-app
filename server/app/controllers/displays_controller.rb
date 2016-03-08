class DisplaysController < ApplicationController

  def index
    offset = params[:offset] || 0
    limit = params[:limit] || Display::DEFAULT_LIMIT
    @displays = Display.eager_load(:manufacturer).eager_load(:resolution).offset(offset).limit(limit).order(:id)
    total_count = Display.count
    render json: {
        _metadata: {offset: offset, limit: limit, total_count: total_count},
        records: @displays.as_json(except: [:created_at, :updated_at, :resolution_id, :manufacturer_id],
                                   include: {manufacturer: {only: :title}, resolution: {only: [:width, :height]}})
    }
  end
end
