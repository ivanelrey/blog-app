require 'rails_helper'

RSpec.feature 'Adding comments to articles' do 
	before do 
		@john = User.create(email: "john@email.com", password: "password")
		@fred = User.create(email: "fred@email.com", password: "password")
		@article = Article.create!(title: "article's title", body: "article's body", user: @john)
	end

	scenario 'permits a signed in user to write a comment' do 
		login_as(@fred)

		visit '/'

		click_link @article.title
		fill_in 'New Comment', with: 'An amazing article'
		click_button 'Add Comment'

		expect(page).to have_content('An amazing article')
		expect(current_path).to eq(article_comments_path(@article.id))
	end

end