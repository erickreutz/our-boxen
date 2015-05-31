require 'spec_helper'

describe 'mplayerx' do
  it do
    should contain_package('MPlayerX').with({
      :provider => 'compressed_app',
      :source   => 'http://mplayerx.googlecode.com/files/MPlayerX-1.0.21.zip',
    })
  end
end
