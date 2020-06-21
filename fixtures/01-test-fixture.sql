CREATE EXTENSION pgcrypto;


-- ----------- topic -----------
-- デフォルトはNULL？外部キー制約いらない＞
-- [TODO ]

INSERT INTO topic(id, name)
VALUES('ca15c1f4-35ef-48d1-8384-646050c699b9',
'アート'
);

INSERT INTO topic(id, name)
VALUES('ddf3aab7-744b-4b3f-a9ea-6592f6d67eac',
'写真'
);

INSERT INTO topic(id, name)
VALUES('779f38f3-3430-4ba0-9731-d60041cee2db',
'アウトドア'
);

INSERT INTO topic(id, name)
VALUES('54a43a11-b652-4591-b043-5865af254687',
'アニメ・フィギュア'
);

INSERT INTO topic(id, name)
VALUES('004d09c5-c788-4468-9b68-96b5735ced9b',
'イラスト・ポスター'
);

INSERT INTO topic(id, name)
VALUES('1fc63a86-8c58-4b8a-8cb8-e249c7d37905',
'インテリア'
);

INSERT INTO topic(id, name)
VALUES('8d25a80c-b794-4d19-b3f8-16b1d1c19193',
'ウェディング'
);

INSERT INTO topic(id, name)
VALUES('512d3e08-02f4-4044-a06d-b0a23df61080',
'エンターテイメント'
);

INSERT INTO topic(id, name)
VALUES('8d076aab-d2cb-416c-ab7e-405ef2e6ef89',
'ガーデニング'
);

INSERT INTO topic(id, name)
VALUES('78b52885-f7f9-490f-9d58-18561eff700a',
'自然・科学'
);

INSERT INTO topic(id, name)
VALUES('5f7e6c79-e7b7-481b-a63b-d7e604372372',
'教育関連'
);

INSERT INTO topic(id, name)
VALUES('7ff88c1b-a884-4fd6-a7ef-05e6b09fc79f',
'建築'
);

INSERT INTO topic(id, name)
VALUES('5f4635d6-e7a4-49fb-bbec-128c2dbd56d9',
'子供・子育て'
);

INSERT INTO topic(id, name)
VALUES('6bf77210-422f-4bee-a611-e2689699a7ac',
'車・バイク'
);

INSERT INTO topic(id, name)
VALUES('234c5e79-d6a7-4c1a-b6d4-7c6120b3eb48',
'スポーツ'
);

INSERT INTO topic(id, name)
VALUES('f707f6c6-1490-41d2-b651-6b85f0563c3d',
'生活雑貨'
);

INSERT INTO topic(id, name)
VALUES('b90a6ba6-bf86-43d0-9723-c6ada4721816',
'セレブ・有名人'
);

INSERT INTO topic(id, name)
VALUES('7dcc3930-c058-412a-99e1-b732ef36bbf6',
'DIY・ハンドメイド'
);

INSERT INTO topic(id, name)
VALUES('cd8bf150-a5b7-417d-b070-8cd5ba7a51a1',
'デザイン'
);

INSERT INTO topic(id, name)
VALUES('cf76d2ed-a255-4363-a9d2-855170e1fee6',
'動物・ペット'
);

INSERT INTO topic(id, name)
VALUES('1ca44c07-f20c-4992-89bd-aa8e66997c02',
'フード・ドリンク'
);

INSERT INTO topic(id, name)
VALUES('2c51528d-e6c4-4126-bc09-26fd847c0834',
'ヘア・ビューティー'
);

INSERT INTO topic(id, name)
VALUES('5b931b3a-139d-4d0c-b15e-94403a70cc57',
'ヘルス・フィットネス'
);

INSERT INTO topic(id, name)
VALUES('dc420b83-9127-4baa-aea4-ffd41cfc5527',
'ホリデー・イベント'
);

INSERT INTO topic(id, name)
VALUES('90fed106-2572-4ef2-83c8-1139b147b5c4',
'名言'
);

INSERT INTO topic(id, name)
VALUES('1f97f571-f1ab-4e41-9ce6-4f5145649c8f',
'メンズファッション'
);

INSERT INTO topic(id, name)
VALUES('9ebe6323-a0a5-454e-8a1b-ba3ba222c2b4',
'ユーモア'
);

INSERT INTO topic(id, name)
VALUES('f77b2692-2788-4e7e-a175-ab10d13ee305',
'旅行'
);

INSERT INTO topic(id, name)
VALUES('3f9cbe32-9e2a-41b4-a4cd-e6644810c79f',
'歴史'
);

INSERT INTO topic(id, name)
VALUES('4fee81ce-a0fb-429f-ab71-e68d46507615',
'レディースファッション'
);

INSERT INTO topic(id, name)
VALUES('8083e9df-e30e-457f-b853-2bb70fbb025b',
'その他'
);
-- ----------- user_account -----------
INSERT INTO user_account (id, first_name, last_name, email, password_hash, role, profile_image, description, location, web, created_at) 
VALUES ('mrypq', 'めろ子', 'めろ田',
'meromero@mero.com',  crypt('meromero', gen_salt('bf')), 'admin',
'https://github.com/teamb-prince/test_storage/blob/master/image/profile_image.jpeg',
'めろぴっぴです', 'めろ王国', 'https://github.com/mrypq', '2020-01-01 10:10:10+09'
);

