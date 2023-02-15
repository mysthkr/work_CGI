# データを受け取り、返却するCGIプログラムの起動
require 'cgi'
cgi = CGI.new

# データを受け取った後、HTMLの形式でレスポンスを返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['bad_qlt']

  # HTMLでレスポンスを返却する
  "<html>
    <body>
      <p>品質が悪いもの（false）のgoyaの情報は下記になります。</p>
      <p>文字列：#{get}</p>
    </body>
  </html>"
}