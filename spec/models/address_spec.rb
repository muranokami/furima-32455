require 'rails_helper'

RSpec.describe user_purchase, type: :model do
  describe '#create' do
    before do
     user_purchase = FactoryBot.build(:item)
    end