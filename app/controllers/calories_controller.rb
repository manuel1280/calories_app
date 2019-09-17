class CaloriesController < ApplicationController
  before_action :set_calory, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  after_action :update_reister_numbers_to_user, only: [:create, :destroy]

  # GET /calories
  # GET /calories.json
  def index
    current_calories = Calory.where("user_id = #{current_user.id}")
    show_calories = current_calories.where(query_to_search)
    @calories = show_calories.order("updated_at desc").page(params[:page]).per(15)
    # @calories = current_user.calories.order("created_at desc").page(params[:page]).per(15)
  end
  # GET /calories/1
  # GET /calories/1.json
  def show
    @calory = Calory.find(params[:id])
  end

  # GET /calories/new
  def new
    @calory = current_user.calories.new
  end

  # GET /calories/1/edit
  def edit
    @calory = Calory.find(params[:id])
  end

  # POST /calories
  # POST /calories.json
  def create
    @calory = current_user.calories.new(calory_params)

    respond_to do |format|
      if @calory.save
        format.html { redirect_to @calory, notice: 'Calory was successfully created.' }
        format.json { render :show, status: :created, location: @calory }
      else
        format.html { render :new }
        format.json { render json: @calory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calories/1
  # PATCH/PUT /calories/1.json
  def update
    respond_to do |format|
      if @calory.update(calory_params)
        format.html { redirect_to @calory, notice: 'Calory was successfully updated.' }
        format.json { render :show, status: :ok, location: @calory }
      else
        format.html { render :edit }
        format.json { render json: @calory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calories/1
  # DELETE /calories/1.json
  def destroy
    @calory.destroy
    respond_to do |format|
      format.html { redirect_to calories_url, notice: 'Calory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calory
      @calory = Calory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calory_params
      params.require(:calory).permit(:value, :type_value, :comment, :user_id, :search_date, :search_comment)
    end

    def update_reister_numbers_to_user
      new_number = current_user.calories.pluck(:id).size
      User.find(current_user.id).update(num_register: new_number)
    end

    def query_to_search
      search_comment = params[:search_comment]
      search_date = params[:search_date]
      user=current_user.id

      if !search_date.blank? and !search_comment.blank?
        result = "updated_at LIKE '#{search_date}%' and comment LIKE '%#{search_comment}%'"
        elsif !search_comment.blank?
          result = "comment LIKE '%#{search_comment}%'"
        elsif !search_date.blank?
          result = "updated_at LIKE '#{search_date}%'"
        else
          result = "user_id = #{current_user.id}"
      end
      
      return result
    end

end