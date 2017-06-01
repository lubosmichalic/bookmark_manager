feature 'adding tags' do
  scenario 'add a single tag to a new link ' do
    visit('/links/new')
    fill_in 'title', with: 'BBC'
    fill_in 'url', with: 'http://www.bbc.com'
    fill_in 'tags', with: 'news'

    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('news')
  end
end
