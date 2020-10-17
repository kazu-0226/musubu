module ChatMessagesHelper
    # uriライブラリを呼び出す
    require "uri"
 
    def content_url_to_link(content)
        # URI.extractで引数の[“http”, “https”].uniqで引数のcontentが「httpかhttps」のいずれかで始まるテキスト要素を重複を削除した形で配列を生成
        URI.extract(content, ["http", "https"]).uniq.each do |url|
            # 「gsub!」メソッドでcontentをの値を”< a href=”#{url}”target=”_blank”>#{url}</a>”に置換
            content.gsub!(url, "<a href='#{url}' target='_blank'>#{url}</a>")
        end
        content
    end
end
