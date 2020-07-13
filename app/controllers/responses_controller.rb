class ResponsesController < ApplicationController
    # Creates a new form for a Response
    # Helps the view to render Questions, so that a user can
    # submit an answer.
	def new
    	@poll = Poll.find(params[:poll_id])
    	@questions = @poll.questions
  	end

    # Creates a new Response instance, by parsing the form parameters.
    # Gets each key (question_#{id}), parses the question id from them,
    # and finds the related Question along with the text, to save a new Response.
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
