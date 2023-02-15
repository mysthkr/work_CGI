# データを受け取り、返却するCGIプログラムの起動
require 'cgi'
cgi = CGI.new

# データを受け取った後、HTMLの形式でレスポンスを返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['non_give']

  # HTMLでレスポンスを返却する
  "<html>
    <body>
      <p>譲渡先が自家消費ではないもののgoyaの情報は下記になります。</p>
      <p>文字列：#{get}</p>
    </body>
  </html>"
}