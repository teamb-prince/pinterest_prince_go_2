CREATE EXTENSION pgcrypto;

-- ----------- user_account -----------
INSERT INTO user_account (id, first_name, last_name, email, password_hash, role, profile_image, description, location, web, created_at) 
VALUES ('mrypq', 'めろ子', 'めろ田',
'meromero@mero.com',  crypt('meromero', gen_salt('bf')), 'admin',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/profile_image.jpeg',
'めろぴっぴです', 'めろ王国', 'https://github.com/mrypq', '2018-01-01 10:10:10+09'
);

INSERT INTO user_account (id, first_name, last_name, email, password_hash, role, profile_image, description, location, web, created_at) 
VALUES ('mrypq2', 'めろ美', 'めろ川',
'meromero2@mero.com', crypt('meromero2', gen_salt('bf')), 'user',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/profile_image_2.jpg',
'２番手のめろぴっぴです', 'めろ帝国', 'https://github.com/teamb-prince', '2018-02-02 20:20:20+09'
);

INSERT INTO user_account (id, first_name, last_name, email, password_hash, role, profile_image, description, location, web, created_at) 
VALUES ('aria', 'aria', '',
'aria@aria.com', crypt('ariacat3366', gen_salt('bf')), 'user',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/kcat.png',
'月曜日の朝は眠い', '', 'https://github.com/ariacat3366', '2018-02-03 20:20:20+09'
);

INSERT INTO user_account (id, first_name, last_name, email, password_hash, role, profile_image, description, location, web, created_at) 
VALUES ('yayamochi', 'やや', 'もち',
'yaya@yaya.com', crypt('yayamochi', gen_salt('bf')), 'user',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/yayamochi.jpg',
'龍が如くがすき', '都民になった', 'https://twitter.com/yayamochi', '2018-02-04 20:20:20+09'
);

INSERT INTO user_account (id, first_name, last_name, email, password_hash, role, profile_image, description, location, web, created_at) 
VALUES ('abetatsu', 'たつ', 'あべ',
'abe@abe.com', crypt('abetatsu', gen_salt('bf')), 'user',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/abe.jpeg',
'', '', '', '2018-02-05 20:20:20+09'
);

-- ----------- board -----------
INSERT INTO board (id, user_id, name, topic_id, description, created_at)
VALUES ('596e415e-f74e-46ab-b0dc-a00c70efb8f3', 'mrypq',
'行きたいスポット', '8083e9df-e30e-457f-b853-2bb70fbb025b',
'めろの行きたいところです', '2019-07-07 07:07:07+09'
);

INSERT INTO board (id, user_id, name, topic_id, description, created_at)
VALUES ('6a8a04cb-bd3b-4606-b88c-593dc4e51d63', 'mrypq',
'LoL skins', '004d09c5-c788-4468-9b68-96b5735ced9b',
'league of legends / skin collection', '2019-07-08 07:07:07+09'
); 

INSERT INTO board (id, user_id, name, topic_id, description, created_at)
VALUES ('3b7de911-dc1b-445f-8593-47af710707b5', 'mrypq',
'KAT-TUN', '8083e9df-e30e-457f-b853-2bb70fbb025b',
'', '2019-07-09 07:07:07+09'
);

INSERT INTO board (id, user_id, name, topic_id, description, created_at)
VALUES ('ab339fe0-c32c-46e8-87c1-befcfee42d28', 'mrypq',
'ごはん', '1ca44c07-f20c-4992-89bd-aa8e66997c02',
'', '2019-07-10 07:07:07+09'
);

INSERT INTO board (id, user_id, name, topic_id, description, created_at)
VALUES ('9220ecec-0c44-447c-93b6-1903e3209a91', 'mrypq2',
'池袋', '8083e9df-e30e-457f-b853-2bb70fbb025b',
'', '2019-07-11 07:07:07+09'
);

INSERT INTO board (id, user_id, name, topic_id, description, created_at)
VALUES ('ca4550c7-0ddb-44c2-bda7-aa32bc066a99', 'mrypq2',
'ねこ', 'cf76d2ed-a255-4363-a9d2-855170e1fee6',
'', '2020-02-12 07:07:07+09'
);

INSERT INTO board (id, user_id, name, topic_id, description, created_at)
VALUES ('0910d8c3-2a26-4a8d-bf24-c46e2e5718ea', 'mrypq',
'Makeup', '2c51528d-e6c4-4126-bc09-26fd847c0834',
'makeup & beauty', '2019-12-12 07:07:07+09'
);


-- ----------- pin -----------
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('12130347-8e9c-4a27-8fcb-2aeaea38c196', 
'mrypq',
'https://www.canmake.com/topics/detail/18',
'今年の夏ネイル第１弾はユニコーンカラー♡ | CANMAKE（キャンメイク）',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/ucnail_news%26topics.jpg',
'',
'url','',
'2020-02-22 12:30:22+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('ca1fd1bb-7cae-443d-bdb2-25ad4c50790c', 
'mrypq',
'https://ex-ichiba.jp/blog/2020/03/05/post_698/',
'エクステで作る！エクステグラデーションスタイル | 渋谷にある傷ま ...',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/IMG_2368-650x645.jpg',
'',
'url','',
'2020-02-22 12:30:22+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('7cbffef8-1c4a-4faa-9953-821177b5bddf', 
'mrypq',
'https://favor.life/27484',
'シャネルの新作リップ『ルージュ アリュール インク フュージョン ...',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/27484-time.jpg',
'',
'url','',
'2020-02-22 12:20:22+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('befa1ab8-3a18-4580-a206-5f531c20f9da', 
'mrypq',
'https://www.fashion-press.net/news/54016',
'シュウ ウエムラ × ポケモン「ピカシュウ」クリスマスコスメ、注目アイテムランキングTOP5も',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/ZRw.jpg',
'クリスマスコフレ❤︎',
'url','',
'2020-02-22 12:10:22+09');


INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('cc2a8e31-725f-473e-9637-ab1411be7c2b', 
'mrypq2',
'http://trcps-3cats.net/2017/06/29/mikeneko/',
'三毛猫さん',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/0625_3.jpg',
'ねこかわいいねこ〜',
'url', 'cat',
'2020-02-22 10:10:22+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('e5a84729-6251-4b2b-b62e-ffab8a1eebac', 
'mrypq2',
'https://nekochan.jp/cattype/article/755',
'メインクーンの色は何種類？被毛や目のカラーが豊富な人気の猫種！',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/de1830e737620f1eb9eb0b210b502b50.jpg',
'ねこかわいいねこ〜',
'url','cat',
'2020-02-22 10:10:12+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('fa55a7b6-9be8-4bcb-b4a8-6a396e425fab',
'mrypq2',
'https://www.koneko-breeder.com/cat1906-02067.html',
'マンチカン×ノルウェージャンフォレストキャット 女の子 ブラウン ...',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/cat_img_1_326e49a33ed5.jpg',
'ねこかわいい',
'url','cat',
'2020-02-22 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('ab917ee9-bf28-41ff-b914-550728159fae', 
'mrypq',
'https://automaton-media.com/articles/newsjp/20190501-91106/',
'『LoL』少年アニメをテーマとしたスキンシリーズ「バトルアカデミア」がパッチ9.10で登場',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/20190501-91106-001.jpg',
'かわいい！！！！！！！！！！！！！',
'url','',
'2020-01-02 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('d7f80bcf-84f0-4560-a237-06c392e0b140',
'mrypq',
'http://lolyarou.net/archives/1346',
'About PBE Update 16/8/5 – Arcade Ahri, Arcade Corkiのスプラッシュアートが確認、Arcade Ezrealの情報が確認、Chroma Assetsが追加など',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/2eaaf8b0ae33f1b2.jpg',
'かわいい！！！！！！！！！！！！！',
'url','',
'2020-02-02 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('dfa9eecf-4614-4679-a43e-33aee806fd24', 
'mrypq',
'https://photo.oscasierra.net/tdr-201604/',
'2016年04月に東京ディズニーリゾートで撮影した厳選写真',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/26433173610_10a5654b94_o.jpg',
'行きたい！！！！！！！！！！！！！',
'url','',
'2020-01-03 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('f7bd0617-aaf7-46c7-8b32-7ae7cd2192f7',
'mrypq',
'https://www.jalan.net/news/article/293711/',
'この秋、見たい！絶景すぎる「逆さ紅葉」21選【全国】',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/181030_sakasa_koyo_03.jpg',
'行きたい！！！！！！！！！！！！！',
'url','',
'2020-01-03 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('279fc672-dd59-4b80-bbbd-9d44e2a91d53', 
'mrypq',
'https://www.miyajima.or.jp/history/history.html',
'歴史｜一般社団法人宮島観光協会',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/img_history.jpg',
'行きたい！！！！！！！！！！！！！',
'url','',
'2020-01-04 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('297dca85-53fd-4e56-b023-c5bc456b9a39', 
'mrypq',
'https://resoco.jp/4371',
'ドバイの夜景スポット15選！おすすめスポット＆レストラン',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/dobai_AdobeStock_211353756.jpeg',
'行きたい！！！！！！！！！！！！！',
'url','',
'2020-01-05 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('c126d948-7e48-489f-a51e-c7b21a63b418', 
'mrypq',
'http://www.niigata-sushi.com/',
'にいがた鮨三昧',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/pic_slider_02.png',
'食べたい！！！！！！！！！！！！！',
'url','',
'2020-01-06 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('f1cfa29e-036c-4b3b-ada9-998e659ae36d', 
'mrypq',
'http://net.keizaikai.co.jp/archives/41822',
'パスタ ジェノベーゼ',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/06608_l.jpg',
'食べたい！！！！！！！！！！！！！',
'url','',
'2020-01-07 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('70f89f0d-290d-4090-9401-01f4888758dc', 
'mrypq',
'https://otonano-shumatsu.com/articles/5037',
'宇治園 裏参道ガーデン店（カフェ/表参道）｜おとなの週末',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/6b5570665c5856bfca57d831d14ef516.jpeg',
'食べたい！！！！！！！！！！！！！',
'url','',
'2020-03-07 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('ccefdd93-d6bd-4a17-a10c-f0f09b17979b', 
'mrypq',
'https://www.jalan.net/news/article/303446/',
'大阪グルメおすすめ14選】グルメライターが厳選したおいしい名物を紹介！',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/20181210_osaka_gurume_19-480x320.jpg',
'食べたい！！！！！！！！！！！！！',
'url','',
'2020-02-07 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('993abdff-7c75-43fb-9238-a8fd13bffd78', 
'mrypq',
'https://art-of-clarity.livejournal.com/111276.html',
'[Animated GIFs] KAT-TUN: Greatest Journey PV',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/XnWFHADP_o.gif',
'すき！！！！！！！！！！！！！',
'url','',
'2020-01-08 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('1a856d62-f26a-4209-ae2a-936c460dda66',
'mrypq2',
'https://town.epark.jp/lp/m-sunshine-aquarium/',
'【サンシャイン水族館】天空を羽ばたくペンギンと感動に出会える池袋のアクアリウム',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/sunshine_aquarium.jpg',
'きて！！！！！！！！！！！！！',
'url','',
'2020-01-09 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('da16fe8a-5224-4891-8afb-bab884f7aa24',
'mrypq',
'https://www.pakutaso.com/20160346074post-7251.html',
'星空が反射するウユニ塩湖の雨季｜無料の写真素材はフリー素材のぱくたそ',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/MIYA16021200DSC_1905_TP_V4.jpg',
'行きたい！！！！！！！！！！！！！',
'url', '',
'2020-01-10 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('81e646da-b3dc-4380-aa63-ac58b74b1689', 
'mrypq2',
'https://twitter.com/konicaminoltamt',
'コニカミノルタプラネタリウム満天（池袋） (@konicaminoltamt) | Twitter',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/EZoZKkBUMAARw9Z.jpg',
'きて！！！！！！！！！！！！！',
'url','',
'2020-01-11 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('fe3ead68-eeea-49a7-8b1b-da6184c93390',
'mrypq2',
'https://www.mystays.com/attractions-ikebukuro-tokyo-japan/',
'池袋 | 東京 | トラベルガイド＆ホテル | マイステイズ - MYSTAYS',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/02.jpg',
'きて！！！！！！！！！！！！！',
'url','',
'2020-01-12 10:10:10+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('cd0cdb20-23ec-4ab5-b533-ffc875eb0ff5',
'mrypq',
'',
'イレリア＆タロン　新スキン',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/DmSL1V6UwAABph-.jpg',
'パッチ8.17で追加の新スキン　かわいい❤︎',
'local','',
'2020-01-20 20:20:20+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)  
VALUES ('ebcf05e5-a731-478d-9cd8-96e157f4b36d',
'mrypq',
'https://www.meijioishiigyunyu.com/recipe/detail/151.html',
'バジルチーズフォンデュ',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/main.jpg',
'',
'local','',
'2020-01-22 20:20:20+09');

-- ----------- token -----------
-- [TODO] 確認用トークン ずっと使える いるかな？
INSERT INTO token (id)  
VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW4iLCJzdWIiOiJtcnlwcSIsImlhdCI6MTUxNjIzOTAyMiwiZXhwIjoyMDE2MjM5MDIyfQ.pQnjvROwyIki8ywKMl0Hm66_bDuJ1Pa1aPM_kDU93gQ');

-- ----------- pin_board -----------
INSERT INTO pin_board (pin_id, board_id)
VALUES (
 '12130347-8e9c-4a27-8fcb-2aeaea38c196' , '0910d8c3-2a26-4a8d-bf24-c46e2e5718ea'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'ca1fd1bb-7cae-443d-bdb2-25ad4c50790c' , '0910d8c3-2a26-4a8d-bf24-c46e2e5718ea'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 '7cbffef8-1c4a-4faa-9953-821177b5bddf' , '0910d8c3-2a26-4a8d-bf24-c46e2e5718ea'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'befa1ab8-3a18-4580-a206-5f531c20f9da' , '0910d8c3-2a26-4a8d-bf24-c46e2e5718ea'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'cc2a8e31-725f-473e-9637-ab1411be7c2b' , 'ca4550c7-0ddb-44c2-bda7-aa32bc066a99'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'e5a84729-6251-4b2b-b62e-ffab8a1eebac' , 'ca4550c7-0ddb-44c2-bda7-aa32bc066a99'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'fa55a7b6-9be8-4bcb-b4a8-6a396e425fab' , 'ca4550c7-0ddb-44c2-bda7-aa32bc066a99'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'ab917ee9-bf28-41ff-b914-550728159fae' , '6a8a04cb-bd3b-4606-b88c-593dc4e51d63'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'd7f80bcf-84f0-4560-a237-06c392e0b140' , '6a8a04cb-bd3b-4606-b88c-593dc4e51d63'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'dfa9eecf-4614-4679-a43e-33aee806fd24' , '596e415e-f74e-46ab-b0dc-a00c70efb8f3'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'f7bd0617-aaf7-46c7-8b32-7ae7cd2192f7' , '596e415e-f74e-46ab-b0dc-a00c70efb8f3'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 '279fc672-dd59-4b80-bbbd-9d44e2a91d53' , '596e415e-f74e-46ab-b0dc-a00c70efb8f3'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 '297dca85-53fd-4e56-b023-c5bc456b9a39' , '596e415e-f74e-46ab-b0dc-a00c70efb8f3'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'c126d948-7e48-489f-a51e-c7b21a63b418' , 'ab339fe0-c32c-46e8-87c1-befcfee42d28'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'f1cfa29e-036c-4b3b-ada9-998e659ae36d' , 'ab339fe0-c32c-46e8-87c1-befcfee42d28'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 '70f89f0d-290d-4090-9401-01f4888758dc' , 'ab339fe0-c32c-46e8-87c1-befcfee42d28'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'ccefdd93-d6bd-4a17-a10c-f0f09b17979b' , 'ab339fe0-c32c-46e8-87c1-befcfee42d28'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 '993abdff-7c75-43fb-9238-a8fd13bffd78' , '3b7de911-dc1b-445f-8593-47af710707b5'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 '1a856d62-f26a-4209-ae2a-936c460dda66' , '9220ecec-0c44-447c-93b6-1903e3209a91'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'da16fe8a-5224-4891-8afb-bab884f7aa24' , '596e415e-f74e-46ab-b0dc-a00c70efb8f3'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 '81e646da-b3dc-4380-aa63-ac58b74b1689' , '9220ecec-0c44-447c-93b6-1903e3209a91'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'fe3ead68-eeea-49a7-8b1b-da6184c93390' , '9220ecec-0c44-447c-93b6-1903e3209a91'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'cd0cdb20-23ec-4ab5-b533-ffc875eb0ff5' , '6a8a04cb-bd3b-4606-b88c-593dc4e51d63'
);

INSERT INTO pin_board (pin_id, board_id)
VALUES (
 'ebcf05e5-a731-478d-9cd8-96e157f4b36d' , 'ab339fe0-c32c-46e8-87c1-befcfee42d28'
);
 
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)
VALUES ('58dadd2e-69d0-450c-9120-c051a71f8874',
'mrypq',
'https://switch-box.net/wallpaper-iphone6-plus-cute-cat.html',
'hogehoge',
'https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/49a967b9-8aad-40d2-b444-ebfed7432a1a',
'hogehoge',
'url', 'Cat',
'2020-06-29 15:40:19+09'
);
 
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)
VALUES ('e1561e0e-9f67-413e-9773-44796feb98c6',
'mrypq',
'https://switch-box.net/wallpaper-iphone6-plus-cute-cat.html',
'hogehoge',
'https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/899f01ca-9ebb-4093-9f75-4dbb33608234',
'hogehoge',
'url', 'Cat',
'2020-06-29 15:40:19+09'
);
 
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)
VALUES ('39b6dcfa-7a6d-4aa9-9f18-5a56994b4041',
'mrypq',
'https://switch-box.net/wallpaper-iphone6-plus-cute-cat.html',
'hogehoge',
'https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/4d4c27e7-4f6f-4e56-bd83-71cafcfb4767',
'hogehoge',
'url', 'Cat','2020-06-29 15:40:20+09');
 
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)
VALUES ('a9fc9f48-91a0-4dc9-92cd-4ce42d83e3a3',
'mrypq',
'https://switch-box.net/wallpaper-iphone6-plus-cute-cat.html',
'hogehoge',
'https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/1c69c36c-5b70-4ad5-96b5-b6436d5961ab',
'hogehoge',
'url', 'Kitten',
'2020-06-29 15:40:21+09'
);
 
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)
VALUES ('732de76c-7e9a-4a61-848b-ed6b4909b7fb',
'mrypq',
'https://switch-box.net/wallpaper-iphone6-plus-cute-cat.html',
'hogehoge',
'https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/d235f0e5-f058-4408-a0ee-2dd0c7b49e77',
'hogehoge',
'url', 'Cat',
'2020-06-29 15:40:22+09'
);

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)
VALUES ('26e72143-08be-4ce1-917a-c2567bfe3d33',
'mrypq',
'https://switch-box.net/wallpaper-iphone6-plus-cute-cat.html',
'hogehoge',
'https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/463f8b17-8080-40aa-9996-fe7b9a730275',
'hogehoge',
'url', 'Kitten',
'2020-06-29 15:40:22+09'
);
 
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)
VALUES ('b88fd88d-5918-44fc-b29c-d8e8a8e4e5dd',
'mrypq',
'https://switch-box.net/wallpaper-iphone6-plus-cute-cat.html',
'hogehoge',
'https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/9258f8f2-0b2c-4779-b9c0-1f2bc5ee0962',
'hogehoge',
'url', 'Cat',
'2020-06-29 15:40:23+09'
);
 
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)
VALUES ('e38279bb-02e3-46ab-b443-d7c9710196d0',
'mrypq',
'https://switch-box.net/wallpaper-iphone6-plus-cute-cat.html',
'hogehoge',
'https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/096465b3-6a8c-4ed3-8c37-e82d9850c217',
'hogehoge',
'url', 'Cat',
'2020-06-29 15:40:24+09'
);
 
 
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)
VALUES ('4ed2fcc7-c6fc-4bee-a56f-409cd043e518',
'mrypq',
'https://switch-box.net/wallpaper-iphone6-plus-cute-cat.html',
'hogehoge',
'https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/7392bf55-51b5-43ad-9909-f14579da175e',
'hogehoge',
'url', 'Cat',
'2020-06-29 15:40:25+09'
);
 
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)
VALUES ('aaef0d0e-e4bd-4bde-922d-0d6606599760',
'mrypq',
'https://switch-box.net/wallpaper-iphone6-plus-cute-cat.html',
'hogehoge',
'https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/37e7ae4d-9ac3-4f5c-9cbd-51fb1ceeeb74',
'hogehoge',
'url', 'Cat',
'2020-06-29 15:40:26+09'
);
 
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)
VALUES ('49602f4b-d785-4670-83aa-e01746f6fbea',
'mrypq',
'https://switch-box.net/wallpaper-iphone6-plus-cute-cat.html',
'hogehoge',
'https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/176ab3bf-27cb-4362-981a-b8ce5ad91f99',
'hogehoge',
'url', 'Kitten',
'2020-06-29 15:40:27+09'
);
 
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)
VALUES ('9f15935a-4a25-4d62-a2f7-29039dc3618a',
'mrypq',
'https://switch-box.net/wallpaper-iphone6-plus-cute-cat.html',
'hogehoge',
'https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/21a62b65-ffda-411a-9e6c-29aff5108cd6',
'hogehoge',
'url', 'Cat',
'2020-06-29 15:40:28+09'
);
 
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)
VALUES ('fcb76d83-b351-4734-981d-5db8758616f0',
'mrypq',
'https://switch-box.net/wallpaper-iphone6-plus-cute-cat.html',
'hogehoge',
'https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/786a2d43-b3e3-4123-91b2-e89bf7f9caca',
'hogehoge',
'url', 'Kitten',
'2020-06-29 15:40:28+09'
);
 
 
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at)
VALUES ('2c3299e0-05f0-4915-af19-449fdcaf463a',
'mrypq',
'https://switch-box.net/wallpaper-iphone6-plus-cute-cat.html',
'hogehoge',
'https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/928a9f4a-fb3b-40a4-9bb5-dc9f37aa4fb7',
'hogehoge',
'url', 'Cat',
'2020-06-29 15:40:29+09'
);


