require 'net/https'
require 'uri'
require 'json'
require_relative 'helpers'

module Releasenotes
	class Hockey
		attr_reader :app_versions

		def initialize(app_public_id: nil, user_api_key: nil)
			@app_public_id = app_public_id
			@user_api_key = user_api_key

			fetch_app_versions()
		end

		def last_commit
			if @app_versions.nil?
				return nil
			end
			
			@app_versions.each do |version|
				notes = version['notes']
				match = COMMIT_REGEX.match(notes)
				if match.nil?
					next
				end
				return match[0]
			end
		end

		protected

		def fetch_app_versions
			uri = URI("https://rink.hockeyapp.net/api/2/apps/#{@app_public_id}/app_versions")
			https = Net::HTTP.new(uri.host, uri.port)
			https.use_ssl = true
			request = Net::HTTP::Get.new(uri.path)
			request['X-HockeyAppToken'] = @user_api_key
			result = https.request(request)

			json = JSON.parse(result.body)
			if not json['errors'].nil?
				puts "Hockey error: " + json['errors'].to_s
			else
				@app_versions = json['app_versions']
			end
		end
	end
end