require 'rails_helper'

RSpec.describe Admin, type: :system do

	describe '管理者ログイン' do
		let(:admin) { create(:admin) }
		before do
			visit new_admin_session_path
		end

		context 'ログイン画面に遷移' do
			it 'ログインに成功' do
		        fill_in 'admin[email]', with: admin.email
		        fill_in 'admin[password]', with: 'admins'
		        click_button 'Log in'
		        expect(current_path).to eq('/admins/top')
			end

			it 'ログインに失敗' do
				fill_in 'admin[email]', with: ''
				fill_in 'admin[password]', with: ''
				click_button ''
				expect(current_path).to eq('/admins/sign_in')
			end
		end
	end



end


