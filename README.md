# Requirements install instructions for Ubuntu 20.04.3 LTS

## Install RVM
1. Install the GPG Keys used to verify installation package:
```
sudo apt install gnupg2
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
```
2. Install the RVM with
```
curl -sSL https://get.rvm.io/ | bash -s stable
```
3. Then, restart the system and enter `rvm cleanup all` on the Terminal
4. Check the Run command as login shell option in the Profile Preferences

## Install Ruby 3.1.0 using RVM
Just enter `rvm install 3.1.0` on the Terminal

## Installing and setting Bundler in the project
1. Enter the following on the Terminal
```
gem install bundler
Generate the Gemfile
bundle init
```

## Install and setting Rspec
1. Open the Gemfile edit it with:
```
source "https://rubygems.org"

gem 'rspec'
```
2. Enter `bundle install` on the Terminal
3. Enter `rspec --init` and paste the `open_spec.rb` and `line_spec.rb` into the `spec` folder (if you haven't the files already).
