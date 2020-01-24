require_relative '../shared_contexts'

RSpec.describe Web::Controllers::ExerciseRecords::Index, type: :action do
  include_context 'repositories'
  include_context 'user'
  include_context 'exercise with steps'
  include_context 'exercise records'

  let(:action)     { Web::Controllers::ExerciseRecords::Index.new }
  let(:params)     { { step_id: step_1.id } }

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end
end
