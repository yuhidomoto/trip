require 'rails_helper'

RSpec.describe 'Mytripモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:mytrip) { build(:mytrip, user_id: user.id) }

    context 'countryカラム' do
      it '空欄でないこと' do
        mytrip.country = ''
        expect(mytrip.valid?).to eq false;
      end
    end
    context 'areaカラム' do
      it '空欄でないこと' do
        mytrip.area = ''
        expect(mytrip.valid?).to eq false;
      end
    end
    context 'mustカラム' do
      it '空欄でないこと' do
        mytrip.must = ''
        expect(mytrip.valid?).to eq false;
      end
    end
    context 'importantカラム' do
      it '空欄でないこと' do
        mytrip.important = ''
        expect(mytrip.valid?).to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Mytrip.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end