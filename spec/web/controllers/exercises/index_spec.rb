RSpec.describe Web::Controllers::Exercises::Index, type: :action do
  let(:action)     { Web::Controllers::Exercises::Index.new(records: repository) }
  let(:user_repo)  { UserRepo.new }
  let(:user)       { user_repo.find(1) || user_repo.create(id: 1, name: 'Kirill', email: 'asd@qwe.ru') }
  let(:type)    { ExerciseTypeRepo.new.create(user_id: user.id, name: 'Pull-Ups') }
  let(:step)    { StepRepository.new.create(exercise_type_id: type.id, 
                                            index: 1, 
                                            type: 'reps', 
                                            name: 'Standing pull-ups',
                                            progression: [[1, 10], [2, 15], [3, 30]]) }
  let(:records)    { [ ExerciseRecordRepo.new.create(user_id: user.id, 
                                                           step_id: step.id, 
                                                           exercise_type_id: type.id,
                                                           data: [[1, 17]]) ] }
  let(:repository) { double('repository', all_by_user: records) }

  it 'is successful' do
    response = action.call({})
    puts response
    expect(response[0]).to eq 200
  end
end