-- 宇宙
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('a725977a-b48e-471f-ac17-ffd32f4ff8b8','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/33530ce8-db8a-4792-9c39-02eba263f333','hogehoge','url','Outer Space','2020-06-29 18:04:14+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('7c3c2e63-5eca-44f0-b4a1-d9c2beacdccc','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/1d905770-14a6-4751-b216-ec26f37a5da9','hogehoge','url','Outer Space','2020-06-29 18:04:14+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('f3bd8556-c4b2-4d38-b6d0-81133da8d168','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/5875fcb3-b24d-4325-82d1-955586b161e3','hogehoge','url','Nebula','2020-06-29 18:04:15+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('e80fa3d1-b849-40c6-8667-dd97b5904f25','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/726459fa-7829-4450-9657-320d3b826a37','hogehoge','url','Outer Space','2020-06-29 18:04:16+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('729190a1-aa39-466a-b9a9-aa62a4709aea','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/0d4e2416-0057-408b-94a1-68a1ee6b4f35','hogehoge','url','Nebula','2020-06-29 18:04:16+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('87d095e4-4c61-4c29-80e9-d29b1ce47a07','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/21f0f37e-dfc3-482b-8694-d53227423e22','hogehoge','url','Nebula','2020-06-29 18:04:17+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('3dcb8900-e052-470c-8918-e581483b4e1f','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/b4cde3bd-cdcf-42aa-91d7-0696b7688644','hogehoge','url','Outer Space','2020-06-29 18:04:18+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('9ce0e864-2cd7-4f2a-919c-f92b56c58c63','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/ba3a94a8-1f3a-4d02-9ba2-1414ee93bfdf','hogehoge','url','Nebula','2020-06-29 18:04:21+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('da2ac09f-ae0e-4d28-80d5-380e7b79dd8e','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/22c503d4-ac09-4a83-88af-b637e5290a66','hogehoge','url','Outer Space','2020-06-29 18:04:25+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('4c5e5141-d088-416a-8480-38d4453de427','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/9c836161-d8e6-41ca-9c1d-5e5458cbb3de','hogehoge','url','Outer Space','2020-06-29 18:04:27+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('0b009637-354b-4c68-a122-a7af8256f4f6','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/9764dd81-722a-4e98-b21a-2272ba4e912b','hogehoge','url','Outer Space','2020-06-29 18:04:29+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('108a5310-466f-4018-9a4d-7d0607f72581','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/cc84ded4-0930-4769-9d2b-56fb34d31508','hogehoge','url','Outer Space','2020-06-29 18:04:30+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('62bc8e65-ec68-48f8-8f90-7fccad154306','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/15599894-7540-4d85-95cb-434660e5c409','hogehoge','url','Outer Space','2020-06-29 18:04:31+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('9179b65d-816c-4586-b2a3-832c08602fd4','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/4d04d140-1a70-4873-ad9c-01cfec130fb3','hogehoge','url','Outer Space','2020-06-29 18:04:31+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('f3effec7-b4ba-45a9-ac95-f8206f4a813a','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/4cc5d281-3299-401a-971b-3d698bb8e1f1','hogehoge','url','Outer Space','2020-06-29 18:04:32+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('acbee828-c10c-42c5-abe2-241c0c5857e8','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/cc63f8e7-48f1-4bdf-9294-089faf1b93b0','hogehoge','url','Outer Space','2020-06-29 18:04:32+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('54938aa1-90c9-4973-9992-c4bf67556ae8','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/a958645a-fed1-49bb-b8b8-2ad67cf86375','hogehoge','url','Nebula','2020-06-29 18:04:33+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('942cda95-ff25-48ab-889e-9041e8bb1bc8','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/61fd12af-c26e-415b-8cbc-33f408d089aa','hogehoge','url','Outer Space','2020-06-29 18:04:34+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('31a45806-4182-46b2-9433-3fcadbee5a5c','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/11fb7273-2ba2-4fea-8030-4a1a0291e522','hogehoge','url','Outer Space','2020-06-29 18:04:34+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('2f49871c-54c4-477e-924f-92d50c936340','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/fe4f0e99-c223-4ee8-9963-9fe2c556ae85','hogehoge','url','Outer Space','2020-06-29 18:04:35+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('12bf00ab-2cc2-4935-9872-6d3acdbc1d5d','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/13adf364-5844-4a67-8a12-023c116a0317','hogehoge','url','Nebula','2020-06-29 18:04:37+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('547631f3-74d6-4432-91eb-00f9c8db89ce','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/38dd9dc1-2d4a-4d0d-8cdd-28416fcf78b0','hogehoge','url','Nebula','2020-06-29 18:04:38+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('3a67364a-1c57-4e7c-a9b4-b38f813519f5','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/5d0b3cd6-1214-44e8-9b6b-cd3afdff3b10','hogehoge','url','Outer Space','2020-06-29 18:04:39+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('d855c1ca-800b-4986-9ff5-2065387ba4fd','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/4659b91d-c3b3-403f-b4fd-5ba166242b68','hogehoge','url','Outer Space','2020-06-29 18:04:42+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('4f56ad3d-707f-4e1c-bba2-dc5ec4a0fa8a','mrypq','https://www.gettyimages.co.jp/%E5%86%99%E7%9C%9F/galaxy?family=creative&license=rf&phrase=galaxy&sort=mostpopular','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/a17681ce-c333-40a4-b662-18870a285923','hogehoge','url','Nebula','2020-06-29 18:04:43+09');


-- パスタ
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('a8ea34dd-ac15-498d-b95a-952700492613','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/b9a5adf5-68f0-493a-bd48-dcd7e9816519','hogehoge','url','Spaghetti','2020-06-30 09:44:40+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('178c4e9e-9e56-4efb-9897-d819a22547e0','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/e343c75a-70e5-4616-a03d-6e98b7a0f032','hogehoge','url','Spaghetti','2020-06-30 09:44:41+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('2f0480eb-d4e7-4199-b6eb-d40030c1b5bd','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/6944e60c-32b9-4dbd-b363-cfbe98fc1526','hogehoge','url','Spaghetti','2020-06-30 09:44:42+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('c3921eb9-c923-4397-967a-7924b1c060eb','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/a415f8fd-5847-4531-88ee-80bb3ab3877b','hogehoge','url','Spaghetti','2020-06-30 09:44:44+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('4e1a7248-cdf7-41c1-8e42-7ecc9f4caeea','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/671516c1-c238-4d7a-8e96-82d803c7fb38','hogehoge','url','Spaghetti','2020-06-30 09:44:45+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('51a55a61-1bcf-4510-962c-2cc0ca9758a0','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/0e3edb08-4801-4889-a7bf-f90e38681a99','hogehoge','url','Spaghetti','2020-06-30 09:44:45+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('9181b009-5bca-4fa9-af0e-8a5e61b121e3','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/db66fd32-582d-494e-9fb0-918f459cc39b','hogehoge','url','Spaghetti','2020-06-30 09:44:51+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('9ca2ea68-9bb6-4ccf-9730-54f7feab4a8a','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/fe32b632-17e7-40ba-934d-d90d4b699617','hogehoge','url','Spaghetti','2020-06-30 09:44:53+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('1fab6db9-ca34-44d4-b183-b0c51f3c39f7','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/2dde3c10-3887-4148-be9d-8d148d5318f3','hogehoge','url','Spaghetti','2020-06-30 09:44:55+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('cdc3508c-e992-484f-9142-bdcfd389dea6','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/8728d06d-397b-42ff-be55-c1de531518fd','hogehoge','url','Spaghetti','2020-06-30 09:44:55+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('f5f65f4d-a330-4250-8ec4-d3bd08eb4f04','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/e7c200bd-2e34-47d9-840f-9bf9c9a378ed','hogehoge','url','Spaghetti','2020-06-30 09:44:57+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('05ee6f3b-069a-4360-805b-d8206f69f03a','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/64e971dd-cbcb-48b3-9732-171b74768f4d','hogehoge','url','Spaghetti','2020-06-30 09:44:57+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('c2539759-9e48-4788-b324-9c3ab0640d5f','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/0f14839e-a180-4ef8-b3f7-764f5320e074','hogehoge','url','Spaghetti','2020-06-30 09:44:59+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('bb61d6e7-92e2-42da-afa0-2ed35afa936f','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/04997de1-692f-463a-bce6-be6d0eb7cf21','hogehoge','url','Spaghetti','2020-06-30 09:45:00+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('308c6f37-f7d6-4108-827e-24a046309090','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/f33ccd4b-add1-4223-8424-01fe62af7bfb','hogehoge','url','Spaghetti','2020-06-30 09:45:02+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('61e19bbd-d54f-408a-a0b3-89dee5795837','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/e00964f8-960f-4e10-8435-308ff85281e4','hogehoge','url','Spaghetti','2020-06-30 09:45:03+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('fba9095f-b560-44ff-a0f7-3588c131b114','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/5d645452-3c12-4432-a606-24dbde4209a3','hogehoge','url','Spaghetti','2020-06-30 09:45:03+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('bdd40bfc-1380-4663-bab9-e0bae2c41ee8','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/346b4541-2467-46ed-bc53-f78f5a5a9ebe','hogehoge','url','Spaghetti','2020-06-30 09:45:04+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('702422f6-f91c-4531-a840-7e35a3b74569','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/0e1af3b6-b289-4ade-86cd-e1a60a9ad53b','hogehoge','url','Spaghetti','2020-06-30 09:45:05+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('73d73b7a-3e35-4e6b-80fe-284f25b40873','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/e7192c8f-d174-4640-966f-628079824b0e','hogehoge','url','Spaghetti','2020-06-30 09:45:06+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('ea25926f-a46d-43ee-a5ac-e449c49979ee','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/3a74a1bc-1d8d-4210-ba13-490083e19b20','hogehoge','url','Spaghetti','2020-06-30 09:45:07+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('c2da20d7-5a78-4680-a4ca-a8f72117a888','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/c229964a-d4e2-41d1-afb9-750137d474a9','hogehoge','url','Spaghetti','2020-06-30 09:45:07+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('66983d26-cd47-4475-add5-e1c675026484','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/b7efc043-bb46-4543-b501-ab4a13905ad7','hogehoge','url','Spaghetti','2020-06-30 09:45:08+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('87398c12-2ffb-4d8f-a189-377cf25425d9','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/975d435a-d346-4553-9c68-5bc38c3f7ffd','hogehoge','url','Spaghetti','2020-06-30 09:45:08+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('96ce26b1-f46a-47fd-accc-1431ccaa5cee','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1224256251?assettype=image&compositions=stilllife&family=creative&license=rf&numberofpeople=none&phrase=spaghetti%20%20%E9%A3%9F%E4%BA%8B&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/7ddb8913-d1f0-46b0-94a1-b75266ccd9fc','hogehoge','url','Spaghetti','2020-06-30 09:45:09+09');

INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('a2562468-1e46-4c26-93ac-47366b34e6a4','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/c86a641a-c8d0-450a-a5f4-ab4e10b78b0a','hogehoge','url','Cat','2020-06-30 10:07:26+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('3b18c344-436d-4264-81e4-6505820fa444','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/16ff8fd8-e33d-4947-84b0-7a06c851d882','hogehoge','url','Cat','2020-06-30 10:07:31+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('e76d2692-a103-4e3a-bde5-ac54dce87672','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/094b959e-76fb-43ab-955b-2b879152d22b','hogehoge','url','Cat','2020-06-30 10:07:32+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('db092c52-a439-4ce0-a580-36f44689962f','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/cd89e5fc-00a7-49b9-a515-fdb89d8910f4','hogehoge','url','Cat','2020-06-30 10:07:33+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('91bd7e5d-ef2b-4d34-a2b2-57a3e2d3965e','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/c68d1263-3bf4-419e-9696-045dc6f57fe4','hogehoge','url','Cat','2020-06-30 10:07:33+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('bcb4faf6-c65a-44a8-937e-3640a3bc64a0','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/d3435c20-c6c3-460a-996e-1feb4ae8705c','hogehoge','url','Cat','2020-06-30 10:07:34+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('f1b879e6-d11d-42ca-ace5-714c69e8cd9d','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/87e50f55-e10e-40aa-9a6a-aeae15e14410','hogehoge','url','Cat','2020-06-30 10:07:35+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('8db9a3ac-7de0-4f5c-a3bc-932ece03a9ca','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/12d34919-ef5f-402b-972f-7e45077e2028','hogehoge','url','Cat','2020-06-30 10:07:36+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('4f0c94d4-a9dd-4d64-94fd-30019737961c','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/80ae4be9-3d7c-4b14-81f1-9bf379458fe5','hogehoge','url','Cat','2020-06-30 10:07:36+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('eec3736a-d6ae-4682-813b-294ef0c7bcad','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/924e7c7e-6d64-4bfd-ba5f-5eebafb3f646','hogehoge','url','Cat','2020-06-30 10:07:37+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('cd9634f1-9e48-4902-8a9e-09c6ec73cebb','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/acbeb8e7-7d14-48fc-ae5a-122c0a62b70b','hogehoge','url','Cat','2020-06-30 10:07:38+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('5ddf47d5-d87e-4165-bca2-dd8d8568d734','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/4086b04c-6902-40cb-9ee4-3a11b37ac4ec','hogehoge','url','Cat','2020-06-30 10:07:40+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('528ab270-be87-445f-a8ee-c74bbd8c0101','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/4dc3891e-f811-4600-b82b-127a1a6f2fc1','hogehoge','url','Cat','2020-06-30 10:07:42+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('4d8f7a57-fd4d-4453-b97c-f3eb47e61760','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/2e422398-c4b3-4fc8-a2da-cfb53e1cf152','hogehoge','url','Cat','2020-06-30 10:07:43+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('3e8a26b5-b5bb-4cfa-9276-4dc3a04a5db8','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/2cc173ab-5a08-427c-82de-0213c6bb2f2b','hogehoge','url','Cat','2020-06-30 10:07:43+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('9e151942-6a70-4111-b2a8-4c4265af39c0','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/1ba980dc-c7ac-4472-a3da-ee5ddbab3c08','hogehoge','url','Cat','2020-06-30 10:07:45+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('7e4157fc-ec20-4a5f-b905-28c1770f851b','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/02e6d421-08b7-4666-857a-7ed190ce2b0d','hogehoge','url','Cat','2020-06-30 10:07:45+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('605e73e3-399d-431d-9db3-de012e701c22','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/fc3ad712-3d44-4133-ac19-825955de52f6','hogehoge','url','Cat','2020-06-30 10:07:47+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('4204e3d5-54b4-4787-89ba-77a7edc1c33c','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/8ea23f4d-aab0-4985-bd7f-0221c097f089','hogehoge','url','Cat','2020-06-30 10:07:49+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('d57b480d-03a4-4cbb-a44e-8070d3f727a5','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/37460e10-a805-4439-98b7-73020d534abc','hogehoge','url','Cat','2020-06-30 10:07:49+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('395b3106-1127-4a7b-9846-ea2b0719a521','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/38ceb045-0ebf-480e-a442-c8297f7d3b38','hogehoge','url','Cat','2020-06-30 10:07:49+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('b1ec161a-1659-4752-b7b3-3e8cf1d1ffe1','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/9dd0e9e9-93be-4ed0-9015-d9038a43be3d','hogehoge','url','Cat','2020-06-30 10:07:50+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('49401af7-4fd8-4f01-b7b5-6904d9b7e9b0','mrypq','https://www.gettyimages.co.jp/search/more-like-this/855294700?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E7%8C%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/513ba68d-00c7-4f76-97b6-30b5dea6e474','hogehoge','url','Cat','2020-06-30 10:07:52+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('14695b6e-2731-4651-9f02-5675a994645f','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/a6689862-b0f6-48de-b0d2-1f9b92054c1c','hogehoge','url','Car','2020-06-30 10:08:50+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('72843dfa-a95a-4f82-a823-4a32368b654d','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/9d75676d-4979-4365-b4e5-cbf7f25ec704','hogehoge','url','Car','2020-06-30 10:08:50+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('6d7cf53c-d1c2-4052-bf51-cd4d554423a5','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/75752f67-b89c-4cbf-bcf9-70b321d10460','hogehoge','url','Car','2020-06-30 10:08:51+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('140bf942-449d-488f-8cfb-4bf1b7cfcf5a','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/5a32ef44-60b8-41b7-ae4a-a5bcd08b7745','hogehoge','url','Car','2020-06-30 10:08:51+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('3e2cbbec-9dd4-4a89-8d21-1eb9d67f7d59','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/fe5176ba-3edc-4f42-b5f9-42824afb6a1e','hogehoge','url','Car','2020-06-30 10:08:52+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('4d349c7f-72b2-4fcf-8a53-bc843c2c87de','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/35dd083a-bad8-47a3-b434-a58281b927c4','hogehoge','url','Car','2020-06-30 10:08:53+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('4029d2b4-a419-4d84-a96a-417332ea8b25','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/e7c90720-bbb5-436b-ad26-595377572c79','hogehoge','url','Car','2020-06-30 10:08:53+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('ec8482e1-55d5-44d5-ab05-c1af6a813450','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/f9315b60-064b-45cc-b06d-4939e44c4229','hogehoge','url','Car','2020-06-30 10:08:54+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('d24b7383-0c3a-49ee-97eb-49a67434872b','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/adbc54fa-2de1-4e11-896e-5c9e7efbd3a1','hogehoge','url','Car','2020-06-30 10:08:54+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('cd552cf1-29d4-4e3f-82de-894cd79b7389','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/cc643226-724b-42bb-b438-46092f995914','hogehoge','url','Car','2020-06-30 10:08:55+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('70256504-e952-4f30-bc69-70ee39a0bd90','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/3e7fb02d-6dc8-4820-84a8-e9dfe402d3f3','hogehoge','url','Car','2020-06-30 10:08:55+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('ef08b9b5-4d51-4198-99a0-2d43af4690f2','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/72e4d3d3-1577-44fb-97fe-35cbeeb3863e','hogehoge','url','Car','2020-06-30 10:08:56+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('6882bcaa-ee73-4cb8-a3c4-f1cd3efbaa14','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/248d5a22-2c08-4303-a68e-d91e78ad0a4a','hogehoge','url','Car','2020-06-30 10:08:56+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('f62b356c-6667-49df-bf93-2c931c476de9','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/bfa2a9e8-d2aa-483d-b06e-56349fa4a783','hogehoge','url','Car','2020-06-30 10:08:57+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('861f4644-dca4-4094-b349-df421fb0dd43','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/da938acb-7da5-4a50-9754-a1aac413a2de','hogehoge','url','Car','2020-06-30 10:08:58+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('32f8c297-bb6b-4593-8216-10f0c79b4a57','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/1698db21-73ef-4663-b79b-610947745987','hogehoge','url','Car','2020-06-30 10:08:58+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('e40be951-a82b-4b56-adc2-bbf636f65d13','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/18548c43-6a83-4b83-9fe9-213c61369638','hogehoge','url','Car','2020-06-30 10:08:59+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('2f598931-788d-4597-9d40-a0e7cb29131b','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/9b544d6c-9147-42eb-9c63-6256076d9bfc','hogehoge','url','Car','2020-06-30 10:08:59+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('b1dc1cb3-2f05-4746-8822-7ab157d8d0ad','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/136963a4-7c09-454c-a8aa-818be21c5bf3','hogehoge','url','Car','2020-06-30 10:09:00+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('dcac8bd6-605a-49bb-9ce7-2c4858efd9d9','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/ffd05635-f4e6-4fe1-be1a-70d29055a827','hogehoge','url','Car','2020-06-30 10:09:01+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('0347a10f-60f6-4acb-b621-28076ce4318e','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/a20c13d0-4b7a-4ba0-929e-d311d1718085','hogehoge','url','Car','2020-06-30 10:09:01+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('d30fbae7-728f-4c57-92c9-86affc43f4c0','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/9cc7b1a6-80e0-4619-ad03-fa88c29f638c','hogehoge','url','Car','2020-06-30 10:09:02+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('c53ddeba-9ea8-4e29-a8e2-c2c28308efeb','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/b8e44f2d-230b-4454-8876-7589c58d4f4f','hogehoge','url','Car','2020-06-30 10:09:03+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('888ef02b-8eb9-4d98-a46b-85e059238ee5','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/7cbda8c1-5eb2-4139-ae59-f869c41744d1','hogehoge','url','Car','2020-06-30 10:09:03+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('6aed1ca5-7f87-409b-8e2f-754a8f0aa9a2','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/512714e0-8ab3-4841-b7de-46760b09346b','hogehoge','url','Car','2020-06-30 10:09:03+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('bf59e7b7-94e9-4831-99ef-5f410477d608','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/9c23b6be-9a12-48be-ad08-c4f7264700d1','hogehoge','url','Car','2020-06-30 10:09:04+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('8ee08b08-aa74-4ebf-b558-c761ac3ffd4d','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/f9515510-d2cd-4335-9aaf-9014f1d357fe','hogehoge','url','Car','2020-06-30 10:09:04+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('01eb89a6-4468-4468-821e-c01642a201e4','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/c565e981-c3ae-46ee-8c00-7fc0da8b8236','hogehoge','url','Car','2020-06-30 10:09:07+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('eacee2ac-230a-4510-8cda-b7f664b56de0','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/08d02c98-1072-4c82-9bfb-41fa7a35f98f','hogehoge','url','Car','2020-06-30 10:09:08+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('179863a4-e1d6-423e-b393-76909e15c9ba','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/f2c9364c-d206-4ccc-b709-c88d54373d60','hogehoge','url','Car','2020-06-30 10:09:08+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('6e7f1039-0d41-4dfe-8d59-48692b498050','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/0caa1bb4-488f-4139-9574-c844520a0f33','hogehoge','url','Car','2020-06-30 10:09:09+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('0cc49c45-0ee6-4dca-8643-aef4140109bf','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/efc80b23-af72-469d-b130-515b20d6f48a','hogehoge','url','Car','2020-06-30 10:09:09+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('161bd5f5-3f3a-407f-85c8-f93f67f2282f','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/f2fcf09c-9f4c-4dbe-9ad7-1afa7b6a089d','hogehoge','url','Car','2020-06-30 10:09:10+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('d987a930-8a40-4b12-8833-4e520e4e1d2f','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/92c505b7-845a-488b-b132-9d36657cd661','hogehoge','url','Car','2020-06-30 10:09:11+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('f0b2cfc4-a788-4818-9d2b-21e09fd1ae29','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/63116055-71f8-41f3-83b9-c2a619dfe499','hogehoge','url','Car','2020-06-30 10:09:11+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('127e6d6b-a784-41ba-ab3c-917f5fddfff9','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/04e8a0a0-a879-4403-9276-6e5139e74c6a','hogehoge','url','Car','2020-06-30 10:09:12+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('0df211f2-986b-4f51-a562-18208e9749c8','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/69046f44-f3a6-424e-8631-2a843c887cce','hogehoge','url','Car','2020-06-30 10:09:13+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('57c875b9-fd28-43ca-9f5f-8197942a20ba','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/bc00ef83-c431-4f7f-86c4-7c8a1149335d','hogehoge','url','Car','2020-06-30 10:09:14+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('fc5b7fd9-abbc-4787-9248-a0d92055f71c','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/19360334-a3b1-47b0-ad15-00425db00fc5','hogehoge','url','Car','2020-06-30 10:09:14+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('7134e946-6624-4eee-80be-97ebc1480260','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/4a69d2bf-a966-478a-8a22-7adbd1977517','hogehoge','url','Car','2020-06-30 10:09:15+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('341a92af-ba86-40eb-97d8-c970e831b780','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/3fa97060-c42e-42b2-bbda-90f03ad49dc0','hogehoge','url','Car','2020-06-30 10:09:15+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('19c8a664-d9ab-409d-af41-480d5c1eb4c8','mrypq','https://www.gettyimages.co.jp/search/more-like-this/143175423?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E8%BB%8A&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/b5557002-a608-4946-8a3d-aa2f420c0c31','hogehoge','url','Car','2020-06-30 10:09:16+09');


INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('3929c6bb-ad55-46a0-b0e4-18c4bc0ab405','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/0c5d8f42-f553-4371-808c-e91b05184061','hogehoge','url','Candle','2020-06-30 10:10:08+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('7852c6d5-1a31-4f0a-93e5-ec2418d938ab','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/502ef0e5-3c21-4ab9-a437-22882e3dfba5','hogehoge','url','Candle','2020-06-30 10:10:10+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('aa5cc18a-37f3-45bb-9d95-3028959ec1e4','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/0bb6d4f2-e46d-42c3-9f71-e1199e317dc5','hogehoge','url','Candle','2020-06-30 10:10:10+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('e2c14df0-4ca5-4ffb-8574-94c8ab023149','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/962e453a-ca79-4aca-ba94-b60d69a4708b','hogehoge','url','Candle','2020-06-30 10:10:11+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('9ee7c777-d133-4934-8542-b8d92e50d387','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/3e56a197-3911-4150-bfa1-a3af0875b34a','hogehoge','url','Candle','2020-06-30 10:10:12+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('b5de7091-26b8-495a-8e56-284dc5106e50','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/52ed18a6-a9d6-41f4-80da-8f7bd7d3b855','hogehoge','url','Candle','2020-06-30 10:10:13+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('f47fee9e-da69-4ba8-984d-ecf325e72591','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/d430918c-a2fe-4261-aec1-19cf8c535219','hogehoge','url','Candle','2020-06-30 10:10:13+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('a2649b8a-c885-4496-b2f2-52d58123c4ad','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/e5d9978f-502b-453a-88c7-51162e2674f0','hogehoge','url','Candle','2020-06-30 10:10:13+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('c28c2a99-9cb9-4836-a399-b22481a9a9a3','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/a2c2afe5-4238-4f22-b1b6-229373e3227a','hogehoge','url','Candle','2020-06-30 10:10:14+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('9a153307-4db0-4d6e-a422-e7e590f368b3','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/4d3dba95-4a8b-4908-866d-f897929b50ec','hogehoge','url','Candle','2020-06-30 10:10:14+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('52f69a64-f328-40bf-90f5-683e0c22a5c2','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/3d11ecf8-c8fd-4349-931c-e3c270e523fd','hogehoge','url','Candle','2020-06-30 10:10:15+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('311a7cbb-4b5f-4fc8-a8d2-5eef737057e4','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/aca5dd83-9561-47ba-b87f-26dce30da62c','hogehoge','url','Candle','2020-06-30 10:10:17+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('b516a0bf-f1ce-4253-8362-e8c533758bd5','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/02d13277-5d04-4c3e-ba06-fc44345bd8ea','hogehoge','url','Candle','2020-06-30 10:10:17+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('ed76cb9b-856a-4f67-89db-c58df84b2108','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/79224e96-1130-4416-b40c-34f79f801aab','hogehoge','url','Candle','2020-06-30 10:10:17+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('8debe616-5c20-459b-938f-e3082a508074','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/64e7aac6-1bae-468d-8a7a-fed3d91fccf6','hogehoge','url','Candle','2020-06-30 10:10:18+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('6af5d424-3426-46af-a59b-e6fd28a289d3','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/d57ea38f-70e4-47d9-9729-5a712f105594','hogehoge','url','Candle','2020-06-30 10:10:18+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('a1b85372-1be8-4036-b095-0bd167347348','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/46138b9c-061d-4450-aba2-1d78f8bf7fbe','hogehoge','url','Candle','2020-06-30 10:10:19+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('e8aceb1d-a1a9-492f-bbe3-a9b3d10f0c54','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/4d7c190e-06db-4a43-babd-f7b1fc370af3','hogehoge','url','Candle','2020-06-30 10:10:19+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('598d142d-8073-46d2-8b9f-68b38a8c15f6','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/38aaa8f0-f940-4e74-acd9-543d4720ae68','hogehoge','url','Candle','2020-06-30 10:10:20+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('301b005f-6f52-42dd-8df6-6ea53fa76dbc','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/d2b620cb-61cd-4092-96a3-53888bb61eef','hogehoge','url','Candle','2020-06-30 10:10:20+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('2aad93be-7e9c-4576-a25b-6e47da78bd3d','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/d748e9c9-2995-42a5-9534-98f4d076ccaa','hogehoge','url','Candle','2020-06-30 10:10:20+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('345395a3-078e-4790-8766-7b22b75c7243','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/5ea9967e-5127-40e6-a6e8-43df7c3ad615','hogehoge','url','Candle','2020-06-30 10:10:21+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('385b3a93-8a53-4710-8bd1-e66d1486800f','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/8c413bce-1fd3-4fed-87ee-ad8d4ec4068a','hogehoge','url','Candle','2020-06-30 10:10:22+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('ed94abe6-1a64-4bb1-a63c-50bd4ff7b425','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/1eb340c4-6aac-4c7b-89dd-c969deb88827','hogehoge','url','Candle','2020-06-30 10:10:23+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('c8384328-9f73-4da4-a825-48cc174bf5e7','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/94e34ac8-41ee-404a-a37d-735d46c70dca','hogehoge','url','Candle','2020-06-30 10:10:23+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('62036edc-2aa5-41a4-8433-20b41196a36d','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/4a55374c-3b1f-4654-a49b-d452808481af','hogehoge','url','Candle','2020-06-30 10:10:23+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('6ec8caee-f838-4b2c-bfff-177c55a01c15','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/b138b2de-d5a7-42b7-95fe-95c86071fbf6','hogehoge','url','Candle','2020-06-30 10:10:24+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('904cf035-6186-489b-a73c-27dc1a41a407','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/b29b09aa-e638-45b4-8840-72a7b8939075','hogehoge','url','Candle','2020-06-30 10:10:24+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('6325e54c-7631-4e20-a6b5-c6ac4343136c','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/3ab12560-007d-488c-abff-6a5387878374','hogehoge','url','Candle','2020-06-30 10:10:25+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('1b0f5732-1465-46dc-99fe-9278a4b28aa3','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/f5147b04-a17f-4551-beb9-fef1ca06d8d9','hogehoge','url','Candle','2020-06-30 10:10:26+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('b2d0d0bf-fb7a-459f-9acf-63275ea90f3c','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/3d59ffd0-13f3-4e61-8811-2434b12c6240','hogehoge','url','Candle','2020-06-30 10:10:26+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('b754756b-daf5-4b4a-9508-0b4e24ec9822','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/79229432-a24b-450d-878a-3083fcd65537','hogehoge','url','Candle','2020-06-30 10:10:27+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('44743552-744b-4f9c-bc60-084a5b40c9fc','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/07d9e9a2-12aa-4a19-b246-d4d2411969d6','hogehoge','url','Candle','2020-06-30 10:10:27+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('c4cd1e28-2e74-424a-9d04-4eb92d23a954','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/47b6f6ff-c0e0-497f-abda-f2a2decdc3f4','hogehoge','url','Candle','2020-06-30 10:10:28+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('d00769e8-ba02-4012-bf00-8d48f83ebe76','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/75f6c3b7-b887-4125-bc3e-434ef9308904','hogehoge','url','Candle','2020-06-30 10:10:29+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('d91c391d-3fce-4480-95b9-f784b20aae0d','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/b3cbb24d-a63b-4efe-b1e9-2bf4ffe4d40c','hogehoge','url','Candle','2020-06-30 10:10:30+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('48796ccc-c978-4a5d-9dda-a68cf625e4e2','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/18d09593-1c76-4d2f-a17b-f46af1aeea12','hogehoge','url','Candle','2020-06-30 10:10:31+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('f66c5cb1-b408-4941-b0c3-766e7d16a592','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/a5eae77a-3d4b-4260-ba07-8ee98f5e4f40','hogehoge','url','Candle','2020-06-30 10:10:32+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('6a356990-86c3-490c-bcaf-f0580bb683c2','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/38eaab05-d3ef-4525-b76d-a66fd3eafb5b','hogehoge','url','Candle','2020-06-30 10:10:32+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('3e977cbf-7b5b-4c40-8d69-e5d3712bf342','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/d7d913a4-3896-4f25-812a-ccd054c2e292','hogehoge','url','Candle','2020-06-30 10:10:33+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('ba22ad31-ada3-4e6b-acee-0ff864f29948','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/d8993476-908a-46a9-b836-584f256b9b7b','hogehoge','url','Candle','2020-06-30 10:10:34+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('e07ce187-a451-41a8-b03a-e1330bdd4ac5','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/6a26322a-df73-4e67-b1f9-e45393c1c468','hogehoge','url','Candle','2020-06-30 10:10:34+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('b1020ced-0174-4171-84e2-f9b9b2d2cd28','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/31753157-32e7-4a73-b2d6-a775fd1ebc5c','hogehoge','url','Candle','2020-06-30 10:10:35+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('036cae75-52cf-4bb9-8bc5-079b862bfeb7','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/937af8fd-ef08-46be-8079-6447961ad9f1','hogehoge','url','Candle','2020-06-30 10:10:35+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('f07a2ed8-dd7b-4c32-be9c-4d481c9b04a4','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/9c89d759-5fc5-4b50-8a09-8db6945d2121','hogehoge','url','Candle','2020-06-30 10:10:36+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('67b370d9-8be5-4f08-bfb6-9520c99b8f45','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/f10f7c9d-1ed4-4ebf-b82f-d32b36d0cb62','hogehoge','url','Candle','2020-06-30 10:10:36+09');
INSERT INTO pin (id, user_id, url, title, image_url, description, upload_type, label, created_at) VALUES ('aebd6593-1784-4dd5-a055-e5d1be3e657f','mrypq','https://www.gettyimages.co.jp/search/more-like-this/1083717484?assettype=image&family=creative&license=rf&numberofpeople=none&phrase=%E3%82%AF%E3%83%AA%E3%82%B9%E3%83%9E%E3%82%B9%E3%80%80%E3%82%AD%E3%83%A3%E3%83%B3%E3%83%89%E3%83%AB&sort=mostpopular#license','hogehoge','https://bucket-pinterest-001.s3.ap-northeast-1.amazonaws.com/fixtures/603738c9-c596-457b-99fa-3bfde4d8ae24','hogehoge','url','Candle','2020-06-30 10:10:37+09');