INSERT INTO user_account (id, first_name, last_name, email, password_hash, role, profile_image, description, location, web, created_at) 
VALUES ('mrypq2', 'めろ美', 'めろ川',
'meromero2@mero.com', crypt('meromero2', gen_salt('bf')), 'user',
'https://github.com/teamb-prince/test_storage/blob/master/image/profile_image2.jpeg',
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
'https://automaton-media.com/wp-content/uploads/2019/05/20190501-91106-001.jpg',
'6a8a04cb-bd3b-4606-b88c-593dc4e51d63',
'かわいい！！！！！！！！！！！！！',
'2020-01-02 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at) 
VALUES ('dfa9eecf-4614-4679-a43e-33aee806fd24', 
'mrypq',
'mrypq',
'https://photo.oscasierra.net/tdr-201604/',
'2016年04月に東京ディズニーリゾートで撮影した厳選写真',
'https://c2.staticflickr.com/2/1496/26433173610_10a5654b94_o.jpg',
'596e415e-f74e-46ab-b0dc-a00c70efb8f3',
'行きたい！！！！！！！！！！！！！',
'2020-01-03 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at) 
VALUES ('279fc672-dd59-4b80-bbbd-9d44e2a91d53', 
'mrypq',
'mrypq',
'https://skyticket.jp/guide/101453/2',
'日本の美しい世界遺産「厳島神社」神の島、宮島で悠久の時を越えた旅',
'https://skyticket.jp/guide/wp-content/uploads/shutterstock_252533968.jpg',
'596e415e-f74e-46ab-b0dc-a00c70efb8f3',
'行きたい！！！！！！！！！！！！！',
'2020-01-04 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at) 
VALUES ('297dca85-53fd-4e56-b023-c5bc456b9a39', 
'mrypq',
'mrypq',
'https://resoco.jp/4371',
'ドバイの夜景スポット15選！おすすめスポット＆レストラン',
'https://d1fv7zhxzrl2y7.cloudfront.net/articlecontents/103160/dobai_AdobeStock_211353756.jpeg?1555031349',
'596e415e-f74e-46ab-b0dc-a00c70efb8f3',
'行きたい！！！！！！！！！！！！！',
'2020-01-05 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at) 
VALUES ('c126d948-7e48-489f-a51e-c7b21a63b418', 
'mrypq',
'mrypq',
'http://www.niigata-sushi.com/',
'にいがた鮨三昧',
'https://lh3.googleusercontent.com/proxy/oyYDOOMGebEqXY90J8cE1YwDrxVXmslnZl6EawoFh3F-Avc726a4dkrljr5gUt3pFm1vkFainmBfAB4fq4LVIhJx0qaGt8YktoXaxg',
'ab339fe0-c32c-46e8-87c1-befcfee42d28',
'食べたい！！！！！！！！！！！！！',
'2020-01-06 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at) 
VALUES ('f1cfa29e-036c-4b3b-ada9-998e659ae36d', 
'mrypq',
'mrypq',
'http://net.keizaikai.co.jp/archives/41822',
'パスタ ジェノベーゼ',
'https://cdn.sbfoods.co.jp/recipes/06608_l.jpg',
'ab339fe0-c32c-46e8-87c1-befcfee42d28',
'食べたい！！！！！！！！！！！！！',
'2020-01-07 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at) 
VALUES ('993abdff-7c75-43fb-9238-a8fd13bffd78', 
'mrypq',
'mrypq',
'https://art-of-clarity.livejournal.com/111276.html',
'[Animated GIFs] KAT-TUN: Greatest Journey PV',
'https://images3.imgbox.com/4a/4a/XnWFHADP_o.gif',
'3b7de911-dc1b-445f-8593-47af710707b5',
'すき！！！！！！！！！！！！！',
'2020-01-08 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at) 
VALUES ('1a856d62-f26a-4209-ae2a-936c460dda66', 
'mrypq2',
'mrypq2',
'https://town.epark.jp/lp/m-sunshine-aquarium/',
'【サンシャイン水族館】天空を羽ばたくペンギンと感動に出会える池袋のアクアリウム',
'https://town.epark.jp/lp/magazine/wp-content/uploads/2019/11/sunshine_aquarium.jpg',
'9220ecec-0c44-447c-93b6-1903e3209a91',
'きて！！！！！！！！！！！！！',
'2020-01-09 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at) 
VALUES ('da16fe8a-5224-4891-8afb-bab884f7aa24', 
'mrypq',
'mrypq',
'https://www.pakutaso.com/20160346074post-7251.html',
'星空が反射するウユニ塩湖の雨季｜無料の写真素材はフリー素材のぱくたそ',
'https://www.pakutaso.com/shared/img/thumb/MIYA16021200DSC_1905_TP_V4.jpg',
'596e415e-f74e-46ab-b0dc-a00c70efb8f3',
'行きたい！！！！！！！！！！！！！',
'2020-01-10 10:10:10+09');

INSERT INTO pin (id, user_id, original_user_id, url, title, image_url, board_id, description, created_at)  
VALUES ('81e646da-b3dc-4380-aa63-ac58b74b1689', 
'mrypq2',
'mrypq2',
'https://twitter.com/konicaminoltamt',
'コニカミノルタプラネタリウム満天（池袋） (@konicaminoltamt) | Twitter',
'https://pbs.twimg.com/media/EZoZKkBUMAARw9Z.jpg',
'9220ecec-0c44-447c-93b6-1903e3209a91',
'きて！！！！！！！！！！！！！',
'2020-01-11 10:10:10+09');

