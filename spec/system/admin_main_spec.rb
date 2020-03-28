require 'rails_helper'

	describe '管理者の権限テスト'  do
		let(:admin) { create(:admin) }
		let(:user) { create(:user) }
		let(:mytrip) { create(:mytrip) }
		describe 'ログインしていない場合' do
			context 'アクセス権限のテスト' do

			it '投稿一覧画面に遷移できない' do
				visit admins_mytrips_path
				expect(current_path).to eq('/admins/sign_in')
			end

			it '投稿詳細画面に遷移できない' do
				visit admins_mytrip_path(mytrip.id)
				expect(current_path).to eq('/admins/sign_in')
			end

			it '投稿編集画面に遷移できない' do
				visit edit_admins_mytrip_path(mytrip.id)
				expect(current_path).to eq('/admins/sign_in')
			end

			it 'ユーザー一覧画面に遷移できない' do
				visit admins_users_path
				expect(current_path).to eq('/admins/sign_in')
			end

			it 'ユーザー編集画面に遷移できない' do
				visit edit_admins_user_path(user.id)
				expect(current_path).to eq('/admins/sign_in')
			end
		end
	end
end
