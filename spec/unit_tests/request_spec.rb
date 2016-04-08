describe Request do
  doubles
  space_doubles

  describe 'should not create a request:' do
    it 'without a user' do
      expect{ make_request }.not_to change(Request, :count)
    end

    it 'without a space' do
      sign_up
      expect{ make_request }.not_to change(Request, :count)
    end
  #
  #   it 'without a space id' do
  #     expect{ request_no_space }.not_to change(Request, :count)
  #   end
  #
  #   it 'without dates' do
  #     expect{ request_no_dates }.not_to change(Request, :count)
  #   end
  # end
  #
  # it 'should create a confirmation status defaulted to false' do
  #   correct_request
  #   expect(Request.first.confirmed).to eq false
  end
end
