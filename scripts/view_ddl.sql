--информация о пользователях, с скрытой личной информацией информацией
CREATE OR REPLACE VIEW user_view AS
SELECT user_id, name, concat(CONCAT('+7', repeat('*', 6)), RIGHT(phone, 2)),
       regexp_replace(email, '^[^@]*', repeat('*', length(split_part(email, '@', 1))), '') as email
FROM mt.user;


--информация о пользователях, с скрытой личной информацией информацией и из билеты
CREATE OR REPLACE VIEW user_card_view AS
SELECT u.user_id, u.name, concat(concat(left(u.card, 2), repeat('*', length(u.card) - 6)), right(card, 4)),
       'X' AS seat_num, p.price
FROM mt.user u
RIGHT JOIN mt.ticket t ON u.user_id = t.user_id
LEFT JOIN mt.purchase p ON t.ticket_id = p.ticket_id;
SELECT *
FROM user_card_view;

-- Представление с средния цена билета по всем кинотеатрам
CREATE OR REPLACE VIEW avg_price AS
SELECT s.cinema_id, c.cinema_name, ROUND(avg(p.price), 1) AS avg_price
FROM mt.screening s
LEFT JOIN mt.purchase p on s.session_id = p.session_id
LEFT JOIN mt.cinema c on c.cinema_id = s.cinema_id
GROUP BY s.cinema_id, c.cinema_name;

-- Самые активные пользователи(больше всего куплено билетов)
CREATE OR REPLACE VIEW top_user AS
SELECT u.user_id, u.name, count(ticket_id) AS number_of_visits
FROM mt.user u
RIGHT JOIN mt.ticket t on u.user_id = t.user_id
GROUP BY u.user_id, u.name
ORDER BY number_of_visits DESC;

