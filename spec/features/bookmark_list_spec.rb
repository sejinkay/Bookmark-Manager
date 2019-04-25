feature 'Viewing bookmarks' do
  scenario 'checks current bookmarks' do
    connection = PG.connect :dbname => 'bookmark_manager_test'

    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.google.co.uk/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.sanger.dk/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://makers.tech/');")

    visit('/bookmarks')
    expect(page).to have_content "https://www.google.co.uk/"
    expect(page).to have_content "http://www.sanger.dk/"
    expect(page).to have_content "https://makers.tech/"
  end
end
