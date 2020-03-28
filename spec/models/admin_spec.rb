require 'rails_helper'

RSpec.describe 'Adminモデルのテスト', type: :model do
  # 名前が空欄で登録できない→名前を空欄で登録したらfalse
  # バリデーションしていない状態で失敗→設定したら成功
  # 登録できるかできないか 登録できたら失敗
  # エラーメッセージがなければ失敗

  describe 'バリデーションのテスト' do
    let(:admin) { build(:admin) }
    subject { test_admin.valid? }
    context 'nameカラム' do
      let(:test_admin) { admin }
      it '空欄でないこと' do
        test_admin.name = ''
        is_expected.to eq false;
      end
      it '2文字以上であること' do
        test_admin.name = Faker::Lorem.characters(number:1)
        is_expected.to eq false;
      end
      it '20文字以下であること' do
        test_admin.name = Faker::Lorem.characters(number:21)
        is_expected.to eq false;
      end
    end
  end
end