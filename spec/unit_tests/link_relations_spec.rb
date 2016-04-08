describe User do
  doubles
  space_doubles

  before do
    sign_up
    add_space
  end

  it 'pulls up spaces related to user' do
    expect(record.spaces.map(&:name)).to include(space_name)
  end
end
