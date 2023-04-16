--
SELECT *
FROM mt.movie;

SELECT user_id, name, join_date
FROM mt.user;

SELECT s.session_id, m.title
FROM mt.screening s
LEFT JOIN mt.movie m ON s.movie_id = m.movie_id;

--
INSERT INTO mt.movie VALUES (3, 'Криминальное чтиво', 'Криминал, Драма', 'Квентин Тарантино', 'Джон Траволта, Сэмюэл Л. Джексон, Тим Рот', 'Двое бандитов Винсент Вега и Джулс Винфилд ведут философские беседы в перерывах между разборками и решением проблем с должниками криминального босса Марселласа Уоллеса...', 154);
INSERT INTO mt.movie VALUES (4, 'Джанго освобожденный', 'Боевик, Драма, Комедия', 'Квентин Тарантино', 'Джейми Фокс, Кристоф Вальц, Леонардо ДиКаприо', 'Шульц — эксцентричный охотник за головами, который выслеживает и отстреливает самых опасных преступников. Он освобождает раба по имени Джанго...', '165');

--
UPDATE mt.user
SET name = 'Dima555'
WHERE user_id = 23;

UPDATE mt.user
SET name = 'Sofa Vorobeva'
WHERE user_id = 3;

UPDATE mt.hall
SET hall_size = 15
WHERE hall_id = 3;
