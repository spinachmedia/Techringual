class Merge
    
    def self.execute
        
        # 集計結果をマージする
        # WordMst => WordRankInfo
        # WordMstは、URLごとのランキング
        # WordRankInfoは、コンテンツごとのランキングとする
        margeWordRank
        
    end
    
    def self.margeWordRank
       
        #サイトの一覧を取得
        sites = SiteMst.all
        sites.each do |site|
            
            #結果を格納するハッシュ
            words = WordMst.where(site_id: site.id).group(:word).sum(:count)
            words.each do |k,v|
                w = WordRankInfo.new
                w.word = k
                w.count = v
                w.site_id = site.id
                w.save
            end
       end
    end #def
    
end


Merge.execute