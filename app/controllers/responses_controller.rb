class ResponsesController < ApplicationController
	def new
    	@poll = Poll.find(params[:poll_id])
    	@questions = @poll.questions
  	end

	def create
    	@poll = Poll.find(params[:poll_id])
    	all_responses =  params.select{ |k,v| k.start_with? 'question' }
    	all_responses.each do |q, response|
    		question_id = q.split('_')[1]
    		question = Question.find(question_id)
    		response = Response.new(text: response, question: question)
    		response.save
    	end
    	redirect_to poll_path(params[:poll_id])
  	end

end
