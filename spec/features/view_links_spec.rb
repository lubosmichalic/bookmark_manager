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

# USER STORY 4
# As a Makers Student
# So I can find some of the blog posts I have made time to read
# I would like to filter my links using tags

feature 'filter links by tag' do
  before(:each) do
    Link.create(url: 'www.bbc.co.uk', title: 'BBC', tags: [Tag.first_or_create(name: 'News')])
    Link.create(url: 'www.ebaumsworld.com', title: 'EbaumsWorld', tags: [Tag.first_or_create(name: 'Stoopid')])
    Link.create(url: 'www.bubblebobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'Bubbles')])
    Link.create(url: 'www.bubbletrouble.co.uk', title: 'Bubble Trouble', tags: [Tag.first_or_create(name: 'Bubbles')])
  end
  scenario 'filter links by a single tag' do
    visit('/tags/Bubbles')
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).not_to have_content('BBC')
      expect(page).not_to have_content('EbaumsWorld')
      expect(page).to have_content('Bubble Bobble')
      expect(page).to have_content('Bubble Trouble')
    end
  end
end
