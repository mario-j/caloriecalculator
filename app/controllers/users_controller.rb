class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  helper_method :mifflin_stjeor

	Percentage_calories_from_breakfast = 0.25
	Percentage_calories_from_lunch = 0.35
	Percentage_calories_from_dinner = 0.40
  def mifflin_stjeor(user)
  	if (user.sex.eql?("Male"))
   		bmr = user.weight * 10 + user.height * 6.25 - user.age * 5 + 5
  	else
  		bmr = user.weight * 10 + user.height * 6.25 - user.age * 5 - 161 
  	end
  end
  
  def breakfast_sample_diet(user)
  	total_calories = mifflin_stjeor(user)
  	breakfast_calories = total_calories * Percentage_calories_from_breakfast
  	
  end   


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:sex, :age, :height, :weight, :lifestyle)
    end
    
end
