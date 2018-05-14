#!/usr/bin/ruby
# -*- coding: utf-8 -*-
def in_keyword()
    puts("") #改行
    print "Input the Keyword for Search:" #検索文字列の入力を求める表示
    $keyword = gets.chop#入力させる
    $keyword = $keyword.toutf8  #文字コードの処理
    if $keyword=="" then #入力が空なら
        in_keyword(); #再度この関数を呼び出す
    end
    puts("") #改行

    #検索結果のページ数など必要な情報を同様に入力させる

    print "Start page:"
    $start = gets.chop
    puts("")
    print "End page:"
    $end = gets.chop
    puts("")

    #検索する文字列をURLエンコードする

    $escaped_keyword = CGI.escape($keyword)

    # 検索結果を開く
    i_search($start,$end);
end

def i_search(start, ender)
    i=start.to_i #開始するページ数をstringからintに変換

    while i <= ender.to_i do #終了するページ数までの間、以下をループ
        url = "https://www.bing.com/images/search?q=#{$escaped_keyword}" #検索文字列を入れたurlを作る
        url = url + "&first=" + ((i-1)*29).to_s #何番目の画像を最初に表示するかを追加　※後述
        $doc = Nokogiri.HTML(open(url)) #作成したurlでアクセスした結果をhtmlで取得
        j=0 #画像のカウンタ
        $doc.css('div.item > a').each do |a| #HTML内のdiv内のitemのaタグに関して以下をする
          a = a.match(%r!<a href="([^\"]+)">([^<]+)</a>!)
            $result[j]=a[2] #aタグのhref(画像のリンク)を取得
            puts $result[j] #画像のurlを画面に出力
            save_image($result[j]); #画像を保存する関数へ画像のリンクを渡す
            j=j+1; #画像のカウンタを増やす
        end

        p j #画像のカウンタを画面に出力
    i=i+1 #ページ数を増やす
    end

    p "i="+i.to_s #ページ数を画面に出力
end

def save_image(url)
  #その日の名前でディレクトリを作成
  dn = DateTime.now
  dt = dn.year.to_s + dn.mon.to_s + dn.day.to_s + "\\"
  #僕はカレントディレクトリにあるimgフォルダのの中に格納している
  dirName = "\img\\" + dt
  #同名のものが既にない場合のみディレクトリを作成
  FileUtils.mkdir_p(dirName) unless FileTest.exist?(dirName)


  #前回取得したurlにあるファイル名を取得
  fileName = File.basename(url)
  filePath = dirName + fileName

  #?などを含む名前はファイルにつけられないので変更
  if fileName.include?('?')
    dn = DateTime.now
    fileName='img' + dn.hour.to_s + 'h' + dn.min.to_s + 'm' + dn.sec.to_s + 's' + '.jpg'
  end

  #同名のファイルがある場合は変更
  if File.exist?(filePath)
    dn = DateTime.now
    fileName='img' + dn.hour.to_s + 'h' + dn.min.to_s + 'm' + dn.sec.to_s + 's' + '.jpg'
  end

  #改めて最終的なファイルパスを設定
  filePath = dirName + fileName

  #ファイルパスを出力  
  p filePath

  # 指定したパス(自分のディレクトリ)を開いて
  open(filePath, 'wb') do |output|
    #urlを開いて書き込み(保存)
    open(url) do |data|
      output.write(data.read)
    end
  end
end


require("kconv")
require("cgi")
require("nokogiri")
require("open-uri")

in_keyword()

save_image(url)
