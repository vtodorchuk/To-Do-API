describe Comment, type: :model do
  describe 'comment' do
    context 'when validations' do
      it { is_expected.to allow_values('a' * Comment::MAX_BODY_LENGTH.pred).for(:body) }
    end

    context 'when associations' do
      it { is_expected.to belong_to(:task) }
    end
  end
end
