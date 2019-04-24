feature 'Viewing bookmarks' do
  scenario 'checks current bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "https://www.google.co.uk/"
    expect(page).to have_content "http://www.sanger.dk/"
    expect(page).to have_content "https://makers.tech/"
  end
end
