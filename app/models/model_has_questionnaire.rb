class ModelHasQuestionnaire < ApplicationRecord
  belongs_to :models
  belongs_to :questionnaires
end
