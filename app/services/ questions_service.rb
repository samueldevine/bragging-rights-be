class QuestionsService < BaseService

def get_service(param)
   response = conn('https://opentdb.com/api.php').get do |f|
     f.params['amount'] = 5
     f.params['category'] = 29
     # f.params['difficulty'] = 'easy'
     # if unspecified, api chooses random difficulty
     f.params['type'] = 'multiple'
   end
   get_json(response)
end
 # #conn = Faraday.new('https://opentdb.com/api.php').get do |faraday|
 #   faraday.params['amount'] = 5
 #   faraday.params['category'] = 29
 #   # faraday.params['difficulty'] = 'easy'
 #   faraday.params['type'] = 'multiple'
 # end
