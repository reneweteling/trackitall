# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#


# require turbolinks






$ ->
  $('.datetimepicker').datetimepicker 
    format: 'YYYY-MM-DD HH:mm', 
    sideBySide: true



  # instantiate the bloodhound suggestion engine
  numbers = new Bloodhound(
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('num')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    local: [
      { num: 'one' }
      { num: 'two' }
      { num: 'three' }
      { num: 'four' }
      { num: 'five' }
      { num: 'six' }
      { num: 'seven' }
      { num: 'eight' }
      { num: 'nine' }
      { num: 'ten' }
    ])
  # initialize the bloodhound suggestion engine
  numbers.initialize()

  # instantiate the typeahead UI
  $('.typeahead').typeahead null,
    displayKey: 'num'
    source: numbers.ttAdapter()
  
