class Estate < ApplicationRecord
  belongs_to :location, optional: true
end
