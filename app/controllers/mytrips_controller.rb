class MytripsController < ApplicationController
	def new
		@mytrip = Mytrip.new
		@user = current_user
	end

	def create
		@mytrip = Mytrip.new(mytrip_params)
		@user = User.find(params[:id])
		if @mytrip.save
			redirect_to mytrips_path
		else
			render 'new'
		end
	end

	def index
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end


	private
	def mytrip_params
		params.require(:mytrip).permit(:name,:gender,:age,:image,:countory,:time_difference,:climate,:month,:season,:security,:prices,:traffic,:flight_time,:airline,:airline_comment,:with_whom,:days,:total_price,:bathroom,:card,:tip,:language,:must,:good_point,:bad_point,:important,:address,:area,:latitude,:longitude)
	end

end
