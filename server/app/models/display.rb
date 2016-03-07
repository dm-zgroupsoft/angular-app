class Display < ActiveRecord::Base
  belongs_to :manufacturer
  belongs_to :resolution

  monetize :price_cents, allow_nil: true

  self.per_page = 100
end
