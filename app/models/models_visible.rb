class ModelsVisible < ApplicationRecord
  belongs_to :role
  belongs_to :model_group_consists_of_model
end
