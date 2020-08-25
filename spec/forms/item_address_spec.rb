require 'rails_helper'

RSpec.describe ItemAddress, type: :model do
  describe '#create' do
    before do
      @address = FactoryBot.build(:item_address)
      payjp_customer = double('Payjp::Charge')
      allow(Payjp::Charge).to receive(:create).and_return(payjp_customer)
    end

    it '全て条件通り入力されていれば登録できること' do
      expect(@address).to be_valid
    end

    it '郵便番号が空だと登録できないこと' do
      @address.postal_code = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号にハイフンがないと登録できないこと' do
      @address.postal_code = 1_234_567
      @address.valid?
      expect(@address.errors.full_messages).to include('Postal code is invalid')
    end

    it 'prefectureを選択しないと登録できないこと' do
      @address.prefecture_id = 1
      @address.valid?
      expect(@address.errors.full_messages).to include('Prefecture を選んでください')
    end

    it 'cityが空では登録できないこと' do
      @address.city = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("City can't be blank")
    end

    it 'home_numberが空だと登録できないこと' do
      @address.home_number = nil
      @address.valid?

      expect(@address.errors.full_messages).to include("Home number can't be blank")
    end

    it 'building_nameは空でも登録できること' do
      @address.building_name = nil
      expect(@address).to be_valid
    end

    it 'phone_numberが空だと登録できないこと' do
      @address.phone_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが12桁以上だと登録できないこと' do
      @address.phone_number = '090123456789'
      @address.valid?
      expect(@address.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
