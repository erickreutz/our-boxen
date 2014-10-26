require 'spec_helper'

describe 'firefox::beta' do
  it do
    should contain_class('firefox::beta')
    should contain_package('Firefox-Beta').with({
      :source   => 'http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/30.0b7/mac/en-US/Firefox%2030.0b7.dmg',
      :provider => 'appdmg'
    })
  end
end
