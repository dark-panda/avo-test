# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin' do
  include BrowserTestHelper

  before do
    stub_request(:post, 'https://avohq.io/api/v1/licenses/check')
      .with(headers: {
        'Accept' => '*/*',
        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Type' => 'application/json',
        'User-Agent' => 'Ruby'
      })
      .to_return(
        status: 200,
        headers: {},
        body: {
          id: 'pro',
          valid: true,
          expiry: 1.hour,
          license: 'pro',
          license_key: 'license_123',
          environment: 'test',
          ip: '127.0.0.1',
          host: 'avodemo.herokuapp.test',
          port: 3001
        }.to_json
      )
  end

  context 'with no user' do
    it 'redirects to the login page' do
      visit avo.root_path

      expect(page).to have_link('Users', href: '/avo/resources/users')
    end
  end
end
