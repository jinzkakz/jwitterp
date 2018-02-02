require 'rails_helper'

RSpec.describe Article, type: :model do
    it {should validate_presence_of(:name) }
    it {should validate_presence_of(:author) }
    it {should validate_presence_of(:content) }
    it {should belong_to (:user) }
    
    
    describe 'search_article' do
        describe 'search article by' do
            it 'should search for name, author, and content' do
                user = User.create(name: 'admin', email: 'admin@90.com', password: 'admin')
                
                create1 = Article.create(name: 'Power', author: 'Ranger', content: 'lorem ipsum', user_id: user.id )
                create2 = Article.create(name: 'Power', author: 'Ranger', content: 'lorem ipsum1', user_id: user.id )
                create3 = Article.create(name: 'Ninja', author: 'Turtle', content: 'lorem ipsum2', user_id: user.id )
                
                search = Article.search('Power')
                expect(search.count.to_i).to eq(2)
            end
        end
    end         
end
