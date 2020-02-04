<?php
/*
Template Name: 	10_recruit
*/
?>

<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title><?php wp_title('|', true, 'right'); ?></title>

<link rel="alternate" type="application/rss+xml" title="<?php bloginfo('name'); ?> RSS Feed" href="<?php bloginfo('rss2_url'); ?>" />
<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />

<!-- 追加CSS -->
  <link rel="stylesheet" href="<?php bloginfo('template_url');?>/style-1.css" />
  <link rel="stylesheet" href="<?php bloginfo('template_url');?>/responsive-1.css" />
  <!-- <link rel="stylesheet" href="<?php bloginfo('template_url');?>/base.css" /> -->

<!-- slick -->
<link href="<?php bloginfo('template_url');?>/slick/slick-theme.css" rel="stylesheet" type="text/css">
<link href="<?php bloginfo('template_url');?>/slick/slick.css" rel="stylesheet" type="text/css">

<?php wp_head(); ?>
</head>

<body>

<!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-WHH7CJ"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-WHH7CJ');</script>
<!-- End Google Tag Manager -->

<script>
document.addEventListener( 'wpcf7mailsent', function( event ) {
    ga('send', 'event', 'Contact Form', 'submit');
}, false );
</script>

<div id="wrapper">


<div class="header">
  <div class="header_recruit">
    
  <h1 class="header_title"><?php echo get_the_title(); ?></h1>

	<div class="header_cta">
		<div class="header_tel">
		  <a href="tel:08011870786" onclick="ga('send', 'event', 'smartphone', 'phone-number-tap', 'main');"><span class="header_tel_kanto">
		  	<i class="fa fa-tablet"></i> 関東：080-1187-0786
		  </span></a>
		</div>

		<div class="header_tel">
		  <a href="tel:08096074931" onclick="ga('send', 'event', 'smartphone', 'phone-number-tap', 'main');"><span class="header_tel_kanto">
		  	<i class="fa fa-tablet"></i> 関西：080-9607-4931
		  </span></a>
		</div>

		<div class="header_mail">
		  <a href="#jump"><span class="header_mail_link">
		  	<i class="fa fa-envelope-o"></i> お問い合わせ</span></a>
		</div>
	</div>

<!--   <div class="header_2nd_txt">
    <img src="https://photomo.jp/wp-content/uploads/catch_2nd_01.png" alt="二次会カメラマンをお探しの方へ" class="catch_2nd_01">
    <img src="https://photomo.jp/wp-content/uploads/catch_2nd_02.png" alt="ゲストにも喜ばれる写真撮影なら" class="catch_2nd_02">
    <img src="https://photomo.jp/wp-content/uploads/catch_2nd_03.png" alt="PhotoMoフォトモにお任せ！" class="catch_2nd_03">
  </div> -->

	<div class="header_recruit_txt">
		<div class="recruit_title">
			結婚式二次会（1.5次会）の<br>
			カメラマン募集・求人
		</div>
	</div>


	<div class="scroll"><a href="#menu"><span></span>Scroll</a></div>

  </div>
</div>

<!-- /header -->



<div id="menu">
  <nav class="nav">
    <ul>
      <li><a href="#" class="nav_tag"><img src="https://photomo.jp/wp-content/uploads/logo_white.png" alt="PhotoMo"></a></li>
      <li><a href="#jump01" class="nav_tag">選ばれる理由</a></li>
      <li><a href="#jump02" class="nav_tag">募集要項</a></li>
      <li><a href="#jump03" class="nav_tag">カメラマンの声</a></li>
      <li><a href="#jump04" class="nav_tag">撮影までの流れ</a></li>
      <li><a href="#jump05" class="nav_tag">撮影実績</a></li>
      <li><a href="#jump06" class="nav_tag">Q＆A</a></li>
      <li><a href="#jump07" class="nav_tag">応募する</a></li>
      <li><div class="fb-like" data-href="https://www.facebook.com/photomo24/" data-layout="button_count" data-action="like" data-show-faces="false" data-share="false"></div></li>
    </ul>
  </nav>
</div>  


<!-- cont02 --> 


<div class="cont02" id="jump01">
<div class="cont02_frame">

	<h2 class="cont02_title"><img src="https://photomo.jp/wp-content/uploads/tsuyomi.png" alt="PhotoMo（フォトモ）が選ばれる３つの理由"></h2>

 <div class="cont02_01">

 	<div class="tsuyomi">
		<h3 class="tsuyomi_title"><span class="tsuyomi_riyu">理由１</span>働き方は自由！</h3>
		<div class="tsuyomi_frame"><img src="https://photomo.jp/wp-content/uploads/recruit_01.jpg" alt=""></div>

		<h4><span class="tsuyomi_subtitle">スケジュールに合わせた働き方</span></h4>
		<p>
		ご登録いただいているカメラマンは、担当者とLINEでやり取りを行い、ご自身のスケジュールに合わせて撮影をすることができます。土日のどちらかのみ撮影など、柔軟に対応することができます！
		</p>

		<h4><span class="tsuyomi_subtitle">1日2件の撮影も可能</span></h4>
		<p>
		結婚式二次会の時間が合えば、1日に2件撮影に行くことも可能です。その場合は、なるべく近い会場の撮影を優先いたしますので、移動時間も短縮できます！
		</p>

	</div>
	<div class="clear"></div>


 	<div class="tsuyomi">
		<h3 class="tsuyomi_title"><span class="tsuyomi_riyu">理由２</span>機材の無料レンタル！</h3>
		<div class="tsuyomi_frame"><img src="https://photomo.jp/wp-content/uploads/recruit_02.jpg" alt=""></div>

		<h4><span class="tsuyomi_subtitle">無料で機材も貸します</span></h4>
		<p>
		機材が一式揃っていなくても、足りない分は無料でレンタルすることもできますので、初心者の方でもご安心ください！
		</p>

		<h4><span class="tsuyomi_subtitle">カメラやレンズなどもOK</span></h4>
		<p>
		無料レンタルでは、カメラやレンズ、ストロボなどの用意がございます。柔軟に対応しますので、お気軽にご相談ください！
		</p>

	</div>
	<div class="clear"></div>


 	<div class="tsuyomi">
		<h3 class="tsuyomi_title"><span class="tsuyomi_riyu">理由３</span>カメラマンへの負担が少ない！</h3>
		<div class="tsuyomi_frame"><img src="https://photomo.jp/wp-content/uploads/recruit_03.jpg" alt=""></div>

		<h4><span class="tsuyomi_subtitle">やり取りはフォトモが担当</span></h4>
		<p>
		お客様（新郎新婦）とのやり取りは、基本的に全てフォトモが行います。カメラマンへの負担が少ないです！
		</p>

		<h4><span class="tsuyomi_subtitle">納品方法も簡単</span></h4>
		<p>
		撮影後のデータの納品は、指定のオンラインシステム上にアップロードするだけ！DVDなどの配送はございません！
		</p>

	</div>
	<div class="clear"></div>

	</div>

