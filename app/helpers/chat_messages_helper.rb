module ChatMessagesHelper
  # uriライブラリを呼び出す
  require "uri"
 
  def content_url_to_link(content)
    # 左右のパーシャルで呼び出すため、contentが二重に書き換えられるのを防ぐため、dupメソッドでコピーしてcontentを複数用意する
    dup_content = content.dup
    # URI.extractで引数の[“http”, “https”].uniqで引数のcontentが「httpかhttps」のいずれかで始まるテキスト要素を重複を削除した形で配列を生成
    URI.extract(dup_content, ["http", "https"]).uniq.each do |url|
    # 「gsub!」メソッドでcontentをの値を”< a href=”#{url}”target=”_blank”>#{url}</a>”に置換
      dup_content.gsub!(url, "<a href='#{url}' target='_blank'>#{url}</a>")
    end
      dup_content
  end
  
end
