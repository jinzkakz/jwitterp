require 'rails_helper'

RSpec.describe User, type: :model do
    it "should confirm a user :email" do
        user = User.new({email: "blah@123.com"})
        expect(user.save).to be(false)
    end

    it "should confirm a user :password" do
        user = User.new({password: "qwerty", password_confirmation: "qwerty"})
        expect(user.save).to be(false)
    end
    
    it "should confirm a user :name" do
        user = User.new({name: "whatchu"})
        expect(user.save).to be(false)
    end
    
       describe 'check user' do
        describe 'search user by' do
            it 'check duplication of users' do
                user1 = User.create(name: 'admin', email: 'admin@90.com', password: 'admin')
                user2 = User.create(name: 'admin', email: 'admin@90.com', password: 'admin')
                
                expect(user2.save).to eq(false)
            end
        end
    end        
end
