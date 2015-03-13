# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Date
Date::DATE_FORMATS[:default] = I18n.t 'date.formats.default'
# Time
Time::DATE_FORMATS[:default] = I18n.t 'time.formats.default'
