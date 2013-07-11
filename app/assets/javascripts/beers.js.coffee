jQuery ->
  $('#beer_brewer_name').autocomplete
    source: $('#beer_brewer_name').data('autocomplete-source')
    messages: {
        noResults: '',
        results: ''
    }