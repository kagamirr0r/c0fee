require 'i18n'
I18n.locale # => :en
I18n.locale = :ja
I18n.locale # => :ja
require 'faker'
I18n.locale = 'ja'
Faker::Config.locale # => :ja
Faker::Internet.email # => ".@.com"
