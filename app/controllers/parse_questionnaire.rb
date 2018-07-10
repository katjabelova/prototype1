class ParseQuestionnaire
attr_accessor :questions_array

def initialize(model_id)
  @questions_array = []

  ModelHasQuestionnaire.where(models_id: model_id).find_each do |row|
    question_id = row.questionnaires_id
    @question_content = {}

    Questionnaire.where(id: question_id).find_each do |question|
      @question_content['name'] = question.name
      @question_content['question'] = question.question
      @question_content['answer_type'] = question.answer_type
      @question_content['answer_comment'] = question.answer_comment
      @question_content['answer_possibilities'] = question.answer_possibilities
      @question_content['lower_bound'] = question.lower_bound
      @question_content['upper_bound'] = question.upper_bound
      @question_content['order_number'] = question.order_number
    end

    @questions_array.push(@question_content)
  end
end

end
