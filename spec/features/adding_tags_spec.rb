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

  scenario 'Adds multiple tags to a link' do
    visit '/links/new'
    fill_in 'url', with: "http://www.zombo.com/"
    fill_in 'title', with: 'Zombocom'
    fill_in 'tags', with: 'zombo, welcome'

    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('zombo', 'welcome')
  end
end
