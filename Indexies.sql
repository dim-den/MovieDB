CREATE INDEX FILM_TITLE_INDEX ON FILM (TITLE);

CREATE INDEX FILM_GENRES_FILM_ID_INDEX ON FILM_GENRES (FILM_ID);
CREATE INDEX FILM_GENRES_GENRE_ID_INDEX ON FILM_GENRES (GENRE_ID);

CREATE INDEX FILM_REVIEW_USER_ID_INDEX ON FILM_REVIEW (USER_ID);
CREATE INDEX FILM_REVIEW_FILM_ID_INDEX ON FILM_REVIEW (FILM_ID);

CREATE INDEX FILM_CAST_ACTOR_ID_INDEX ON FILM_CAST (ACTOR_ID);
CREATE INDEX FILM_CAST_FILM_ID_INDEX ON FILM_CAST (FILM_ID);

select film.title, genre.name from film 
inner join film_genres on film.id = film_genres.film_id  
inner join genre on film_genres.genre_id = genre.id
where title like 'Black%' ;

begin
    DataGeneratorPackage.GenerateFilms(100000);
end;

select count(*) from film;

delete from film where id > 20;
commit;