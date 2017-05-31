# USER STORY 1
# As a Makers Student
# So I can organise all the blog posts I don't have time to read
# I want to see a list of my bookmark links
feature 'View list of links' do
  scenario 'see list' do
    Link.create(url: 'http.//www.makersacademy.com', title: 'Makers Academy')
    visit('/links')
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
