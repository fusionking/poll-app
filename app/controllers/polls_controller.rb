class PollsController < ApplicationController
	def new
		@poll = Poll.new
		@questions = @poll.questions.build
	end

	def create
		@poll = Poll.new(poll_params)
		if @poll.save
			flash[:notice] = 'Poll was successfully created.'
			redirect_to @poll
		else
			render :new
		end
	end

	def index
    	@polls = Poll.all
  	end

  	def show
  		@poll = Poll.find(params[:id])
  		@questions = @poll.questions
  	end

  	private
    	def poll_params
      		params.require(:poll).permit(:title)
    	end

end
