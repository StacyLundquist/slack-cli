require 'httparty'

class SlackError < Exception; end


# def get_location(search_term)
#   query = {
#       q: search_term,
#       key: KEY,
#       format: "json",
#   }
#   response = HTTParty.get(BASE_URL, query: query)
#
#   unless response.code == 200
#     raise SearchError, "Cannot find #{search_term}"
#   end
#
#   return {
#       search_term => {
#           lat: response.first["lat"],
#           lon: response.first["lon"],
#       },
#   }
# end