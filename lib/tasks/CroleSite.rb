class CroleSite

    #一度クロールしたURLを格納
    @@croled_url = []
    
    def self.execute
        
        #モデルからクロール対象を取り出す
        datas = SiteMst.all
        
        #各サイトで再帰的にクロール
        datas.each do |site_data|
            
            url = site_data.home_url
            countWordWithUrl(site_data,url)
            
        end #each
        
    end
    
    def self.countWordWithUrl (site_data,url)
        
        crole_url = url
        
        #クエリストリングを削除
        crole_url.gsub!(/\?.+$/,"")
        
        #クロール済みのURLであればスキップ
        if @@croled_url.include?(crole_url) 
            puts "クロール済みURLであるためスキップ :" + crole_url
           return 
        end
        
        #クロール済みにカウント
        @@croled_url.push(crole_url)
        
        # URLからページ内の単語の配列を取得
        words = croleUrl(crole_url)
        
        # 配列をマージし、[単語,個数]のHashに変換
        wordHash = countArray(words)
        
        # puts "delete before: " + WordMst.count.to_s
        #いれる予定のURLのレコードを全て削除
        WordMst.where(url: crole_url).destroy_all
        # puts "delete after: " + WordMst.count.to_s
        
        # ハッシュをテーブルに突っ込む
        insertHash(wordHash,crole_url,site_data.id)
        
        # URLから有効なリンクを取得
        links = getLinks(crole_url)
        
        #リンクを再帰的に処理
        links.each do |link|
            next_url = site_data.base_url + link
            countWordWithUrl(site_data,next_url)
        end
        
    end
    
    def self.getLinks url
        
        puts "リンクを取得するURL: " + url
        uri = URI.parse(url)
        string = Net::HTTP.get(uri)
        #bodyの中身だけを抽出
        string.gsub!(/^.*<body.*?>(.+)<\/body>.*/ ,'\1')
        #aタグだけを抽出
        urls = string.scan(/href="\/(.*?)"/) 
        urls.flatten!
        result = []
        urls.each do |data|
            if data.match(/(ico|jpeg|jpg|png|gif)$/i)
                next   
            end
            if data.match(/^http/i)
                next   
            end
            if data.match(/^#/i)
                next   
            end
            if data.match(/^\//i)
                next   
            end
            if data.match(/^java/i)
                next   
            end
            if data.match(/(\.css\/\.js)/i)
                next   
            end
            result.push data
        end
        #配列を返す
        return result
        
    end
    
    def self.croleUrl url 
        puts "これからクロールする: " + url.to_s
        uri = URI.parse(url)
        string = Net::HTTP.get(uri)
        #bodyの中身だけを抽出
        string.gsub!(/^.*<body.*?>(.+)<\/body>.*/ ,'\1')
        #scriptを削除
        string.gsub!(/<script.*?>.+<\/script>.*/ ,' ')
        #コメントアウトを削除
        string.gsub!(/<!--.*?-->/ ,' ')
        #タグを削除
        string.gsub!(/<.+?>/ ,' ')
        #, . を削除
        string.gsub!(/[,.\*]/," ")
        #英語以外を削除
        string.gsub!(/[^a-zA-Z]/," ")
        #空白を削除
        string.gsub!(/\s+/," ")
        #1～2文字のデータを削除
        string.gsub!(/\s\S\s/," ")
        string.gsub!(/\s\S\S\s/," ")
        string.gsub!(/\s\w\s/," ")
        string.gsub!(/\s\w\w\s/," ")
        # puts string
        string.downcase!
        
        # 配列に変換
        words = string.split(" ")
        
        return words
    end
    
    #それぞれを調べる
    def self.countArray words
        hash = Hash.new
        words.each do |word|
            hash[word] = words.count(word)
        end
        return hash
    end
    
    def self.insertHash (hash,url,id)
        puts "クロール完了。インサートするデータ：" + hash.count.to_s
        # 全部DBに突っ込む
        hash.each do |key,val|
           
            wordMst = WordMst.new
            wordMst.word = key
            wordMst.count = val
            wordMst.site_id = id
            wordMst.url = url
            wordMst.save
            
        end #each
        puts "レコード合計: " + WordMst.count.to_s
    end
    
end


CroleSite.execute