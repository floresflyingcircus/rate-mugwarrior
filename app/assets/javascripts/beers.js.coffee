jQuery ->
  $('#beer_brewery_name').autocomplete
    source: $('#beer_brewery_name').data('autocomplete-source')
    messages: {
        noResults: '',
        results: ''
    }