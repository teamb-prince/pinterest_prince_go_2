CREATE EXTENSION pgcrypto;

-- ----------- user_account -----------
INSERT INTO user_account (id, first_name, last_name, email, password_hash, role, profile_image, description, location, web, created_at) 
VALUES ('mrypq', 'めろ子', 'めろ田',
'meromero@mero.com',  crypt('meromero', gen_salt('bf')), 'admin',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/profile_image.jpeg',
'めろぴっぴです', 'めろ王国', 'https://github.com/mrypq', '2020-01-01 10:10:10+09'
);

INSERT INTO user_account (id, first_name, last_name, email, password_hash, role, profile_image, description, location, web, created_at) 
VALUES ('mrypq2', 'めろ美', 'めろ川',
'meromero2@mero.com', crypt('meromero2', gen_salt('bf')), 'user',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/profile_image_2.jpg',
'２番手のめろぴっぴです', 'めろ帝国', 'https://github.com/teamb-prince', '2020-02-02 20:20:20+09'
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


-- ----------- pin -----------

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at) 
VALUES ('ab917ee9-bf28-41ff-b914-550728159fae', 
'mrypq',
'mrypq',
'https://automaton-media.com/articles/newsjp/20190501-91106/',
'『LoL』少年アニメをテーマとしたスキンシリーズ「バトルアカデミア」がパッチ9.10で登場',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/20190501-91106-001.jpg',
'6a8a04cb-bd3b-4606-b88c-593dc4e51d63',
'かわいい！！！！！！！！！！！！！',
'2020-01-02 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at) 
VALUES ('dfa9eecf-4614-4679-a43e-33aee806fd24', 
'mrypq',
'mrypq',
'https://photo.oscasierra.net/tdr-201604/',
'2016年04月に東京ディズニーリゾートで撮影した厳選写真',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/26433173610_10a5654b94_o.jpg',
'596e415e-f74e-46ab-b0dc-a00c70efb8f3',
'行きたい！！！！！！！！！！！！！',
'2020-01-03 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at) 
VALUES ('279fc672-dd59-4b80-bbbd-9d44e2a91d53', 
'mrypq',
'mrypq',
'https://www.miyajima.or.jp/history/history.html',
'歴史｜一般社団法人宮島観光協会',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/img_history.jpg',
'596e415e-f74e-46ab-b0dc-a00c70efb8f3',
'行きたい！！！！！！！！！！！！！',
'2020-01-04 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at) 
VALUES ('297dca85-53fd-4e56-b023-c5bc456b9a39', 
'mrypq',
'mrypq',
'https://resoco.jp/4371',
'ドバイの夜景スポット15選！おすすめスポット＆レストラン',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/dobai_AdobeStock_211353756.jpeg',
'596e415e-f74e-46ab-b0dc-a00c70efb8f3',
'行きたい！！！！！！！！！！！！！',
'2020-01-05 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at) 
VALUES ('c126d948-7e48-489f-a51e-c7b21a63b418', 
'mrypq',
'mrypq',
'http://www.niigata-sushi.com/',
'にいがた鮨三昧',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/pic_slider_02.png',
'ab339fe0-c32c-46e8-87c1-befcfee42d28',
'食べたい！！！！！！！！！！！！！',
'2020-01-06 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at) 
VALUES ('f1cfa29e-036c-4b3b-ada9-998e659ae36d', 
'mrypq',
'mrypq',
'http://net.keizaikai.co.jp/archives/41822',
'パスタ ジェノベーゼ',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/06608_l.jpg',
'ab339fe0-c32c-46e8-87c1-befcfee42d28',
'食べたい！！！！！！！！！！！！！',
'2020-01-07 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at) 
VALUES ('993abdff-7c75-43fb-9238-a8fd13bffd78', 
'mrypq',
'mrypq',
'https://art-of-clarity.livejournal.com/111276.html',
'[Animated GIFs] KAT-TUN: Greatest Journey PV',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/XnWFHADP_o.gif',
'3b7de911-dc1b-445f-8593-47af710707b5',
'すき！！！！！！！！！！！！！',
'2020-01-08 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at) 
VALUES ('1a856d62-f26a-4209-ae2a-936c460dda66', 
'mrypq2',
'mrypq2',
'https://town.epark.jp/lp/m-sunshine-aquarium/',
'【サンシャイン水族館】天空を羽ばたくペンギンと感動に出会える池袋のアクアリウム',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/sunshine_aquarium.jpg',
'9220ecec-0c44-447c-93b6-1903e3209a91',
'きて！！！！！！！！！！！！！',
'2020-01-09 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at) 
VALUES ('da16fe8a-5224-4891-8afb-bab884f7aa24', 
'mrypq',
'mrypq',
'https://www.pakutaso.com/20160346074post-7251.html',
'星空が反射するウユニ塩湖の雨季｜無料の写真素材はフリー素材のぱくたそ',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/MIYA16021200DSC_1905_TP_V4.jpg',
'596e415e-f74e-46ab-b0dc-a00c70efb8f3',
'行きたい！！！！！！！！！！！！！',
'2020-01-10 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at)  
VALUES ('81e646da-b3dc-4380-aa63-ac58b74b1689', 
'mrypq2',
'mrypq2',
'https://twitter.com/konicaminoltamt',
'コニカミノルタプラネタリウム満天（池袋） (@konicaminoltamt) | Twitter',
'https://bucket-pinterest-001.s3-ap-northeast-1.amazonaws.com/sample/EZoZKkBUMAARw9Z.jpg',
'9220ecec-0c44-447c-93b6-1903e3209a91',
'きて！！！！！！！！！！！！！',
'2020-01-11 10:10:10+09');

