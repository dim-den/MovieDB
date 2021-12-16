create or replace package body FilmGenrePackage as

function GetFilmGenresCount return number
is
    count_film_genres number;
begin
    select count(*) into count_film_genres from FILM_GENRES;
    return count_film_genres;
end;

-- Insert
procedure AddFilmGenre (
p_FILM_ID in FILM_GENRES.FILM_ID%type,
p_GENRE_ID in FILM_GENRES.GENRE_ID%type
) is
begin
    insert into FILM_GENRES(FILM_ID, GENRE_ID) values 
    (p_FILM_ID, p_GENRE_ID);
end;

-- Update
procedure UpdateFilmGenre (
p_ID in FILM_GENRES.ID%type,
p_FILM_ID in FILM_GENRES.FILM_ID%type,
p_GENRE_ID in FILM_GENRES.GENRE_ID%type
) is
begin
    update FILM_GENRES set
    FILM_ID = p_FILM_ID,
    GENRE_ID = p_GENRE_ID
    where ID = p_ID;
end;

-- Delete
procedure DeleteFilmGenre (
p_ID in FILM_GENRES.ID%type
) is
begin
    delete from FILM_GENRES
    where ID = p_ID;
end;

end FilmGenrePackage;