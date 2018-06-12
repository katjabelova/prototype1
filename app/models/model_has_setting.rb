class ModelHasSetting < ApplicationRecord
  belongs_to :models
  belongs_to :settings_widgets
end
