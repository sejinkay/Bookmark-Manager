feature 'Viewing bookmarks' do
  scenario 'checks current bookmarks' do
    Bookmark.add_bookmark('https://www.google.co.uk/')
    Bookmark.add_bookmark('http://www.sanger.dk/')
    Bookmark.add_bookmark('https://makers.tech/')

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
