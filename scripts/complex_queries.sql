-- Выберем только кинотеатры, где количество посетителей за все время больше 3
SELECT c.cinema_name, count(session_id) AS count_of_visitors
FROM mt.screening s
LEFT JOIN mt.cinema c ON s.cinema_id = c.cinema_id
GROUP BY c.cinema_name
HAVING count(session_id) > 3
ORDER BY count_of_visitors DESC;

-- Суммарное количество показов во всех кинотеатрах
SELECT s.cinema_id, c.cinema_name, count(session_id) AS count_of_sessions
FROM mt.screening s
LEFT JOIN mt.cinema c on s.cinema_id = c.cinema_id
GROUP BY s.cinema_id, c.cinema_name;

-- Средния цена билета по всем кинотеатрам
SELECT s.cinema_id, c.cinema_name, ROUND(avg(p.price), 1) AS avg_price
FROM mt.screening s
LEFT JOIN mt.purchase p on s.session_id = p.session_id
LEFT JOIN mt.cinema c on c.cinema_id = s.cinema_id
GROUP BY s.cinema_id, c.cinema_name;

-- Количество посетителей за все время. Указано сколько человек посетило конктерный зал в кинотеатре
-- и залы отранжированы функций rank() по количеству посетителей в каждом кинотеатре
SELECT c.cinema_name, hall_id, count(movie_id) AS num_of_visitors,
       rank() over (partition by cinema_name order by count(movie_id) DESC) AS rank_of_halls
FROM mt.screening s
RIGHT JOIN mt.purchase p on s.session_id = p.session_id
LEFT JOIN mt.cinema c on c.cinema_id = s.cinema_id
GROUP BY cinema_name, hall_id;

-- Самый популярный фильм для каждого кинотеатра за все время
WITH tmp AS (
    SELECT cinema_id, movie_id,
           count(session_id) OVER (PARTITION BY cinema_id, movie_id) AS num
    FROM mt.screening
    ), final_table AS (
        SELECT *,
               row_number() OVER (PARTITION BY cinema_id ORDER BY num DESC) AS dense_rank_
        FROM tmp
    )
SELECT c.cinema_name, m.title AS most_popular_movie
FROM final_table f
LEFT JOIN mt.movie m ON m.movie_id = f.movie_id
LEFT JOIN mt.cinema c ON c.cinema_id = f.cinema_id
WHERE dense_rank_ = 1;


-- Список 10 пользователей, которые купили максимальное число билетов
SELECT u.user_id, u.name, count(ticket_id) AS number_of_visits
FROM mt.user u
RIGHT JOIN mt.ticket t on u.user_id = t.user_id
GROUP BY u.user_id, u.name
ORDER BY number_of_visits DESC
LIMIT 10;