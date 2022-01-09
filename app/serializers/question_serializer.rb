class QuestionSerializer
  include JSONAPI::Serializer

  attributes :id,
             :question,
             :correct_answer,
             :answers
end
