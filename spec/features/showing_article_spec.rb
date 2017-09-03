require 'rails_helper'

RSpec.feature "Showing an article" do 

	before do
		@john = User.create(email: "john@email.com", password: "password")
		@fred = User.create(email: "fred@email.com", password: "password")
		@article = Article.create(title: "article's title", body: "article's body", user: @john)
	end

	scenario "to non-signed in users hide Edit and Delete buttons" do
		visit "/"
		click_link @article.title

		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)

		expect(page.current_path).to eq(article_path(@article))
		expect(page).not_to have_link("Edit Article")
		expect(page).not_to have_link("Delete Article")
	end

	scenario "to non-owner hide Edit and Delete buttons" do
		login_as(@fred)
		visit "/"
		click_link @article.title

		expect(page).to have_content(@article.title)
		expect(page).to have_content(@article.body)

		expect(page.current_path).to eq(article_path(@article))
		expect(page).not_to have_link("Edit Article")
		expect(page).not_to have_link("Delete Article")
	end


end