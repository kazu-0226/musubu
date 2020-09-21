class Batch::CategoryCreate
    def self.g_category
        #requireメソッドで下記のライブラリを読み込む
        require 'net/http'
        require 'uri'
        require 'json'
        #URIライブラリを用いて、URLの文字列をURIオブジェクトへと生成してuriに代入（parse)
        uri = URI.parse("https://api.gnavi.co.jp/master/CategoryLargeSearchAPI/v3/?keyid=#{ENV['GNAVI_API_KEY']}")
        #Net::HTTPライブラリを用いて、URIにgetリクエストを送り、jsonへ代入
        json = Net::HTTP.get(uri)
        #上記で取得したjsonをJSONとして解析してresultへ代入
        result = JSON.parse(json)
        result['category_l'].each { |row|
            unless Category.exists?(code: row['category_l_code'])
              Category.new(name: row['category_l_name'], code: row['category_l_code']).save
            end
        }
        p "カテゴリを追加しました"
    end

end