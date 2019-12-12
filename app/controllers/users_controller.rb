class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  helper_method :mifflin_stjeor, :breakfast_sample_diet, 
  						:get_breakfast_diet_names, :get_breakfast_diet_serving_sizes, :get_breakfast_diet_calories, 
  						:get_lunch_diet_names, :get_lunch_diet_serving_sizes, :get_lunch_diet_calories,
  						:get_dinner_diet_names, :get_dinner_diet_serving_sizes, :get_dinner_diet_calories,
  						:get_calorie_sum



	#Constants
	Percentage_calories_from_breakfast = 0.25
	Percentage_calories_from_lunch = 0.35
	Percentage_calories_from_dinner = 0.40
	
	#Globals
	$breakfast_diet_names
	$breakfast_diet_serving_sizes
	$breakfast_diet_calories
	$lunch_diet_names
	$lunch_diet_serving_sizes
	$lunch_fast_diet_calories
	$dinner_diet_names
	$dinner_diet_serving_sizes
	$dinner_diet_calories
	$calorie_sum
	
  def mifflin_stjeor(user)
  	activity_level = get_activity_level(user)
  	if (user.sex.eql?("Male"))
   		bmr = user.weight * 10 + user.height * 6.25 - user.age * 5 + 5
   		daily_calories = bmr * activity_level
  	else
  		bmr = user.weight * 10 + user.height * 6.25 - user.age * 5 - 161 
   		daily_calories = bmr * activity_level
  	end
  end
  
  def get_activity_level(user)
  	if (user.lifestyle.eql?("Sedentary"))
  		activity_level = 1.2
  	elsif (user.lifestyle.eql?("Lightly Active"))
  	  activity_level = 1.375
  	elsif (user.lifestyle.eql?("Moderately Active"))
  	  activity_level = 1.55
  	elsif (user.lifestyle.eql?("Very Active"))
  	  activity_level = 1.725
  	else
  	  activity_level = 1.9
  	end  	
  end
  
  def breakfast_sample_diet(user)
  	total_calories = mifflin_stjeor(user)
  	
  	#Setup/Initialization
  	estimated_breakfast_calories = total_calories * Percentage_calories_from_breakfast
  	estimated_lunch_calories = total_calories * Percentage_calories_from_lunch
  	estimated_dinner_calories = total_calories * Percentage_calories_from_dinner
  	accrued_breakfast_calories = 0  
  	number_of_breakfast_foods = Food.where("food_type = 'breakfast'").count
  	number_of_lunch_and_dinner_foods = Food.where("food_type = 'ld'").count
  	breakfast_name = Array.new
  	breakfast_serving_size = Array.new
  	breakfast_calories = Array.new
  	lunch_name = Array.new
  	lunch_serving_size = Array.new
  	lunch_calories = Array.new
  	dinner_name = Array.new
  	dinner_serving_size = Array.new
  	dinner_calories = Array.new
  	
  	#Breakfast Diet Plan
  	while estimated_breakfast_calories > 0
  		random_id = rand(number_of_breakfast_foods) + 1
  		@breakfast_foods = Food.where("food_type = 'breakfast'").find_by_id(random_id)
  		estimated_breakfast_calories -= @breakfast_foods.calories
  		breakfast_name.push(@breakfast_foods.name)
  		breakfast_serving_size.push(@breakfast_foods.serving_size)
  		breakfast_calories.push(@breakfast_foods.calories)
  	end
  	set_breakfast_diet_names(breakfast_name)
  	set_breakfast_diet_serving_sizes(breakfast_serving_size)
  	set_breakfast_diet_calories(breakfast_calories)
  	
  	#Lunch Diet Plan
  	estimated_lunch_calories += estimated_breakfast_calories #Add breakfast overflow calories to lunch
  	while estimated_lunch_calories > 0
  		random_id = rand(number_of_lunch_and_dinner_foods) + number_of_breakfast_foods + 1
  		@lunch_foods = Food.where("food_type = 'ld'").find_by_id(random_id)
  		estimated_lunch_calories -= @lunch_foods.calories
  		lunch_name.push(@lunch_foods.name)
  		lunch_serving_size.push(@lunch_foods.serving_size)
  		lunch_calories.push(@lunch_foods.calories)
  	end
  	set_lunch_diet_names(lunch_name)
  	set_lunch_diet_serving_sizes(lunch_serving_size)
  	set_lunch_diet_calories(lunch_calories)
  	
  	#Dinner Diet Plan
  	estimated_dinner_calories += estimated_lunch_calories #Add lunch overflow calories to dinner
  	while estimated_dinner_calories > 0
  		random_id = rand(number_of_lunch_and_dinner_foods) + number_of_breakfast_foods + 1
  		@dinner_foods = Food.where("food_type = 'ld'").find_by_id(random_id)
  		estimated_dinner_calories -= @dinner_foods.calories
  		dinner_name.push(@dinner_foods.name)
  		dinner_serving_size.push(@dinner_foods.serving_size)
  		dinner_calories.push(@dinner_foods.calories)
  	end
  	set_dinner_diet_names(dinner_name)
  	set_dinner_diet_serving_sizes(dinner_serving_size)
  	set_dinner_diet_calories(dinner_calories)
  	set_calorie_sum(breakfast_calories, lunch_calories, dinner_calories)
  	nil
  end   
  
  def set_calorie_sum(breakfast_calories, lunch_calories, dinner_calories)
  	$calorie_sum = breakfast_calories.sum + lunch_calories.sum + dinner_calories.sum
  end
  
  def get_calorie_sum()
  	$calorie_sum
  end  
  
  #Breakfast Getters and Setters
  def set_breakfast_diet_names(breakfast_name)
  	$breakfast_diet_names = breakfast_name.join("\n")
  end
  
  def get_breakfast_diet_names()
  	$breakfast_diet_names
  end
  
  def set_breakfast_diet_serving_sizes(breakfast_serving_size)
  	$breakfast_diet_serving_sizes = breakfast_serving_size.join("\n")
  end
  
  def get_breakfast_diet_serving_sizes()
  	$breakfast_diet_serving_sizes
  end
  
  def set_breakfast_diet_calories(breakfast_calorie)
  	$breakfast_diet_calories = breakfast_calorie.join("\n")
  end
  
  def get_breakfast_diet_calories()
  	$breakfast_diet_calories
  end
  
  #Lunch Getters and Setters
  def set_lunch_diet_names(lunch_name)
  	$lunch_diet_names = lunch_name.join("\n")
  end
  
  def get_lunch_diet_names()
  	$lunch_diet_names
  end
  
  def set_lunch_diet_serving_sizes(lunch_serving_size)
  	$lunch_diet_serving_sizes = lunch_serving_size.join("\n")
  end
  
  def get_lunch_diet_serving_sizes()
  	$lunch_diet_serving_sizes
  end
  
  def set_lunch_diet_calories(lunch_calorie)
  	$lunch_diet_calories = lunch_calorie.join("\n")
  end
  
  def get_lunch_diet_calories()
  	$lunch_diet_calories
  end
  
  #Dinner Getters and Setters
  def set_dinner_diet_names(dinner_name)
  	$dinner_diet_names = dinner_name.join("\n")
  end
  
  def get_dinner_diet_names()
  	$dinner_diet_names
  end
  
  def set_dinner_diet_serving_sizes(dinner_serving_size)
  	$dinner_diet_serving_sizes = dinner_serving_size.join("\n")
  end
  
  def get_dinner_diet_serving_sizes()
  	$dinner_diet_serving_sizes
  end
  
  def set_dinner_diet_calories(dinner_calorie)
  	$dinner_diet_calories = dinner_calorie.join("\n")
  end
  
  def get_dinner_diet_calories()
  	$dinner_diet_calories
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