</div></div>
<!-- cont02 -->


<div class="cont04" id="jump02">
<div class="cont04_frame">

<div class="cont04_title_frame cont04_title_wrap">
  <h2 class="cont04_title_heading"><span>カメラマンの募集要項</span></h2>
</div>

<div id="jump_price"></div>
	<h3 class="cont04_title"><span class="cont04_tokuten">募集要項</span></h3>
	<div class="cont04_01">	
	
	<div class="cont04_01_txt">
	<h4><span class="cont04_subtitle">募集エリア</span></h4>
	<p>関東エリア／関西エリア／東海エリア<br>※東海エリアの場合、エリアマネージャーを募集しています</p>

	<h4><span class="cont04_subtitle">カメラ機材</span></h4>
	<p>一眼レフ／標準レンズ／ストロボ<br>※機材がない場合は無料レンタルも行っています</p>

	<h4><span class="cont04_subtitle">報酬金額</span></h4>
	<p>平均金額10,000円＋指名料などのインセンティブ</p>

	</div></div>


</div>
</div>
<!-- cont04 -->


<div class="cont06" id="jump03">

<div class="cont04_title_frame cont04_title_wrap">
  <h2 class="cont04_title_heading"><span>カメラマンの声</span></h2>
</div>


<div class="voices_scroll">



	<!-- voice　set c -->
	<div class="voices_wrap">
		<div class="voice_top">
		<div class="voice_c_frame"></div>
		<div class="voice_place">
		<span class="title_initial">Kさん</span>
		<h3><span class="title_place">趣味からカメラマンへ</span></h3>
			<div class="tags_place">
				<div class="tag">関東</div>
				<div class="tag">二次会</div>
			</div>


		</div></div>
		
		<div class="clear"></div>
		
		<div class="voice_txt">

		<p><span class="dot">
		フォトモでカメラマンをするようになったのは、友人からの紹介がきっかけでした！<br>
		もともと、趣味や友人からの依頼でインフルエンサーやインスタグラムの素材を撮影することはあったのですが、もっと本格的にスキルとして身に付けたいと思っていたところ、紹介してもらったのでタイミング的にもよかったです。
		</span></p>

		<p><span class="dot">
		実際初めてみてから、サポート体制がとてもありがたかったと思っています。<br>
		まず、今までほぼ独学で勝手にやっていたのですが、しっかりとした知識から教えてもらいました。<br>
		また、撮影に必要なアイテム(ストロボや予備のカメラ等)も貸していただき、一人で撮影できるようになるまで、撮影指導もしていただきました！
		</span></p>

		<p><span class="dot">
		そのおかげで、スキルはしっかりついて、フォトモ以外でもカメラマンとしてお金をいただけるまでになりました！
		</span></p>

		</div>


	<div class="clear"></div>
	</div>

	<div class="margin_06"></div>

	<!-- voice　set c -->

	<!-- voice　set c -->
	<div class="voices_wrap">
		<div class="voice_top">
		<div class="voice_c_frame"></div>
		<div class="voice_place">
		<span class="title_initial">Sさん</span>
		<h3><span class="title_place">フリーランスのカメラマン</span></h3>
			<div class="tags_place">
				<div class="tag">関東</div>
				<div class="tag">二次会</div>
			</div>


		</div></div>
		
		<div class="clear"></div>
		
		<div class="voice_txt">

		<p><span class="dot">
		フォトモで様々な撮影を経験して、撮影技術やお客様とのコミュニケーションなど様々な部分で成長できたと感じています。
		</span></p>

		<p><span class="dot">
		現在はフリーランスのカメラマンとして活動をしていますが、ストロボの光の当て方や構図、写真の編集技術などはフォトモで学んだことが活かされています。<br>撮影は土日がほとんどで、当日までのお客様とのやり取りはフォトモのスタッフが担当するため、平日に他のお仕事をされている方でも始められます。
		</span></p>

		<p><span class="dot">
		基本的には自前のカメラで撮影するのですが、メインカメラが故障した時用のサブ機やレンズは貸与されるため、私は安心して撮影に臨めました。
		</span></p>

		</div>


	<div class="clear"></div>
	</div>

	<div class="margin_06"></div>

	<!-- voice　set c -->

	<!-- voice　set c -->
	<div class="voices_wrap">
		<div class="voice_top">
		<div class="voice_c_frame"></div>
		<div class="voice_place">
		<span class="title_initial">Yさん</span>
		<h3><span class="title_place">平日会社員、休日カメラマン</span></h3>
			<div class="tags_place">
				<div class="tag">関東</div>
				<div class="tag">二次会</div>
			</div>


		</div></div>
		
		<div class="clear"></div>
		
		<div class="voice_txt">

		<p><span class="dot">
		もともとカメラは趣味でした。<br>自分の撮影スキルで人の幸せを記録することができたらきっと嬉しいだろうとここのカメラマンとして登録しました。
		</span></p>

		<p><span class="dot">
		ファインダーを通して新郎新婦の幸せの姿を見るのは喜ばしいことですし、撮影後に新郎新婦からありがとうと言ってもらえることが何よりも嬉しい瞬間です。
		</span></p>

		</div>


	<div class="clear"></div>
	</div>

	<div class="margin_06"></div>

	<!-- voice　set c -->	

	<!-- voice　set c -->
	<div class="voices_wrap">
		<div class="voice_top">
		<div class="voice_c_frame"></div>
		<div class="voice_place">
		<span class="title_initial">Fさん</span>
		<h3><span class="title_place">フリーランスのカメラマン</span></h3>
			<div class="tags_place">
				<div class="tag">関東</div>
				<div class="tag">二次会</div>
			</div>


		</div></div>
		
		<div class="clear"></div>
		
		<div class="voice_txt">

		<p><span class="dot">
		フォトモのカメラマンで実際に「写真を仕事することの楽しさと大変さ」を知りました。
		</span></p>

		<p><span class="dot">
		「自分が撮りたい写真」ではなく「お客様に喜んでもらえる写真」を撮ることはとても難しく、最初は緊張しましたが、徐々に喜んでもらえるようになり、自分に自信がついてきました。
		</span></p>

		<p><span class="dot">
		写真経験が少ない僕にでも親身に教えていただき、今までに50件以上の撮影を経験しました。<br>
		もし「写真で仕事したい」と考えている人がいたら、ぜひフォトモで挑戦してみて欲しいです。
		</span></p>

		</div>


	<div class="clear"></div>
	</div>

	<div class="margin_06"></div>

	<!-- voice　set c -->	
	
	<!-- voice　set c -->
	<div class="voices_wrap">
		<div class="voice_top">
		<div class="voice_c_frame"></div>
		<div class="voice_place">
		<span class="title_initial">Iさん</span>
		<h3><span class="title_place">未経験からカメラマンへ</span></h3>
			<div class="tags_place">
				<div class="tag">関東</div>
				<div class="tag">二次会</div>
			</div>


		</div></div>
		
		<div class="clear"></div>
		
		<div class="voice_txt">

		<p><span class="dot">
		フォトモで初めて二次会の撮影をするようになりましたが、事前の説明やサポートが充実しておりとても撮影に臨みやすいです。
		</span></p>

		<p><span class="dot">
		お客様のご要望や会場の内装などをフォトモの方でやりとりしていただけて、分かりやすくまとめて必要な情報を送って頂けるので、安心して撮影に臨むことができています。
		</span></p>

		<p><span class="dot">
		お客様から嬉しいお声を頂いた時は幸せな瞬間を形にできたと実感でき、とても嬉しく、撮影できて良かったなと思います。
		</span></p>

		</div>


	<div class="clear"></div>
	</div>

	<div class="margin_06"></div>

	<!-- voice　set c -->



