# Физическая модель

---

Таблица `ticket`:

| Название      | Описание           | Тип данных     | Ограничение   |
|---------------|--------------------|----------------|---------------|
| `ticket_id`   | Идентификатор      | `INTEGER`      | `PRIMARY KEY` |
| `user_id`     | id клиента         | `INTEGER`      | `FOREIGN KEY` |
| `purchase_id` | id сессии          | `INTEGER`      | `FOREIGN KEY` |
| `seat_num`    | место в зале       | `INTEGER`      | `NOT NULL`    |

Таблица `user`:

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


---
Таблица `ticket`:
```postgresql
CREATE TABLE cb.ticket(
    ticket_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    purchase_id INTEGER NOT NULL,
    seat_num INTEGER NOT NULL,

    CONSTRAINT ticket_pk PRIMARY KEY (ticket_id)
);
```

Таблица `user`:
```postgresql
CREATE TABLE cb.employer(
    user_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    card VARCHAR(255) NOT NULL,
    join_date DATE NOT NULL,

    CONSTRAINT employer_pk PRIMARY KEY (user_id)
);
```

Таблица `purchase`:
```postgresql
CREATE TABLE cb.purchase(
    purchase_id INTEGER NOT NULL,
    ticket_id INTEGER NOT NULL,
    session_id INTEGER NOT NULL,
    price INTEGER NOT NULL,

    CONSTRAINT purchase_pk PRIMARY KEY (purchase_id)
);
```

Таблица `movie`:
```postgresql
CREATE TABLE cb.movie(
    movie_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(255) NOT NULL,
    director VARCHAR(255) NOT NULL,
    cast_of_actors VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    duration_min INTEGER NOT NULL,

    CONSTRAINT movie_pk PRIMARY KEY (movie_id)
);
```

Таблица `hall`:
```postgresql
CREATE TABLE cb.hall(
    hall_id INTEGER NOT NULL,
    cinema_id INTEGER NOT NULL,
    hall_size INTEGER NOT NULL,

    CONSTRAINT hall_pk PRIMARY KEY (hall_id)
);
```

Таблица `screening`:
```postgresql
CREATE TABLE cb.screening(
    session_id INTEGER NOT NULL,
    cinema_id INTEGER NOT NULL,
    hall_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
    start_session TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,

    CONSTRAINT session_pk PRIMARY KEY (session_id)
);
```

Таблица `cinema`:
```postgresql
CREATE TABLE cb.cinema(
    cinema_id INTEGER NOT NULL,
    cinema_name VARCHAR(255) NOT NULL,
    lon DOUBLE PRECISION NOT NULL,
    lat DOUBLE PRECISION NOT NULL,

    CONSTRAINT cinema_pk PRIMARY KEY (cinema_id)
);
```

Таблица `session_cinema`:
```postgresql
CREATE TABLE cb.session_cinema(
    sessions_cinema_id INTEGER NOT NULL,
    session_id INTEGER NOT NULL,
    cinema_id INTEGER NOT NULL,

    CONSTRAINT session_cinema_pk PRIMARY KEY (sessions_cinema_id)
);
```
