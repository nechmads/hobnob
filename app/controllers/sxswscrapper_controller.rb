class SxswscrapperController < ApplicationController
  def getevents
    agent = Mechanize.new
    page = agent.get('http://schedule.sxsw.com/?conference=&day=11')
    results = Array.new
    page.search(".//div[@class='item']").each do |item|
      item.search(".link_itemInteractive").each do |title|
        results << (title.content).strip
      end
    end
     render :json => results
  end
  
end