</div>
</div><!-- cont06 -->



<div class="cont05" id="jump04">

<div class="cont04_title_frame cont04_title_wrap">
  <h2 class="cont04_title_heading"><span>二次会撮影までの流れ</span></h2>
</div>

	<div class="flow_frame">
	
		<div class="flow_f_recruit_01">
	    	<h3>1.撮影のご相談</h3>
	    	<img src="https://photomo.jp/wp-content/uploads/flow_01.jpg" alt="フォームより予約">
	    	撮影のご相談をLINEなどでさせていただきます。スケジュールなども柔軟に対応いたします。
		</div>
		
		<div class="flow_f_recruit_01">
			<h3>2.二次会の撮影</h3>
	    	<img src="https://photomo.jp/wp-content/uploads/flow_02.jpg" alt="結婚式二次会撮影">
	    	結婚式二次会の当日、新郎新婦さんの入場から会場撤退まで、ゲストも含め撮影をお願いいたします。
		</div>
				
		<div class="flow_f_recruit_01">
			<h3>3.撮影のご相談</h3>
	    	<img src="https://photomo.jp/wp-content/uploads/flow_03.jpg" alt="料金お支払い">
	    	撮影後、1週間以内に指定の場所にアップロードしていただきます。
		</div>

	</div>
	<div class="clear"></div>

</div><!-- cont05 -->




<div class="cont10" id="jump05">

<div class="cont04_title_frame cont04_title_wrap">
  <h2 class="cont04_title_heading"><span>撮影した二次会の会場</span></h2>
</div>

