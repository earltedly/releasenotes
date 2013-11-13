require_relative "releasenotes/version"
require_relative "releasenotes/options"
require_relative "releasenotes/hockey"

module Releasenotes
  class Runner
  	def initialize(argv)
  		@options = Options.new(argv)
  	end

  	def run
  		commit = @options.last_commit
  		if commit.nil?
  			hockey = Hockey.new(app_public_id: @options.app_token, user_api_key: @options.user_token)
  			commit = hockey.last_commit
  		end

      if commit.nil?
        return
      end

  		entries = `git log #{commit}..HEAD | grep -E -v "(^commit|^Author|^Date|^Merge|\[#.*\])" | cut -c 5-`.split("\n").delete_if { |entry| entry.length == 0 }
  		puts entries.join("\n")

  		last_commit = COMMIT_REGEX.match(`git log | head -n1`)[0]
  		puts "\n#{last_commit}"
  	end
  end
end
