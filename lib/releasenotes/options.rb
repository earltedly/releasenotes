require 'optparse'

module Releasenotes
	class Options
		attr_reader :user_token, :app_token, :last_commit

		def initialize(argv)
			parse(argv)
		end

		private

		def parse(argv)
			OptionParser.new do |opts|
				opts.banner = "Usage: #{$0} [options]"
				
				opts.on('-u', '--usertoken [TOKEN]', 'the hockey user token') do |token|
					@user_token = token
				end

				opts.on('-a', '--apptoken [TOKEN]', 'the app token to use') do |token|
					@app_token = token
				end

				opts.on('-c', '--commit [COMMIT]', 'the commit to find logs from') do |commit|
					@last_commit = commit
				end

				opts.on_tail('-h', '--help', 'display this help and exit') do
					puts opts
					exit
				end

				begin
					argv = ['-h'] if argv.empty?
					opts.parse!(argv)

					if @last_commit.nil? and (@app_token.nil? or @user_token.nil?)
						STDERR.puts "You must specify both an app token and a user token for hockey"
						exit(-1)
					end
					
				rescue OptionParser::ParseError => e
					STDERR.puts e.message, "\n", opts
					exit(-1)
				end
			end
		end
	end
end