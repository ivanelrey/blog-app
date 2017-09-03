require 'rails_helper'

RSpec.feature "Deleting an article" do 

	before do
		john = User.create(email: "john@email.com", password: "password")
		login_as(john)
		@article = Article.create(title: "article's title", body: "article's body", user: john)
	end

	scenario "A user deletes an article" do 
		visit "/"

		click_link @article.title
		click_link "Delete Article"

		expect(page).to have_content("Article has been deleted")
		expect(page.current_path).to eq(articles_path)
	end 

end