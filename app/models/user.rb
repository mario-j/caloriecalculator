class User < ApplicationRecord


	LIFESTYLE = ["Sedentary", "Lightly Active", "Moderately Active", "Very Active", "Extra Active"]
	attribute :age, :integer
	attribute :height, :decimal
	attribute :weight, :decimal
	attribute :lifestyle, :string

end
