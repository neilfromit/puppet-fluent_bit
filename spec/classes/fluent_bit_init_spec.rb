require 'spec_helper'
describe 'fluent_bit', :type => :class do
  let :facts do
    {
    'os' => {
      'family'  => 'RedHat',
      'release' => {
        'major' => '7',
        'minor' => '1',
        'full'  => '7.1.1503',
      }
    }
  }
  end

  context 'with defaults for all parameters' do
    it { pp catalogue.resources }
  end
end