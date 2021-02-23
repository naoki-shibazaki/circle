Event.seed(:id,

# matching => Match 1:連携/2:複数連携/0:非掲載
# place => Place 1:連携/0:非連携

  { :id => 2, :category_id => 1, :order => "01", :name => "バスケ" , :ruby => "basketball", :matching => 1, :place => 1, :openchat => "https://line.me/ti/g2/28860kzjimldNe2P9MOsqg", :txt => "バスケサークル・チーム" },
  { :id => 4, :category_id => 1, :order => "02", :name => "バレーボール" , :ruby => "volleyball",  :matching => 1, :place => 1, :openchat => "https://line.me/ti/g2/J2oirsmlRsHc1QVS4sFb6Q", :txt => "バレーサークル・チーム" },
  { :id => 8, :category_id => 1, :order => "03", :name => "フットサル" , :ruby => "futsal",  :matching => 1, :place => 1, :openchat => "https://line.me/ti/g2/jq0AbQjRV3XsyDnmvNidtA", :txt => "フットサルサークル・チーム" },
  { :id => 7, :category_id => 1, :order => "07", :name => "草野球" , :ruby => "baseball",  :matching => 1, :place => 1, :openchat => "https://line.me/ti/g2/StLPRlAGJPjl9rHX9BTXug", :txt => "草野球チーム・サークル" },
  { :id => 22, :category_id => 1, :order => "08", :name => "ソフトボール" , :ruby => "softball",  :matching => 1, :place => 1, :openchat => "https://line.me/ti/g2/StLPRlAGJPjl9rHX9BTXug", :txt => "ソフトボールチーム・サークル" },
  { :id => 16, :category_id => 1, :order => "09", :name => "サッカー" , :ruby => "soccer",  :matching => 1, :place => 1, :openchat => "", :txt => "サッカーチーム・サークル" },
  { :id => 25, :category_id => 1, :order => "27", :name => "ハンドボール" , :ruby => "handball",  :matching => 1, :place => 1, :openchat => "", :txt => "ハンドボールサークル・チーム" },

  { :id => 5, :category_id => 2, :order => "04", :name => "バドミントン" , :ruby => "badminton",  :matching => 1, :place => 1, :openchat => "https://line.me/ti/g2/9hLTdMzYeuiuO1fRinT_wQ", :txt => "バドミントンサークル・クラブ" },
  { :id => 9, :category_id => 2, :order => "05", :name => "テニス" , :ruby => "tennis",  :matching => 1, :place => 1, :openchat => "https://line.me/ti/g2/rQkRsdC0Ppg-xVTQVlQYgw", :txt => "テニスサークル" },
  { :id => 10, :category_id => 2, :order => "06", :name => "卓球" , :ruby => "table-tennis",  :matching => 1, :place => 1, :openchat => "", :txt => "卓球サークル・クラブ" },

  { :id => 3, :category_id => 3, :order => "21", :name => "ランニング" , :ruby => "running",  :matching => 0, :place => 0, :openchat => "", :txt => "ランニング・マラソンサークル" },
  { :id => 21, :category_id => 3, :order => "22", :name => "ボルダリング" , :ruby => "bouldering",  :matching => 0, :place => 0, :openchat => "", :txt => "ボルダリングサークル" },
  { :id => 15, :category_id => 3, :order => "56", :name => "オールラウンド" , :ruby => "all-round",  :matching => 2, :place => 0, :openchat => "", :txt => "オールラウンドサークル" },
  { :id => 23, :category_id => 3, :order => "29", :name => "ビーチスポーツ" , :ruby => "beach-sports",  :matching => 1, :place => 0, :openchat => "", :txt => "ビーチスポーツ" },

  { :id => 20, :category_id => 4, :order => "28", :name => "スノーボード" , :ruby => "snow-board",  :matching => 0, :place => 0, :openchat => "", :txt => "スノーボードサークル" },

  { :id => 27, :category_id => 5, :order => "59", :name => "ヨガ" , :ruby => "yoga",  :matching => 0, :place => 0, :openchat => "", :txt => "ヨガサークル" },
  { :id => 6, :category_id => 5, :order => "23", :name => "筋トレ・合トレ" , :ruby => "work-out",  :matching => 0, :place => 0, :openchat => "", :txt => "筋トレ・合トレ" },

  { :id => 1, :category_id => 6, :order => "51", :name => "写真・カメラ" , :ruby => "camera",  :matching => 0, :place => 0, :openchat => "https://line.me/ti/g2/MrGVZOgwkBEGzRpvagL-Cw", :txt => "写真・カメラサークル" },
  { :id => 12, :category_id => 6, :order => "53", :name => "イベント" , :ruby => "event",  :matching => 0, :place => 0, :openchat => "", :txt => "イベントサークル" },

  { :id => 17, :category_id => 7, :order => "26", :name => "ロードバイク" , :ruby => "road-bike",  :matching => 0, :place => 0, :openchat => "", :txt => "ロードバイクサークル" },
  { :id => 18, :category_id => 7, :order => "52", :name => "登山" , :ruby => "mountain",  :matching => 0, :place => 0, :openchat => "", :txt => "登山サークル" },

  { :id => 19, :category_id => 8, :order => "24", :name => "ダンス" , :ruby => "dance",  :matching => 0, :place => 0, :openchat => "", :txt => "ダンスサークル" },
  { :id => 14, :category_id => 8, :order => "25", :name => "よさこい" , :ruby => "yosakoi",  :matching => 0, :place => 0, :openchat => "", :txt => "よさこいチーム・サークル" },

  { :id => 13, :category_id => 9, :order => "58", :name => "音楽" , :ruby => "music",  :matching => 0, :place => 0, :openchat => "", :txt => "音楽サークル" },

  { :id => 11, :category_id => 10, :order => "57", :name => "ゲーム" , :ruby => "game",  :matching => 1, :place => 0, :openchat => "", :txt => "ボードゲーム・ゲームサークル" },

  { :id => 24, :category_id => 11, :order => "54", :name => "学生団体" , :ruby => "student-group",  :matching => 0, :place => 0, :openchat => "", :txt => "学生団体" },
  { :id => 26, :category_id => 11, :order => "55", :name => "ボランティア" , :ruby => "volunteer",  :matching => 0, :place => 0, :openchat => "", :txt => "ボランティアサークル" }



)