feature 'Viewing bookmarks' do
  scenario 'checks current bookmarks' do
    connection = PG.connect :dbname => 'bookmark_manager_test'

    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.google.co.uk/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.sanger.dk/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://makers.tech/');")

    visit('/')
    click_button('View bookmarks')
    expect(page).to have_content "https://www.google.co.uk/"
    expect(page).to have_content "http://www.sanger.dk/"
    expect(page).to have_content "https://makers.tech/"
  end
end

feature 'Adding bookmarks' do
  scenario 'add a new bookmark' do
    connection = PG.connect :dbname => 'bookmark_manager_test'

    visit('/')
    click_button('Add a bookmark')
    fill_in('address', with: 'https://twitter.com/')
    click_button('Submit')
    expect(page).to have_content "https://twitter.com/"
  end
end
