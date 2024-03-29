require 'spec_helper'

describe NewsRelease, type: :model do
  it 'returns the formatted date and title as a string' do
    news_release = described_class.new(
      released_on: '2013-07-31',
      title: 'BigCo hires new CEO'
    )
    expect(news_release.title_with_date).to eq '2013-07-31: BigCo hires new CEO'
  end

  it { is_expected.to validate_presence_of :released_on }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :body }
end
