class PollsController < ApplicationController
	# Creates a new form for a Poll instance.
	def new
		@poll = Poll.new
		@questions = @poll.questions.build
	end

	# Creates a new Poll instance from the parameters coming from the form.
	def create
		@poll = Poll.new(poll_params)
		if @poll.save
			redirect_to @poll
		else
			render :new
		end
	end

	# Lists all Poll instances.
	def index
    	@polls = Poll.all
  	end

  	# Shows a specific Poll instance.
  	def show
  		@poll = Poll.find(params[:id])
  		@questions = @poll.questions
  	end

  	# Defines required strong parameters to create a Poll.
  	private
    	def poll_params
      		params.require(:poll).permit(:title)
    	end

end
