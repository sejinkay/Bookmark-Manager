feature 'Testing infrastructure' do
  scenario 'checks what homepage says' do
    visit('/')
    expect(page).to have_content "Hello, Bookmark Manager!"
  end
end
