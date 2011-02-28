class EventsController < ApplicationController
  #before_filter :protect_resource
  
  def index
    respond_to do |format|
      format.json {
        if (params[:track])
          events = get_events_by_track(params[:track])
        else 
          events = get_events_by_collection(params[:collection])
        end

        render :json => events
      }
    end
  end
  
  private
    def get_events_by_track (track_id, date = Time.now)
      Event.find_all_by_track(track_id)
    end
    
    def get_events_by_collection (collection_id, date = Time.now)
      events = Event.where(:collection => collection_id).includes(:place) unless collection_id == nil
      events.map! {|e|
        event_place = Place.find(e.place_id)
        e.attributes.merge({:place_name => event_place.name,
                            :lat => event_place.lat,
                            :lng => event_place.lng,
                            :foursquare_id => event_place.foursquare_id,
                            :type_name => get_event_type_name_by_type_id(e.event_type),
                            :track_name => get_track_name_by_track_type_id(e.track)})
      }

      return events
    end
    
    def get_event_type_name_by_type_id(type_id)
      case type_id
      when 1
        return "Lounge"
      when 2
        return "Panel"
      when 3
        return "Screening"
      else
        return "Other"
      end
    end
    
    def get_track_name_by_track_type_id(track_id)
      case track_id
      when 1
        return "Interactive"
      when 2
        return "Music"
      when 3
        return "Film"
      else
        return "Other"
      end
    end
end
