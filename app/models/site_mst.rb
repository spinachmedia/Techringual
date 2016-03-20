class SiteMst < ActiveRecord::Base
    
    def getRanking
        return WordRankInfo.where("site_id = " + self.id.to_s ).order("count DESC")
    end
    
end