<div class="restaurant_scroll_frame">
	<div class="restaurant_scroll_wrap">

		<h3 class="restaurant_title">関東の二次会会場</h3>
		<ul>
			<li>NB CLUB 様</li>
			<li>グランドハイアット東京 様</li>
			<li>目黒雅叙園 様</li>
			<li>ベルタサローネ六本木 様</li>
			<li>My Humble House Tokyo 様</li>
			<li>The GARDEN 様</li>
			<li>カフェラ･ボエム オ台場 様</li>
			<li>Nomad Daikanyama 様</li>
			<li>カーサ アスティオン Annex Club Maruyama59 様</li>
			<li>ザクラブオブエクセレントコースト 様</li>
			<li>ヒルトン東京セントジョージバー 様</li>
			<li>Good view tokyo 様</li>
			<li>ブルーガーデン 様</li>
			<li>夫婦木神社 様</li>
			<li>プロント品川店 様</li>
			<li>ザ･リッツ･カールトン東京 パークビュールーム 様</li>
			<li>オペーク スシレストラン&ラウンジ 様</li>
			<li>OLD MAN'S UN 丸ノ内 様</li>
			<li>Logic 豊洲 (ロジック) 様</li>
			<li>リストランテ･アッティモ 様</li>
			<li>ガーデンレストラン オールデイ ダイニング 様</li>
			<li>CHOiCE! チョイス 様</li>
			<li>京王プラザホテル (新宿) アオゾラノ間 様</li>
			<li>Taronga (タロンガ) ホテル日航東京 様</li>
			<li>アンジェパティオ (Angepatio) 様</li>
			<li>モンテファーレ 様</li>
			<li>GUARDIAN DINING BAR&SOUL 様</li>
			<li>dining&bar KITSUNE 渋谷 様</li>
			<li>MEDUSA(恵比寿) 様</li>
			<li>Weekend Garage Tokyo 様</li>
			<li>大志満 高輪店 様</li>
			<li>横浜 クルーズ･クルーズ 様</li>
			<li>GINTO 銀座店 様</li>
			<li>シャルマンシーナ TOKYO 様</li>
			<li>ラ･ジュエ･ド･シエル幕張 様</li>
			<li>BON BON BAZAR 様</li>
			<li>青山 星ノナル木 様</li>
			<li>ARK HiLLS CAFE ~アークヒルズ カフェ~ 様</li>
			<li>赤坂シュビア 様</li>
			<li>レストランDANZERO 様</li>
			<li>TULIPANO 様</li>
			<li>グランドハイアット 様</li>
			<li>A971 東京ミッドタウン 様</li>
			<li>JAM ORCHESTRA 様</li>
			<li>BAR AURUM 様</li>
			<li>ロイヤルパークホテルザ汐留 様</li>
			<li>ラ･ココリコ渋谷(LA COCORICO ) 様</li>
			<li>アリスアクアガーデン銀座(Alice aqua garden Tokyo Ginza) 様</li>
			<li>サンルートプラザ東京 様</li>
			<li>カフェ ラ･ボエム オ台場 (Cafe La Boheme) 様</li>
			<li>恵比寿 Duo DOMO 2階Actsquare 様</li>
			<li>Pizzeria347 様</li>
			<li>ラ･ココリコ渋谷 様</li>
			<li>カチナ (Katsina) 様</li>
			<li>TO THE HERBS 目黒店 様</li>
			<li>TUBO CAFE 様</li>
			<li>グランシェール 葉山庵 様</li>
			<li>RISTORAZIONE LE BREZZE 様</li>
			<li>Zest Cantina オ台場 様</li>
			<li>ラロシェル山王 様</li>
			<li>Belgian Brasserie Court Brugge (ブルージュ) 新宿高島屋14F 様</li>
			<li>ホテル インターコンチネンタル 東京ベイ 5階ウィラード 様</li>
			<li>ナチュラルスタンス 様</li>
			<li>グッドビュー東京 様</li>
			<li>トラベルカフェ飯田橋店 様</li>
			<li>Ginger's beach 様</li>
			<li>マーサーブランチ 様</li>
			<li>カナルカフェ(CANAL CAFE) 様</li>
			<li>銀座クラシックホール 銀座ライオンビル6F 様</li>
			<li>Bears table 様</li>
			<li>GINZA Lounge ZERO 様</li>
			<li>CROSS TOKYO 様</li>
			<li>NOS 恵比寿 様</li>
			<li>Club Camelot 様</li>
			<li>目黒雅叙園 3階ノオリオン 様</li>
			<li>マイハンブルハウス トウキョウ(MY HUMBLE HOUSE TOKYO) 様</li>
			<li>清水園 様</li>
			<li>グラン･サウスオーシャンズ 海浜幕張 様</li>
			<li>TENOHA&STYLE RESTAURANT 様</li>
			<li>GRACE BALI グレースバリ 池袋本店 B1F 様</li>
			<li>アルタビスタガーデン 様</li>
			<li>ロイクラトンリゾート (LoyKratong Resort) 様</li>
			<li>XEX代官山 様</li>
			<li>GINZA NAMIKI ST.  NB CLUB 様</li>
			<li>Cafe Haus 様</li>
			<li>ラシーヌ(RACINES) 様</li>
			<li>VERANDA 様</li>
			<li>THE TOWER RESTAURANT YOKOHAMA 様</li>
			<li>ブルーガーデン (BLUE GARDEN) 様</li>
			<li>FRANZUYA(フランズーヤ)青山 様</li>
			<li>グランサイバーカフェ バグース池袋店 様</li>
			<li>グランドセントラル(大手町) 様</li>
			<li>シェフズ･ブイ 横浜ランドマークタワー店 様</li>
			<li>青山Green Grass Cafe 様</li>
			<li>アンセンブル バイマイハンブルハウス 様</li>
			<li>ザ･プリンスパークタワー東京地下2階中宴会場 様</li>
			<li>アリスアクアガーデントーキョー 様</li>
			<li>サクラダイニング TOKYO 様</li>
			<li>East Gallery 様</li>
			<li>FUKUROU 様</li>
			<li>南青山ゲストハウス ウェディング CONVIVION 様</li>
			<li>LIVING ROOM 様</li>
			<li>ViVi la verde 様</li>
			<li>THE SOUL OF SEOUL(ザ･ソウルオブソウル) 様</li>
			<li>TRUNK BY SHOTO GALLERY 様</li>
			<li>Bora bora ボラボラ DINNING&KARAOKE 様</li>
			<li>TOOTH TOOTH (トゥーストゥース) 様</li>
			<li>cafe STUDIO (カフェ ステュディオ) 様</li>
			<li>イタリアンテラスダイニング LE BREZZE 様</li>
			<li>cafe1045.5 様</li>
			<li>HUB 池袋東口店ANNEX (ハブ) 様</li>
			<li>Elegante Vita 様</li>
			<li>THE SKY ~Resort Lounge~ 様</li>
			<li>目黒雅叙園 3Fノカシオペアノ間 様</li>
			<li>シャルマンシーナ東京 様</li>
			<li>アウトバックステーキハウス 品川港南店 様</li>
			<li>ニューオータニザトップ 様</li>
			<li>MUSEO 様</li>
			<li>マンダリンオリエンタル東京 様</li>
			<li>グランドオリエンタルミナトミライ 様</li>
			<li>八芳園 5階シダー 様</li>
			<li>ザ キッチン サルヴァトーレ クオモ 銀座 様</li>
			<li>SUBIR AKASAKA TOKYO 様</li>
			<li>東京ロビー 丸ノ内店 様</li>
			<li>学士会館 様</li>
			<li>ハイアット リージェンシー 東京 様</li>
			<li>NOS恵比寿 様</li>
			<li>Banquet Restaurant FUKUROU 様</li>
			<li>恵比寿イーストギャラリー 様</li>
			<li>東京ミッドタウン｢ボタニカ｣ 様</li>
			<li>クッチーナ デル カンポ 様</li>
			<li>明治記念館1F 曙ノ間 様</li>
			<li>リストランテ･オステリア 様</li>
			<li>パパダビデ 様</li>
			<li>レストランヒラマツ レゼルヴ 様</li>
			<li>ロイヤルガーデンカフェ 飯田橋店 様</li>
			<li>トライベッカ SINAGAWA 様</li>
			<li>リビエラ青山 様</li>
			<li>SCeNT HOUSE DEN Marunouchi 様</li>
			<li>The Kitchen Salvatore Cuomo GINZA 様</li>
			<li>シャングリ･ラホテル東京 様</li>
			<li>クラシカ表参道 様</li>
			<li>THE ROOM DAIKANYAMA 様</li>
			<li>桐朋学園短大食堂 様</li>
			<li>ホテル ザ･ビー 八王子 様</li>
			<li>ムロマチカフェハチ(muromachi cafe 3+5) 様</li>
			<li>葉山庵TOKYO 様</li>
			<li>アニヴェルセル東京ベイ 様</li>
			<li>クイーンズバスリゾート 様</li>
			<li>XEX 日本橋 様</li>
			<li>ウルフギャング･パック  PIZZA BAR アレア品川店 様</li>
			<li>ジンジャーズビーチ サンシャイン 様</li>
			<li>A&P with terrace 様</li>
			<li>Restaurant bar CAY‐カイ‐ 様</li>
			<li>Restaurant Dazzle 様</li>
			<li>湘南クリスタルホテル 様</li>
			<li>サンシャイン クルーズ･クルーズ 様</li>
			<li>グレースバリ 様</li>
			<li>I/R Second House 様</li>
			<li>チキスタ chiki･sta 1号 様</li>
			<li>TOOTH TOOTH 様</li>
			<li>横浜国際ホテル 様</li>
			<li>クラフトビアマーケット 神保町テラス店 様</li>
			<li>CAFE GARB 丸ノ内店 様</li>
			<li>古民家キッチン JLIO 様</li>
			<li>ドレスプリンセス東京渋谷店 様</li>
			<li>ル サロンド ニナス 様</li>
			<li>恵比寿 TOMMY Garden 様</li>
			<li>レストランアラスカ パレスサイド店 様</li>
			<li>CARESS 様</li>
			<li>ザ･ウィングス海老名 様</li>
			<li>ダンチキンダン 様</li>
			<li>コードクルック (code kurkku) 様</li>
			<li>ヒルトン東京オ台場 様</li>
			<li>DEPARTURES【デパーチャーズ】 様</li>
			<li>カフェ ラ･ボエム 新宿御苑 様</li>
			<li>ベノア銀座店 様</li>
			<li>BAGUS PLACE ーバグースプレイスー 様</li>
			<li>新浦安  アートグレイス ウェディングコースト 様</li>
			<li>如水会館 様</li>
			<li>スカイギルド 様</li>
			<li>ピッツァ サルヴァト-レ クオモ 永田町 様</li>
			<li>カサブランカシルク 様</li>
			<li>MAIMON GINZA 様</li>
			<li>横浜桜木町ワシントンホテル 様</li>
			<li>Virgin cafe 品川 様</li>
			<li>立川ダイニング HANABI 様</li>
			<li>ロイヤルガーデンカフェ 様</li>
			<li>カフェコットンクラブ 様</li>
			<li>The GARDEN GINZA 様</li>
			<li>EAST GALLERY 地下1階 様</li>
			<li>CAFE GARB 丸ノ内店 様</li>
			<li>Gaudium NewYork ガウディウム ニューヨーク 様</li>
			<li>カフェガーブ 様</li>
			<li>バロワーテラス 千駄ヶ谷 様</li>
			<li>成田エクセルホテル東急 様</li>
			<li>南青山サンタキアラ教会 様</li>
			<li>Best Butchersベストブッチャーズ 様</li>
			<li>ロイヤルガーデンカフェ青山 様</li>
			<li>権八 西麻布 (GONPACHI) 様</li>
			<li>TENOHA&STYLE 様</li>
			<li>ティティクッチーナ (T.T.Cucina) 様</li>
			<li>Ocean table (オーシャン テーブル) 様</li>
			<li>カサブランカシルク 丸ノ内店 様</li>
			<li>THE LEGIAN CLUB HOUSE AKASAKA ~ザ･レギャン クラブハウス赤坂~ 様</li>
			<li>ホテルニューオータニ(ガンシップ) 様</li>
			<li>PUBLIC HOUSE 渋谷 様</li>
			<li>イーストギャラリー(EAST GALLERY) 様</li>
			<li>アレグロ (Allegro) 様</li>
			<li>MY HUMBLE HOUSE TOKYO(マイハンブルハウストウキョウ) 様</li>
			<li>肉バル MANZO 中野店 様</li>
			<li>アウトバック ステーキハウス 品川港南店 様</li>
			<li>ザ ランドマークスクエア トーキョー 29階コースト 様</li>
			<li>アップステアーズ (UPSTAIRS) 様</li>
			<li>GINTO 銀座店 (ギント) 様</li>
			<li>四谷3丁目スタジオ 様</li>
			<li>ガーブ ピンティーノ (GARB pintino) 様</li>
			<li>OLD MAN'S UN 汐留 様</li>
			<li>横浜マリンタワー 様</li>
			<li>A&P with terrace 横浜モアーズ9階 様</li>
			<li>kampo's (カンポーズ) 様</li>
			<li>アトンパレスホテル 様</li>
			<li>イーストギャラリー (EAST GALLERY) 様</li>
			<li>リヴァデリエトゥルスキ 様</li>
			<li>エスポワール 様</li>
			<li>ホテルニューオータニ 様</li>
			<li>etc.　※順不同</li>
		</ul>


		<h3 class="restaurant_title">関西の二次会会場</h3>
		<ul>
			<li>梅田ライム 様</li>
			<li>アンテヴォルテ 様</li>
			<li>ラバーズプレイス 様</li>
			<li>cafe&diner   COMS 様</li>
			<li>FIVE Kitashinchi 様</li>
			<li>アルモニーアンブラッセウェディングホテル 様</li>
			<li>レストラン ヴァリエ 様</li>
			<li>livingbar京都 様</li>
			<li>大仙公園(アウトドアウエディング) 様</li>
			<li>RIVER SUITE OSAKA 様</li>
			<li>ルート26 様</li>
			<li>グロッタデアモーレ 様</li>
			<li>ガーデンシティクラブ大阪 様</li>
			<li>J'adore 茶屋町 様</li>
			<li>CORONA 様</li>
			<li>北堀江シャルボン 様</li>
			<li>太閤園 アメジストルーム 様</li>
			<li>ORIENTAL AQUA NADESHIKO 様</li>
			<li>CUCINA ITALIANA ANTEVORTE 様</li>
			<li>旧桜宮公会堂 様</li>
			<li>No Name Cafe 様</li>
			<li>インターコンチネンタルホテル大阪 様</li>
			<li>kotowa奈良公園 様</li>
			<li>ウェスティン大阪 様</li>
			<li>mellow cafe 様</li>
			<li>8G ブライダル 様</li>
			<li>アゴラシオン 様</li>
			<li>浪切ホール ステラ 様</li>
			<li>ウォーターフロント堂島/ボガーツカフェ 様</li>
			<li>ムーランナンバ 様</li>
			<li>中之島ソーシャルイートアウェイク 様</li>
			<li>マザーズ北堀江 様</li>
			<li>梅田Colors 様</li>
			<li>Wedding Space Alohau 様</li>
			<li>ノースクラブ(/scrub) 様</li>
			<li>シティプラザ大阪 様</li>
			<li>エイジングハウス堂島店 様</li>
			<li>GARB Weeks 様</li>
			<li>アルカンシエルベリテ大阪 様</li>
			<li>CAFE CHARBON 様</li>
			<li>アクアガーデンテラス 様</li>
			<li>塚田農場 阪急32番街 様</li>
			<li>www.w 様</li>
			<li>グリーンホテルyes近江八幡 様</li>
			<li>Lover'sPlace 様</li>
			<li>京都スマイルガーデン 様</li>
			<li>La Bilancia 様</li>
			<li>帝国ホテル大阪 様</li>
			<li>ラグナヴェール大阪レジデンス 様</li>
			<li>Wedding Space Alohau or Mahalo 様</li>
			<li>セトレマリーナ守山 様</li>
			<li>ホテル日航大阪(5F 鶴ノ間) 様</li>
			<li>モンスーンカフェ茶屋町 様</li>
			<li>バーカロ･バカージョ 天満橋 様</li>
			<li>パーティパーク梅田 様</li>
			<li>大阪新阪急ホテル 様</li>
			<li>マジックバー 手品屋 梅田店 様</li>
			<li>堂島ホテル 様</li>
			<li>URGE高槻店 様</li>
			<li>センバキッチン 北梅田店 様</li>
			<li>オ･セイリュウ 様</li>
			<li>マジックバー 手品屋 梅田店 様</li>
			<li>partywedding 様</li>
			<li>ブリス モダン×カントリー 様</li>
			<li>ラテラス 様</li>
			<li>阪急ターミナルスクエア17 様</li>
			<li>ハイアットリージェンシー大阪 様</li>
			<li>ザ･コスモポリタン 様</li>
			<li>diningbar W 様</li>
			<li>ベジ畑カフェ小町 様</li>
			<li>TERRーaーS 様</li>
			<li>フリジェリオ 様</li>
			<li>グリーンヒルホテル神戸 様</li>
			<li>リストランテ コローナ 様</li>
			<li>大津プリンスホテル 比叡 様</li>
			<li>W cafe 様</li>
			<li>アンテヴォルテ 様</li>
			<li>パーティーウェディング 様</li>
			<li>心斎橋ダイニングバー7 様</li>
			<li>アニヴェルセル江坂 様</li>
			<li>unico西梅田 様</li>
			<li>ルセンティフォーリア大阪 様</li>
			<li>etc.　※順不同</li>
		</ul>

	</div>
