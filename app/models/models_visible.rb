class ModelsVisible < ApplicationRecord
  belongs_to :role
  belongs_to :model_group
  belongs_to :model
end
