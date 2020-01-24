require_relative '../shared_contexts'

RSpec.describe Web::Controllers::ExerciseTypes::UpgradeStep, type: :action do
  include_context 'repositories'
  include_context 'user'
  include_context 'exercise with steps'
  include_context 'exercise records'

  let(:action) { described_class.new }
  let(:params) { { exercise_type_id: type.id } }


  context 'on the regular step' do
    before { type_repo.update(type.id, current_step_id: step_1.id) }
    
    it 'should upgrade' do
      response = action.call(params)
      expect(response[0]).to eq 200
      expect(type_repo.by_id(type.id).current_step_id).to eq(step_2.id)
    end
  end

  context 'on last step' do
    before { type_repo.update(type.id, current_step_id: step_10.id) }

    it 'should not upgrade' do
      response = action.call(params)
      expect(response[0]).to eq 422
    end
  end
end
