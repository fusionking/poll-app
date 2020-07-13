class QuestionsController < ApplicationController
  # Creates a new form for a Question
	def new
		@poll = Poll.find(params[:poll_id])
		build_question
	end

  # Creates a new Question instance with the parameters coming from the form.
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

  # Builds a new Question instances from the form parameters.
  # Assigns the :title, :submittable, :submittable_type and a :poll.
	def build_question
    	@question = Question.new(question_params)
    	@question.build_submittable(type)
    	@question.poll = @poll
  end

  # Gets the :title attribute from the form.
	def question_params
  	params.require(:question).permit(:title)
	end

  # Gets the :options_attributes from the form.
	def submittable_params
  	if submittable_attributes = params[:question][:submittable_attributes]
    		submittable_attributes[:options_attributes]
  	else
    		{}
  	end
	end

  # Delegates the Option building process to the saved Question instance,
  # from the option parameters.
	def build_options
		@question.build_options(submittable_params)
	end

  # The type of the submittable, coming from the form.
  # This will be used to build a Submittable instance, which is
  # assigned to a Question.
	def type
  	params[:question][:submittable_type]
	end
end