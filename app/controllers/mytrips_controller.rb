class MytripsController < ApplicationController
	include CountryList
	before_action :authenticate_user!
	def new
		@mytrip = Mytrip.new
		@user = current_user
		# return(自分で名付けたもの)_country_listを実行した結果が@country_listとなる
		# return_country_listは concerns/country_list.rbに定義
		@country_list = return_country_list
	end

	def create
		# createやupdateは、(mytrip_params)を書く。ここではフォームで入力されたデータを受け取っている。
        # paramsはRailsで送られてきた値を受け取るためのメソッド。
        # requireでデータのオブジェクト名(ここでは:mytrip)を指定し、permitでキー(:year,:month,:season...)を指定している。
		# これにより、mytrip_paramsの中にフォームで入力された全データが格納される。
		@mytrip = Mytrip.new(mytrip_params)
		@user = current_user
		@mytrip.user_id  = @user.id
		@country_list = return_country_list
		# (@mytrip.country)→ 新規投稿時の入力した国（例"TJ"
		# countryは TJ のgem内全てのデータが入る("alpha3"=>"TJK","alt_currency"=>"RUB", "country_code"=>"992"...)
		country = ISO3166::Country.new(@mytrip.country)
		@mytrip.region = country.region
		if @mytrip.save
			tags = []
			# image(画像)が存在してる場合Visionで処理をする
			if @mytrip.image
				tags = Vision.get_image_data(@mytrip.image)
			end

	      	tags.each do |tag|
	        	@mytrip.tags.create(name: tag)
	    	end

			flash[:notice] = "新規投稿に成功しました !"
			redirect_to mytrip_path(@mytrip.id)
		else
			render "new"
		end
	end

	def index
		# 全部取り出すため(params[:id])は付けない
		@mytrips = Mytrip.all
		@user = current_user
		@region_europe = Mytrip.where(region: "Europe")
		@region_americas = Mytrip.where(region: "Americas")
		@region_africa = Mytrip.where(region: "Africa")
		@region_asia = Mytrip.where(region: "Asia")
		@region_oceania = Mytrip.where(region: "Oceania")
	end

	def seemore
		if params[:category] == "Europe"
			@mytrips = Mytrip.where(region: "Europe").page(params[:page]).per(6)
		elsif params[:category] == "Americas"
			@mytrips = Mytrip.where(region: "Americas").page(params[:page]).per(6)
		elsif params[:category] == "Africa"
			@mytrips = Mytrip.where(region: "Africa").page(params[:page]).per(6)
		elsif params[:category] == "Asia"
			@mytrips = Mytrip.where(region: "Asia").page(params[:page]).per(6)
		elsif params[:category] == "Oceania"
			@mytrips = Mytrip.where(region: "Oceania").page(params[:page]).per(6)
		else
			redirect_to mytrips_path
		end
	end

	def show
		# 一つだけ取り出すため(params[:id])が必要。データを1件取得
		@mytrip = Mytrip.find(params[:id])
		@user = current_user
		@comment = Comment.new
		@country = ISO3166::Country.new(@mytrip.country)
		@hash = Gmaps4rails.build_markers(@mytrip) do |place, marker|
		    marker.lat @country.latitude
		    marker.lng @country.longitude
		    marker.infowindow place.country
		end
	end

	def edit
		@user = current_user
		@mytrip = Mytrip.find(params[:id])
		@country_list = return_country_list
		if @mytrip.user.id != current_user.id
	   		redirect_to mytrip_path(mytrip.id)
	 	end
	end

	def update
		@mytrip = Mytrip.find(params[:id])
		@user = current_user
		@country_list = return_country_list
		if @mytrip.update(mytrip_params)
			# 写真がない場合、エラーがでないように、if文を追加
			if @mytrip.image.present?
				tags = Vision.get_image_data(@mytrip.image)
		      	tags.each do |tag|
		        	@mytrip.tags.create(name: tag)
		    	end
	    	end
			country = ISO3166::Country.new(@mytrip.country)
			@mytrip.region = country.region
			@mytrip.save
			redirect_to mytrips_path, notice: "アップデートが完了しました !"
		else
			render "edit"
		end
	end

	def destroy
		mytrip = Mytrip.find(params[:id])
  		mytrip.destroy
  		redirect_to mytrips_path, notice: "削除が完了しました !"
	end

	private
	# ↓モデル名_params」とすることが多い
	def mytrip_params
		# カラム名は『image_id』だがここでは『image』と書く
		params.require(:mytrip).permit(:name,:genre_id,:gender,:age,:image,:country,:time_difference,:climate,:year,:month,:season,:security,:prices,:traffic,:flight_time,:airline,:airline_comment,:with_whom,:days,:total_price,:bathroom,:card,:tip,:language,:must,:good_point,:bad_point,:important,:address,:area,:latitude,:longitude)
	end
end
