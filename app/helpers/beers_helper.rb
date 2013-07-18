module BeersHelper

  def link_to_next_beer_ranking
    beer = Beer.find_random_unranked_beer_for(current_user)
    if beer
      link_to "Rank", get_beer_url(beer.id)
    else
      "All beers Ranked"
    end
  end

  def url_for_next_beer_ranking
    beer = Beer.find_random_unranked_beer_for(current_user)

    if beer
      return get_beer_url(beer.id)
    else
      return beers_path
    end
  end


  def get_beer_url(beer_id)
  	new_beer_rating_path(beer_id)
  end
end
