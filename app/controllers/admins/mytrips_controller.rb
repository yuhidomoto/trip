class Admins::MytripsController < ApplicationController
	before_action :authenticate_admin!
	def index
		@mytrips = Mytrip.all
		@region_americas = Mytrip.where(region: "Americas")
		@region_europe = Mytrip.where(region: "Europe")
		@region_asia = Mytrip.where(region: "Asia")
		@region_oceania = Mytrip.where(region: "Oceania")
		@region_africa = Mytrip.where(region: "Africa")
		@country = {}
		@mytrips.each do |mytrip|
			country_name = mytrip.country
			@country[mytrip.country] = ISO3166::Country.new(country_name)
		end
		@country_list = country_list
	end

	def seemore
		if params[:category] == "アジア"
			@mytrips = Mytrip.where(region: "Asia")
		elsif params[:category] == "ヨーロッパ"
			@mytrips = Mytrip.where(region: "Europe")
		elsif params[:category] == "アメリカ州"
			@mytrips = Mytrip.where(region: "Americas")
		elsif params[:category] == "アフリカ"
			@mytrips = Mytrip.where(region: "Africa")
		elsif params[:category] == "オセアニア"
			@mytrips = Mytrip.where(region: "Oceania")
		end

		@country = {}
		@mytrips.each do |mytrip|
			country_name = mytrip.country
			@country[mytrip.country] = ISO3166::Country.new(country_name)
		end
	end

		def show
		@comment = Comment.new
		@mytrip = Mytrip.find(params[:id])
		country_name = @mytrip.country
		@country = ISO3166::Country.new(country_name)
		@country_list = country_list
	end

		def edit
		 @mytrip = Mytrip.find(params[:id])
		 @user = @mytrip.user
		 @country_list = country_list
	end

def update
	@mytrip = Mytrip.find(params[:id])
  if @mytrip.update(mytrip_params)
  	country = ISO3166::Country.new(@mytrip.country)
			@mytrip.region = country.region
			@mytrip.save
  		redirect_to admins_mytrips_path, notice: "successfully updated!"
  else
  	render "edit"
  end