</div>

<div class="cont04_space"></div>

</div><!-- cont10 -->

<div class="cont11" id="jump06">

<div class="cont04_title_frame cont04_title_wrap">
  <h2 class="cont04_title_heading"><span>よくある質問 Ｑ＆Ａ</span></h2>
</div>
	
<div class="QandA_frame">
        <dl>

          <dt>Q.カメラ経験が少ない大丈夫でしょうか？</dt>
          <dd>A.大丈夫です！カメラの設定や、ストロボの使い方なども含め、研修がございます！</dd>

          <dt>Q.ストロボを持っていませんが大丈夫ですか？</dt>
          <dd>A.フォトモ側でストロボの無料レンタルも行っておりますので、ご安心ください！</dd>

          <dt>Q.土曜日しか撮影に行けませんが問題ないでしょうか？</dt>
          <dd>A.はい、土日のどちらか片方のみでも大丈夫です！</dd>

          <dt>Q.撮影は何曜日が多いですか？</dt>
          <dd>A.基本的には、土日祝日です。数は少ないですが、平日の撮影もございます。</dd>

        </dl>
  </div>

</div><!-- cont11 -->




<div class="cont08" id="jump07">

<div class="cont04_title_frame cont04_title_wrap">
  <h2 class="cont04_title_heading"><span>お問い合わせフォーム</span></h2>
