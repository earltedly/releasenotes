# Releasenotes

Compiles together release notes from the current git repository, optionally fetching the most recent commit number from Hockey.

## Installation

Add this line to your application's Gemfile:

    gem 'releasenotes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install releasenotes

## Usage

### Without Hockey:
- releasenotes -c [git commit SHA1]

### With Hockey:
- releasenotes -a [hockey_app_token] -u [hockey_user_token]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
