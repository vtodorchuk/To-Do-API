describe Project do
  describe 'task' do
    context 'when validations' do
      it { is_expected.to allow_values(nil).for(:name) }
    end

    context 'when associations' do
      it { is_expected.to belong_to(:user) }
    end
  end
end