</div>

<div class="form_frame">
	<?php echo do_shortcode( '[contact-form-7 id="4577" title="カメラマンの募集・求人"]' ); ?>

	<div class="form_error">
		【送信ボタンが押せない方へ】<br>
		端末やブラウザによってはボタンが押せない場合があります。<br>
		お手数ですが<a href="mailto:info@photomo.jp">info@photomo.jp</a>に、直接お問い合わせしていただけると幸いです。<br>
		※3日以内に返信がない場合は再度ご連絡ください
	</div>

</div>

</div><!-- cont08 -->





<div class="message_frame">

<div class="message_position">

	<h2 span class="b"><p>
	カメラマンを考えている方へ
	</p></h2>

	<p>
	人生の中で、<span class="message_color">大切な時間</span>だからこそ。
	</p>

	<p>
	結婚式二次会であれば、大学時代の友達、<br>
	昔からの友人と気兼ねなく騒ぐことができます。<br>
	</p>

	<p>
	フォトモは、新郎新婦さん、ゲストのみなさんの<br>
	<span class="message_color">大切な時間</span>を残すために生まれたサービスです。<br>
	</p>

	<p>
	最後までお読みいただき、<br>
	ありがとうございます。
	</p>

	<p>
	一緒にお仕事ができるのを楽しみにしています。
	</p>



