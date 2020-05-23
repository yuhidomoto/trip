class SearchsController < ApplicationController
	include CountryList
	before_action :authenticate_user!
	def search
	  @mytrips = Mytrip.search(params[:search]).page(params[:page]).per(6)
	  @country_list = return_country_list
	   # 国名を検索の対象にする(↓のif文が無いと(例 TJ)と検索しなければ国名は検索に引っかからない)
	  if @mytrips.count == 0
	  	# @country_list = の配列の中に2つずつの配列が入っている。（二次元配列）
	  		# その中の |a| に配列の(例 タジキスタン)だけを取り出す。→ a[0]
	  		# [1]は配列の2番目(例 TJ)という意味
	  		# a[0]とsearch params[1]が一致したら( a[0] == params[:search] }[1] )
	  		# それをキーにして、もう一度 mytripの検索をしてくださいという命令 ↓
	  	begin
		  	pp @country_list
				v = @country_list.find{|a| a[0] == params[:search] }[1]
				pp v
				@mytrips = Mytrip.search(v).page(params[:page]).per(6)

			# 例外処理（エラーが起きても処理を進める）
			rescue => e
      	    pp e
    	end
	 	end
	 	# countryを初期化し、each文で回す
	 	# 28行目　@country[mytrip.country]のコードにより、@country = {} という定義が必要になる
	 	@country = {}
		@mytrips.each do |mytrip|
			@country[mytrip.country] = ISO3166::Country.new(mytrip.country)
		end
		# each文の中に下のif文を入れるとeach分が回らなくなってしまう
		#if @mytrips.count == 0
			#flash[:notice] = "0件です"
		#end
	end

		#25行目　例えば @country = {
			 							# "TJ" => ISO3166::Country.new("TJ"),
			 							# "JP" => ISO3166::Country.new("JP"),
			 							# "US" => ISO3166::Country.new("JP"),
			 							# 	}
		#となっている場合、each文の|mytrip|には、"TJ","JP","JP"が回る。（この定義はできないが仮定の話）
		#その場合、@mytripsは以下となる。

	 	# @mytrips = [
	 		# {country: "TJ"},
	 		# {country: "JP"},
	 		# {country: "US"},
	 	# ]

end
