class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
    #binding.pry
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @answer = Answer.find(params[:id])
    @user = User.find(@answer.user_id)
    #binding.pry
  end

  # GET /answers/new
  def new
    @answer = Answer.new
    @user = User.find(params[:id])
    @user.answers.last.nil? ? @ansnum = 0 : @ansnum = @user.answers.last.ansnum
    #unless @user.nil?
    @user.answers.last.nil? ? @score = 0 : @score = @user.answers.last.score
    @user.answers.last.nil? ? @last_result = nil : @last_result = @user.answers.last.result
    #@score = 0
    #end
    case @user.student_id%3
    when 0
      @test_type = "A"
    when 1
      @test_type = "B"
    when 2
      @test_type = "C"
    end

    #if @user.answers.last.ansnum == 42
    #  redirect_to user_answer_url(params[:id])
    #end
    #binding.pry
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers/new/1
  # POST /answers.json
  def create
    @user = User.find(params[:id])
    @answer = @user.answers.create(answer_params)
    #binding.pry
    #@answer = Answer.new(answer_params)
    next_ans = @user.answers.last.ansnum
    #binding.pry
    respond_to do |format|
      if @answer.save
        format.html { redirect_to user_new_answer_path(@user.id,ansnum:next_ans+1), notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_answer
    @user = User.find(params[:user_id])
    @answers = @user.answers.all
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
      #Answer.find(params[:id]) ? @answer = Answer.find(params[:id]) : Answer.create(user_id:@user.id)
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.permit(:result,:ansnum,:score)
    end
end