</div>

</div><!-- message -->


<footer class="copyright">
  Copyright © 2016 株式会社フォトモ All Rights Reserved.<br>
  <a href="https://photomo.jp/about/" target="_blank">運営会社</a>｜<a href="https://photomo.jp/law/" target="_blank">特定商取引法に基づく表記</a>
</footer>


<!-- 条件分岐 -->
      <?php $url = $_SERVER['REQUEST_URI']; ?>
       
      <?php if(strstr($url,'2nd-wedding-party')): ?>
      <!-- 2nd-wedding-partyを含む -->

          <div class="sp_navigation">
            <div class="sp_navigation_frame">
            <ul class="sp_navigation_box">

              <li>
                <a class="sp_tel01" href="tel:080-1187-0786" onclick="ga('send', 'event', 'smartphone', 'phone-number-tap', 'main');"></a>
              </li>

              <li>
                <a class="sp_tel02" href="tel:080-9607-4931" onclick="ga('send', 'event', 'smartphone', 'phone-number-tap', 'main');"></a>
              </li>

              <li>
                <a class="sp_mail01" href="#jump"></a>
              </li>

               <li>
                <a class="sp_line" href="https://line.me/R/ti/p/%40tgv5949x"></a>
              </li>

            </ul>  
            </div>  
          </div>

          <div class="clear"></div>

      <?php else: ?><!-- それ以外 -->

          <div class="sp_navigation">
            <div class="sp_navigation_frame">
            <ul class="sp_navigation_box">

              <li>
                <a class="sp_tel01" href="tel:080-1187-0786" onclick="ga('send', 'event', 'smartphone', 'phone-number-tap', 'main');"></a>
              </li>

              <li>
                <a class="sp_tel02" href="tel:080-9607-4931" onclick="ga('send', 'event', 'smartphone', 'phone-number-tap', 'main');"></a>
              </li>

              <li>
                <a class="sp_mail01" href="#jump"></a>
              </li>

              <li>
                <a class="sp_line" href="https://line.me/R/ti/p/%40tgv5949x"></a>
              </li>

            </ul>  
            </div>  
          </div>

          <div class="clear"></div>

      <?php endif; ?>
<!-- 条件分岐 -->


</div><!--/wrapper-->



<!-- Google for Jobs -->
<script type="application/ld+json">
{
    "@context" : "http://schema.org/",
    "@type" : "JobPosting",
    "title" : "結婚式二次会（1.5次会）カメラマン募集・求人情報",
    "datePosted" : "2020-01-30",
	"validThrough": "",
    "hiringOrganization" : {
        "@type" : "Organization",
        "name" : "株式会社フォトモ",
        "sameAs" : "https://photomo.jp/",
        "logo" : "https://photomo.jp/wp-content/uploads/logo_square.jpg"
    },
    "jobLocation" : {
        "@type" : "Place",
        "address" : {
            "@type" : "PostalAddress",
            "addressRegion" : "東京都",
            "addressLocality" : "世田谷区",
            "streetAddress" : "羽根木2-37-2-301",
            "postalCode" : "156-0042",
            "addressCountry": "JP"
        }
    },
    "description" : "
        <h1>【フォトモ結婚式二次会（1.5次会）カメラマン募集・求人情報】</h1>
        <p>--------------------------------------</p>
        <h2>【３つのメリット】</h2>
        <h3>1.スケジュールに合わせた働き方</h3>
        <p>ご登録いただいているカメラマンは、担当者とLINEでやり取りを行い、ご自身のスケジュールに合わせて撮影をすることができます。土日のどちらかのみ撮影など、柔軟に対応することができます！</p> 
        <h3>1日2件の撮影も可能</h3>
        <p>結婚式二次会の時間が合えば、1日に2件撮影に行くことも可能です。その場合は、なるべく近い会場の撮影を優先いたしますので、移動時間も短縮できます！</p>                    
        <p>--------------------------------------</p>
        <h2>2.機材の無料レンタル！</h2>
        <h3>無料で機材も貸します</h3>
        <p>機材が一式揃っていなくても、足りない分は無料でレンタルすることもできますので、初心者の方でもご安心ください！</p> 
        <h3>カメラやレンズなどもOK</h3>
        <p>無料レンタルでは、カメラやレンズ、ストロボなどの用意がございます。柔軟に対応しますので、お気軽にご相談ください！</p>
        <p>--------------------------------------</p>
        <h2>3.カメラマンへの負担が少ない！</h2>
        <h3>やり取りはフォトモが担当</h3>
        <p>お客様（新郎新婦）とのやり取りは、基本的に全てフォトモが行います。カメラマンへの負担が少ないです！</p> 
        <h3>納品方法も簡単</h3>
        <p>撮影後のデータの納品は、指定のオンラインシステム上にアップロードするだけ！DVDなどの配送はございません！</p>
        <p>--------------------------------------</p>
        <p></p>
        <p>--------------------------------------</p>
        <h2>【カメラマンの募集要項】</h2>
        <h3>募集エリア</h3>
        <p>関東エリア／関西エリア／東海エリア<br>
            ※東海エリアの場合、エリアマネージャーを募集しています</p>
        <p>東京／神奈川／千葉／埼玉／大阪／京都／愛知</p>
        <p>--------------------------------------</p>
        <h3>カメラ機材</h3>
        <p>一眼レフ／標準レンズ／ストロボ<br>
            ※機材がない場合は無料レンタルも行っています</p>
        <p>--------------------------------------</p>
        <h3>報酬金額</h3>
        <p>平均金額10,000円＋指名料などのインセンティブ</p>
        <p>--------------------------------------</p>
        <p></p>
        <p>--------------------------------------</p>
        <h2>カメラマンの声</h2>
        <h3>趣味からカメラマンへ</h3>
        <p>フォトモでカメラマンをするようになったのは、友人からの紹介がきっかけでした！
            もともと、趣味や友人からの依頼でインフルエンサーやインスタグラムの素材を撮影することはあったのですが、もっと本格的にスキルとして身に付けたいと思っていたところ、紹介してもらったのでタイミング的にもよかったです。

            実際初めてみてから、サポート体制がとてもありがたかったと思っています。
            まず、今までほぼ独学で勝手にやっていたのですが、しっかりとした知識から教えてもらいました。
            また、撮影に必要なアイテム(ストロボや予備のカメラ等)も貸していただき、一人で撮影できるようになるまで、撮影指導もしていただきました！

            そのおかげで、スキルはしっかりついて、フォトモ以外でもカメラマンとしてお金をいただけるまでになりました！
        </p>
        <p>--------------------------------------</p>
        <h3>未経験からカメラマンへ</h3>
        <p>フォトモで初めて二次会の撮影をするようになりましたが、事前の説明やサポートが充実しておりとても撮影に臨みやすいです。

            お客様のご要望や会場の内装などをフォトモの方でやりとりしていただけて、分かりやすくまとめて必要な情報を送って頂けるので、安心して撮影に臨むことができています。

            お客様から嬉しいお声を頂いた時は幸せな瞬間を形にできたと実感でき、とても嬉しく、撮影できて良かったなと思います。
        </p>
        <p>--------------------------------------</p>",
    "identifier": {
        "@type": "PropertyValue",
        "name": "株式会社フォトモ",
        "value": "10000"
    },
    "baseSalary": {
        "@type": "MonetaryAmount",
        "currency": "JPY",
        "value": {
            "@type": "QuantitativeValue",
            "value": 10000,
            "minValue": 8000,
            "maxValue": 20000,
            "unitText": "DAY"
        }
    },
    "employmentType" : "",
    "applicantLocationRequirements": {
      "@type": "Country",
      "name": "JAPAN"
    },
    "jobLocationType": "TELECOMMUTE"
    }
