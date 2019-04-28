feature 'Viewing bookmarks' do
  scenario 'checks current bookmarks' do
    Bookmark.add_bookmark('Google', 'https://www.google.co.uk/')
    Bookmark.add_bookmark('Pug', 'http://www.sanger.dk/')
    Bookmark.add_bookmark('Makers', 'https://makers.tech/')

    visit('/')
    click_button('View bookmarks')
    expect(page).to have_link('Google', href: 'https://www.google.co.uk/')
    expect(page).to have_link('Pug', href: 'http://www.sanger.dk/')
    expect(page).to have_link('Makers', href: 'https://makers.tech/')
  end
end

feature 'Adding bookmarks' do
  scenario 'add a new bookmark' do
    
    visit('/')
    click_button('Add a bookmark')
    fill_in('title', with: 'Twitter')
    fill_in('address', with: 'https://twitter.com/')
    click_button('Submit')
    expect(page).to have_link('Twitter', href: 'https://twitter.com/')
  end
end
