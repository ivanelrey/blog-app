require 'rails_helper'

RSpec.feature "Showing an article" do 

	before do
		john = User.create(email: "john@email.com", password: "password")
		login_as(john)
		@article = Article.create(title: "article's title", body: "article's body", user: john)
	end

	scenario "A user shows an article" do
		visit "/"
		click_link @article.title

		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)

		expect(page.current_path).to eq(article_path(@article))
	end


end