</script>


<!-- jQuery.jsの読み込み -->
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<?php bloginfo('template_url'); ?>/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="<?php bloginfo('template_url'); ?>/swiper.min.js"></script>


<!-- スライドショー -->
<script>
var swiper = new Swiper('.swiper-container', {
    pagination: '.swiper-pagination',
    nextButton: '.swiper-button-next',
    prevButton: '.swiper-button-prev',
    paginationClickable: true,
    spaceBetween: 30,
    centeredSlides: true,
    autoplay: 2500,
    autoplayDisableOnInteraction: false
});
</script>
 
<!-- $('')内にclass名を入れる -->
<script type="text/javascript">
$(document).ready(function(){
  $('.slide_iPhone').bxSlider({
auto: true
});
});
</script>

<!-- スムーズスクロール部分の記述 -->
<script>
$(function(){
   // #で始まるアンカーをクリックした場合に処理
   $('a[href^=#]').click(function() {
      // スクロールの速度
      var speed = 700; // ミリ秒
      // アンカーの値取得
      var href= $(this).attr("href");
      // 移動先を取得
      var target = $(href == "#" || href == "" ? 'html' : href);
      // 移動先を数値で取得
      var position = target.offset().top;
      // スムーススクロール
      $('body,html').animate({scrollTop:position}, speed, 'swing');
      return false;
   });
});
</script>

<!-- ステッキーヘッダー -->
  <script>
  $(function(){
      var box = $("#menu");
      var boxTop = box.offset().top;
      $(window).scroll(function(){
          if($(window).scrollTop() >= boxTop){
              box.addClass("fixed");
              $("body").css("margin-top","50px");
          }else{
              box.removeClass("fixed");
              $("body").css("margin-top","0px");
          }
      });
  });
  </script>

<!-- Facebook -->
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ja_JP/sdk.js#xfbml=1&version=v2.6&appId=208181072704298";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


    <?php get_template_part('button-go-to-top'); //トップへ戻るボタンテンプレート?>
    <?php get_template_part('buttons-footer-mobile'); //フッターモバイルボタンのテンプレート?>
    <?php get_template_part('footer-custom-field');//カスタムフィールドの挿入（カスタムフィールド名：footer_custom）?>
    <?php get_template_part('footer-slicknav'); //SlickNav用のテンプレート（ツリー式モバイル用メニュー）?>
    <?php get_template_part('footer-javascript'); //フッターで呼び出すJavaScript用のテンプレート?>
    <?php get_template_part('analytics'); //アクセス解析用テンプレート?>
    <?php get_template_part('footer-insert'); //</body>手前のフッターにタグを挿入したいとき用のテンプレート?>

<!-- #slick -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3/dist/jquery.min.js"></script>
<script type="text/javascript" src="<?php bloginfo('template_url');?>/slick/slick.min.js"></script>
<script type="text/javascript">
$(function() {
  $('.slick-box').slick({
      arrows: false,
      autoplay: true,
      autoplaySpeed: 0,
      cssEase: 'linear',
      speed: 5000,
      slidesToShow: 5,
      slidesToScroll: 1,
      responsive: [{
            breakpoint: 700,settings: {
              slidesToShow: 2.5,
              slidesToScroll: 1
            }
          }]      
  });
});
</script>

<?php wp_footer(); ?>
</body>
</html>