end

	def destroy
		@mytrip = Mytrip.find(params[:id])
  	@mytrip.destroy
  	redirect_to admins_mytrips_path, notice: "successfully delete!"
  end

  def country_list
		@country_list = [["タジキスタン","TJ"],["ジャマイカ","JM"],["ハイチ","HT"],["サントメ・プリンシペ","ST"],["モントセラト","MS"],["アラブ首長国連邦","AE"],
	["オランダ","NL"],["ルクセンブルク","LU"],["ベリーズ","BZ"],["イラン・イスラム共和国","IR"],["ボリビア","BO"],["ウルグアイ","UY"],["ガーナ","GH"],
	["サウジアラビア","SA"],["コートジボワール","CI"],["サンマルタン(仏領)","MF"],["フランス南方領土","TF"],["アングイラ","AI"],["カタール","QA"],
	["サンマルタン(オランダ領)","SX"],["リビア","LY"],["ブーベ島","BV"],["パプアニューギニア","PG"],["キルギスタン","KG"],["赤道ギニア","GQ"],
	["西サハラ","EH"],["ニウエ","NU"],["プエルトリコ","PR"],["グレナダ","GD"],["大韓民国(韓国)","KR"],["ハード島及びマクドナルド諸島","HM"],["サンマリノ","SM"],
	["シエラレオネ","SL"],["コンゴ民主共和国","CD"],["マケドニア共和国","MK"],["トルコ","TR"],["アルジェリア","DZ"],["グルジア","GE"],["パレスチナ","PS"],
	["バルバドス","BB"],["ウクライナ","UA"],["グアドループ","GP"],["仏領ポリネシア","PF"],["ナミビア","NA"],["ボツワナ","BW"],["シリア・アラブ共和国","SY"],
	["トーゴ","TG"],["ドミニカ共和国","DO"],["南極大陸","AQ"],["スイス","CH"],["マダガスカル","MG"],["フェロー諸島",	"FO"],["英領ヴァージン諸島","VG"],
	["ジブラルタル","GI"],["ブルネイ・ダルサラーム国","BN"],["ラオス人民民主共和国","LA"],["アイスランド","IS"],["エストニア","EE"],["アメリカ合衆国外諸島","UM"],
	["リトアニア","LT"],["セルビア","RS"],["モーリタニア","MR"],["アンドラ","AD"],["ハンガリー","HU"],["トケラウ","TK"],["マレーシア","MY"],["アンゴラ","AO"],
	["カーボヴェルデ","CV"],["ノーフォーク島","NF"],["パナマ","PA"],["ギニアビサウ","GW"],["ベルギー","BE"],["ポルトガル","PT"],["英国","GB"],["マン島","IM"],
	["米国","US"],["イエメン","YE"],["香港","HK"],["アゼルバイジャン","AZ"],["ココス(キーリング)諸島","CC"],["マリ","ML"],["スロバキア","SK"],["バヌアツ","VU"],
	["東ティモール","TL"],["クロアチア","HR"],["スリナム","SR"],["モーリシャス","MU"],["Czech Republic","CZ"],["サンピエール及びミクロン","PM"],["レソト","LS"],
	["サモア","WS"],["コモロ","KM"],["イタリア","IT"],["ブルンジ","BI"],["ワリー及びフテュナ","WF"],["ギニア","GN"],["シンガポール","SG"],["コロンビア","CO"],
	["中国","CN"],["アルーバ","AW"],["モロッコ","MA"],["フィンランド","FI"],["バチカン市国","VA"],["ジンバブエ","ZW"],["ケイマン諸島","KY"],["バーレーン","BH"],
	["パラグアイ","PY"],["エクアドル","EC"],["リベリア","LR"],["ロシア連邦","RU"],["ポーランド","PL"],["オマーン","OM"],["マルタ","MT"],["南スーダン","SS"],
	["ドイツ","DE"],["トルクメニスタン","TM"],["スヴァールバル及びヤンマイエン","SJ"],["ミャンマー","MM"],["トリニダード・トバゴ","TT"],["イスラエル","IL"],
	["バングラデシュ","BD"],["ナウル","NR"],["スリランカ","LK"],["ウガンダ","UG"],["ナイジェリア","NG"],["ボネール、シントユースタティウス及びサバ","BQ"],
	["メキシコ","MX"],["キュラソー","CW"],["スロベニア","SI"],["モンゴル国","MN"],["カナダ","CA"],["オーランド諸島","AX"],["ベトナム","VN"],["台湾","TW"],
	["日本","JP"],["英国インド洋領土","IO"],["ルーマニア","RO"],["ブルガリア","BG"],["グアム","GU"],["ブラジル","BR"],["アルメニア","AM"],["ザンビア","ZM"],
	["ジブチ","DJ"],["ジャージー","JE"],["オーストリア","AT"],["カメルーン","CM"],["クリスマス島","CX"],["マラウイ","MW"],["チュニジア","TN"],["南アフリカ"	,"ZA"],
	["トンガ","TO"],["キプロス","CY"],["モルディブ","MV"],["ピトケアン","PN"],["ルワンダ","RW"],["ニカラグア","NI"],["セントクリストファー・ネーヴィス","KN"],
	["ベナン","BJ"],["エチオピア","ET"],["ガンビア","GM"],["タンザニア","TZ"],["セントビンセント及びグレナディーン諸島","VC"],["フォークランド諸島(マルビナス)","FK"],
	["スーダン","SD"],["モナコ","MC"],["オーストラリア","AU"],["チリ","CL"],["デンマーク","DK"],["フランス","FR"],["タークス及びカイコス諸島","TC"],
	["キューバ","CU"],["アルバニア","AL"],["モザンビーク","MZ"],["バハマ","BS"],["ニジェール","NE"],["グアテマラ","GT"],["リヒテンシュタイン","LI"],
	["ネパール","NP"],["ブルキナファソ","BF"],["パラオ","PW"],["クウェート","KW"],["インド","IN"],["ガボン","GA"],["ツバル","TV"],["マカオ","MO"],
	["セントヘレナ、アセンション及びトリスタン・ダ・クーニャ","SH"],["モルドバ","MD"],["クック諸島","CK"],["アルゼンチン","AR"],["セーシェル","SC"],
	["アイルランド","IE"],["スペイン","ES"],["レバノン","LB"],["バーミューダ","BM"],["レユニオン","RE"],["キリバス","KI"],["アンティグア・バーブーダ","AG"],
	["マルティニーク","MQ"],["エルサルバドル","SV"],["ヨルダン","JO"],["タイ","TH"],["ソマリア","SO"],["マーシャル諸島","MH"],["コンゴ","CG"],
	["朝鮮民主主義人民共和国","KP"],["仏領ギアナ","GF"],["ボスニア・ヘルツェゴビナ","BA"],["マヨット","YT"],["サウスジョージア及びサウスサンドウィッチ諸島","KE"],
	["ペルー","PE"],["ブータン","BT"],["スワジランド","SZ"],["コスタリカ","CR"],["チャド","TD"],["ドミニカ","DM"],["ニューカレドニア","NC"],
	["ギリシャ","GR"],["ガーンジー","GG"],["ホンジュラス","HN"],["米国領ヴァージン諸島","VI"],["中央アフリカ共和国","CF"],["セネガル","SN"],["アフガニスタン","AF"],
	["北マリアナ諸島","MP"],["フィリピン","PH"],["ベラルーシ","BY"],["ラトビア","LV"],["ノルウェー","NO"],["エジプト","EG"],["カンボジア","KH"],["イラク","IQ"],
	["セントルシア","LC"],["ニュージーランド","NZ"],["サンバルテルミ","BL"],["ウズベキスタン","UZ"],["インドネシア","ID"],["エリトリア国","ER"],["ベネズエラ","VE"],
	["ミクロネシア連邦","FM"],["ソロモン諸島","SB"],["モンテネグロ","ME"],["米領サモア","AS"],["パキスタン","PK"]]
	end


  private
	def mytrip_params
		params.require(:mytrip).permit(:name,:genre_id,:gender,:age,:image,:country,:time_difference,:climate,:year,:month,:season,:security,:prices,:traffic,:flight_time,:airline,:airline_comment,:with_whom,:days,:total_price,:bathroom,:card,:tip,:language,:must,:good_point,:bad_point,:important,:address,:area,:latitude,:longitude)
	end
end