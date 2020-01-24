RSpec.describe Web::Controllers::ExerciseRecords::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { { record: {  step_id: 1, 
                              exercise_type_id: 1, 
                              level: 1, 
                              data: [[1, 10], [1, 8]] } } }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
