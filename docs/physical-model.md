# Физическая модель

---

Таблица `ticket`:

| Название        | Описание           | Тип данных     | Ограничение   |
|-----------------|--------------------|----------------|---------------|
| `ticket_id`     | Идентификатор      | `INTEGER`      | `PRIMARY KEY` |
| `usere_id`      | id клиента         | `INTEGER`      | `FOREIGN KEY` |
| `sessions_id`   | id сессии          | `INTEGER`      | `FOREIGN KEY` |
| `seat_num`      | место в зале       | `INTEGER`      | `NOT NULL`    |

Таблица `employer`:

| Название             | Описание                   | Тип данных     | Ограничение   |
|----------------------|----------------------------|----------------|---------------|
| `user_id`            | Идентификатор пользователя | `INTEGER`      | `PRIMARY KEY` |
| `name`               | Имя                        | `VARCHAR(100)` | `NOT NULL`    |
| `phone`              | Номер Телефона             | `VARCHAR(100)` | `NOT NULL`    |
| `email`              | Электронная Почта          | `VARCHAR(100)` | `NOT NULL`    |
| `address`            | Адрес Пользователя         | `VARCHAR(100)` | `NOT NULL`    |
| `card`               | Данные о банковской карте  | `VARCHAR(100)` | `NOT NULL`    |
| `join_date`          | Дата регистрации           | `DATE`         | `NOT NULL`    |

Таблица `purchase`:

| Название       | Описание              | Тип данных | Ограничение   |
|----------------|-----------------------|------------|---------------|
| `purchases_id` | Идентификатор Платежа | `INTEGER`  | `PRIMARY KEY` |
| `ticket_id`    | Идентификатор Билета  | `INTEGER`  | `FOREIGN KEY` |
| `session_id`   | Идентификатор Сессии  | `INTEGER`  | `FOREIGN KEY` |
| `price`        | Цена Билета           | `INTEGER`  | `NOT NULL`    |

Таблица `movie`:

| Название        | Описание               | Тип данных     | Ограничение   |
|-----------------|------------------------|----------------|---------------|
| `movie_id`      | Идентификатор          | `INTEGER`      | `PRIMARY KEY` |
| `title`         | Название               | `VARCHAR(100)` | `NOT NULL`    |
| `genre`         | Жанр                   | `VARCHAR(100)` | `NOT NULL`    |
| `director`      | Режиссер               | `VARCHAR(100)` | `NOT NULL`    |
| `cast_of_actors`| Актеры                 | `VARCHAR(1024)`| `NOT NULL`    |
| `description`   | Описание               | `TEXT`         | `NOT NULL`    |
| `duration_min`  | Длительность(в минутах)| `VARCHAR(100)` | `NOT NULL`    |

Таблица `hall`:

| Название       | Описание              | Тип данных | Ограничение   |
|----------------|-----------------------|------------|---------------|
| `hall_id`      | Идентификатор зала    | `INTEGER`  | `PRIMARY KEY` |
| `cinema_id`    | id кинотеатра         | `INTEGER`  | `FOREIGN KEY` |
| `hall_size`    | Размер зала           | `INTEGER`  | `NOT NULL`    |

Таблица `screening`:

| Название       | Описание                | Тип данных | Ограничение   |
|----------------|-------------------------|------------|---------------|
| `session_id`   | Идентификатор Сессии    | `INTEGER`  | `PRIMARY KEY` |
| `cinema_id`    | Идентификатор кинотеатра| `INTEGER`  | `FOREIGN KEY` |
| `hall_id`      | Идентификатор зала      | `INTEGER`  | `FOREIGN KEY` |
| `movie_id`     | Идентификатор фильма    | `INTEGER`  | `FOREIGN KEY` |
| `start_session`| Время Начала Сессии     | `TIMESTAMP`| `NOT NULL`    |

Таблица `cinema`:

| Название       | Описание                | Тип данных    | Ограничение   |
|----------------|-------------------------|---------------|---------------|
| `cinema_id`    | Идентификатор Кинотеатра| `INTEGER`     | `PRIMARY KEY` |
| `cinema_name`  | Название Кинотеатра     | `VARCHAR(100)`| `NOT NULL`    |
| `lon`          | Долгота Кинотеатра      | `INTEGER`     | `NOT NULL`    |
| `lat`          | Широта Кинотеатра       | `FLOAT`       | `NOT NULL`    |

Таблица `session_cinema`:

| Название           | Описание                | Тип данных    | Ограничение   |
|--------------------|-------------------------|---------------|---------------|
| `session_cinema_id`| Идентификатор           | `INTEGER`     | `PRIMARY KEY` |
| `cinema_name`      | Идентификатор Сессии    | `INTEGER`     | `FOREIGN KEY` |
| `lon`              | Идентификатор Кинотеатра| `INTEGER`     | `FOREIGN KEY` |

