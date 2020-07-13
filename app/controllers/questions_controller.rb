class QuestionsController < ApplicationController
	def new
		@poll = Poll.find(params[:poll_id])
		build_question
	end

	def create
		@poll = Poll.find(params[:poll_id])
    build_question
    if @question.save
    		build_options
      	redirect_to @poll
    else
      	render :new
    end
  end

	def build_question
    	@question = Question.new(question_params)
    	@question.build_submittable(type, {})
    	@question.poll = @poll
  end

	def question_params
  	params.require(:question).permit(:title)
	end

	def submittable_params
  	if submittable_attributes = params[:question][:submittable_attributes]
    		submittable_attributes[:options_attributes]
  	else
    		{}
  	end
	end

	def build_options
		@question.build_options(submittable_params)
	end

	def type
  	params[:question][:submittable_type]
	end
end