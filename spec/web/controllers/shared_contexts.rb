STEPS_RANGE = (1..10)

RSpec.shared_context 'repositories' do
  let(:user_repo)  { Fitter::Repositories[:User] }
  let(:type_repo)  { Fitter::Repositories[:ExerciseType] }
  let(:step_repo)  { Fitter::Repositories[:Step] }
  let(:record_repo)  { Fitter::Repositories[:ExerciseRecord] }
  
  before do
    user_repo.clear
    type_repo.clear
    step_repo.clear
    record_repo.clear
  end
end

RSpec.shared_context 'user' do
  let(:user)     { user_repo.create(id: 1, name: 'Kirill', email: 'asd@qwe.ru') }
  before { user }
end

RSpec.shared_context 'exercise with steps' do
  let(:type)     { type_repo.create(user_id: user.id, name: 'Pull-Ups') }
  
  let(:step_1) { step_repo.create(step_attrs(type_id: type.id, index: 1)) }
  let(:step_2) { step_repo.create(step_attrs(type_id: type.id, index: 2)) }
  let(:step_10) { step_repo.create(step_attrs(type_id: type.id, index: 10)) }

  before { type; step_1; step_2 }
end

RSpec.shared_context 'exercise records' do
    let(:record)    { record_repo.create(user_id: user.id, 
                                         step_id: step_repo.first.id, 
                                         exercise_type_id: type.id,
                                         data: [[1, 17]],
                                         created_at: Time.now.utc,
                                         updated_at: Time.now.utc) }
    before {record}
end

def step_attrs(type_id:, index:)
  { exercise_type_id: type_id, 
    index: index, 
    type: 'reps', 
    name: 'Standing pull-ups',
    progression: [[1, 10], [2, 15], [3, 30]],
    created_at: Time.now.utc,
    updated_at: Time.now.utc }
end