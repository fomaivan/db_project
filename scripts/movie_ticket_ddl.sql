CREATE SCHEMA mt;

CREATE TABLE mt.employer(
    user_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    card VARCHAR(255) NOT NULL,
    join_date DATE NOT NULL,

    CONSTRAINT employer_pk PRIMARY KEY (user_id)
);

CREATE TABLE mt.purchase(
    purchase_id INTEGER NOT NULL,
    ticket_id INTEGER NOT NULL,
    session_id INTEGER NOT NULL,
    price INTEGER NOT NULL,

    CONSTRAINT purchase_pk PRIMARY KEY (purchase_id)
);

CREATE TABLE mt.screening(
    session_id INTEGER NOT NULL,
    cinema_id INTEGER NOT NULL,
    hall_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
    start_session TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,

    CONSTRAINT session_pk PRIMARY KEY (session_id)
);

CREATE TABLE mt.ticket(
    ticket_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    session_id INTEGER NOT NULL,
    seat_num INTEGER NOT NULL,

    CONSTRAINT ticket_pk PRIMARY KEY (ticket_id)
);

CREATE TABLE mt.cinema(
    cinema_id INTEGER NOT NULL,
    cinema_name VARCHAR(255) NOT NULL,
    lon DOUBLE PRECISION NOT NULL,
    lat DOUBLE PRECISION NOT NULL,

    CONSTRAINT cinema_pk PRIMARY KEY (cinema_id)
);

CREATE TABLE mt.movie(
    movie_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(255) NOT NULL,
    director VARCHAR(255) NOT NULL,
    cast_of_actors VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    duration_min INTEGER NOT NULL,

    CONSTRAINT movie_pk PRIMARY KEY (movie_id)
);

CREATE TABLE mt.hall(
    hall_id INTEGER NOT NULL,
    cinema_id INTEGER NOT NULL,
    hall_size INTEGER NOT NULL,

    CONSTRAINT hall_pk PRIMARY KEY (hall_id)
);

CREATE TABLE mt.session_cinema(
    sessions_cinema_id INTEGER NOT NULL,
    session_id INTEGER NOT NULL,
    cinema_id INTEGER NOT NULL,

    CONSTRAINT session_cinema_pk PRIMARY KEY (sessions_cinema_id)
);


----------------------------------------------Add FOREIGN KEY--------------------------------------------------------
ALTER TABLE mt.session_cinema
    ADD CONSTRAINT session_cinema_id_screening_foreign FOREIGN KEY(session_id) REFERENCES mt.screening (session_id);
ALTER TABLE mt.session_cinema
    ADD CONSTRAINT session_cinema_id_cinema_foreign2 FOREIGN KEY(cinema_id) REFERENCES mt.cinema (cinema_id);
ALTER TABLE mt.purchase
    ADD CONSTRAINT purchase_session_id_foreign FOREIGN KEY(session_id) REFERENCES mt.screening(session_id);
ALTER TABLE mt.purchase
    ADD CONSTRAINT purchase_ticket_id_foreign FOREIGN KEY(ticket_id) REFERENCES mt.ticket(ticket_id);
ALTER TABLE mt.hall ADD
    CONSTRAINT hall_cinema_id_foreign FOREIGN KEY(cinema_id) REFERENCES mt.cinema(cinema_id);
ALTER TABLE mt.screening
    ADD CONSTRAINT session_movie_id_foreign FOREIGN KEY(movie_id) REFERENCES mt.movie(movie_id);
ALTER TABLE mt.screening
    ADD CONSTRAINT session_hall_id_foreign FOREIGN KEY(hall_id) REFERENCES mt.hall(hall_id);
ALTER TABLE mt.screening
    ADD CONSTRAINT session_cinema_id_foreign FOREIGN KEY(cinema_id) REFERENCES mt.cinema(cinema_id);
ALTER TABLE mt.ticket
    ADD CONSTRAINT ticket_user_id_foreign FOREIGN KEY(user_id) REFERENCES mt.employer(user_id);
ALTER TABLE mt.ticket
    ADD CONSTRAINT ticket_session_id_foreign FOREIGN KEY(session_id) REFERENCES mt.screening(session_id);

