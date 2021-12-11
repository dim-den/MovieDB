create or replace package body DataExportPackage as

procedure ExportFilms
is
    l_file UTL_FILE.file_type; --для дескриптора
    l_file_name VARCHAR2 (60) := 'Films.xml'; --имя файла
    
    cursor all_entities is select * from FILM;
    one_entity xmltype; --одна запись в xml
    sup FILM%rowtype; --для курсора
    sup_string varchar2(1024); --для записи в файл

    begin
        l_file := UTL_FILE.fopen ('EXPORT_DIR', l_file_name, 'w');
        UTL_FILE.put_line (l_file, '<?xml version= "1.0" ?>');
        UTL_FILE.put_line (l_file, '<Films>');
        open all_entities;
        fetch all_entities into sup;
        while all_entities%found loop
            select 
            XMLElement("Film",
              XMLElement("id", sup.ID),
              XMLElement("title", sup.title),
              XMLElement("description", sup.description),           
              XMLElement("director", sup.director),
              XMLElement("release", sup.release),
              XMLElement("country", sup.country),
              XMLElement("fees", sup.fees),
              XMLElement("budget", sup.budget))
            into one_entity from dual;
            sup_string := one_entity.getStringVal();
            UTL_FILE.put_line (l_file, sup_string);
fetch all_entities into sup;
end loop;
close all_entities;
UTL_FILE.put_line (l_file, '</Films>');
UTL_FILE.fclose (l_file);
end ExportFilms;

procedure ExportActors
is
    l_file UTL_FILE.file_type; --для дескриптора
    l_file_name VARCHAR2 (60) := 'Actors.xml'; --имя файла
    
    cursor all_entities is select * from Actor;
    one_entity xmltype; --одна запись в xml
    sup Actor%rowtype; --для курсора
    sup_string varchar2(1024); --для записи в файл

    begin
        l_file := UTL_FILE.fopen ('EXPORT_DIR', l_file_name, 'w');
        UTL_FILE.put_line (l_file, '<?xml version= "1.0" ?>');
        UTL_FILE.put_line (l_file, '<Actors>');
        open all_entities;
        fetch all_entities into sup;
        while all_entities%found loop
            select 
            XMLElement("Actor",
              XMLElement("id", sup.ID),
              XMLElement("name", sup.name),
              XMLElement("surname", sup.surname),           
              XMLElement("country", sup.country),
              XMLElement("bday", sup.bday))
            into one_entity from dual;
            sup_string := one_entity.getStringVal();
            UTL_FILE.put_line (l_file, sup_string);
fetch all_entities into sup;
end loop;
close all_entities;
UTL_FILE.put_line (l_file, '</Actors>');
UTL_FILE.fclose (l_file);
end ExportActors;

procedure ExportUsers
is
    l_file UTL_FILE.file_type; --для дескриптора
    l_file_name VARCHAR2 (60) := 'Users.xml'; --имя файла
    
    cursor all_entities is select * from Users;
    one_entity xmltype; --одна запись в xml
    sup Users%rowtype; --для курсора
    sup_string varchar2(1024); --для записи в файл

    begin
        l_file := UTL_FILE.fopen ('EXPORT_DIR', l_file_name, 'w');
        UTL_FILE.put_line (l_file, '<?xml version= "1.0" ?>');
        UTL_FILE.put_line (l_file, '<Users>');
        open all_entities;
        fetch all_entities into sup;
        while all_entities%found loop
            select 
            XMLElement("User",
              XMLElement("id", sup.ID),
              XMLElement("email", sup.email),
              XMLElement("username", sup.username),           
              XMLElement("password_hash", sup.password_hash),
              XMLElement("role", sup.role))
            into one_entity from dual;
            sup_string := one_entity.getStringVal();
            UTL_FILE.put_line (l_file, sup_string);
fetch all_entities into sup;
end loop;
close all_entities;
UTL_FILE.put_line (l_file, '</Users>');
UTL_FILE.fclose (l_file);
end ExportUsers;

procedure ExportGenres
is
    l_file UTL_FILE.file_type; --для дескриптора
    l_file_name VARCHAR2 (60) := 'Genres.xml'; --имя файла
    
    cursor all_entities is select * from Genre;
    one_entity xmltype; --одна запись в xml
    sup Genre%rowtype; --для курсора
    sup_string varchar2(1024); --для записи в файл

    begin
        l_file := UTL_FILE.fopen ('EXPORT_DIR', l_file_name, 'w');
        UTL_FILE.put_line (l_file, '<?xml version= "1.0" ?>');
        UTL_FILE.put_line (l_file, '<Genres>');
        open all_entities;
        fetch all_entities into sup;
        while all_entities%found loop
            select 
            XMLElement("Genre",
              XMLElement("id", sup.ID),
              XMLElement("name", sup.name))
            into one_entity from dual;
            sup_string := one_entity.getStringVal();
            UTL_FILE.put_line (l_file, sup_string);
fetch all_entities into sup;
end loop;
close all_entities;
UTL_FILE.put_line (l_file, '</Genres>');
UTL_FILE.fclose (l_file);
end ExportGenres;

procedure ExportFilmCasts
is
    l_file UTL_FILE.file_type; --для дескриптора
    l_file_name VARCHAR2 (60) := 'FilmCasts.xml'; --имя файла
    
    cursor all_entities is select * from FILM_CAST;
    one_entity xmltype; --одна запись в xml
    sup FILM_CAST%rowtype; --для курсора
    sup_string varchar2(1024); --для записи в файл

    begin
        l_file := UTL_FILE.fopen ('EXPORT_DIR', l_file_name, 'w');
        UTL_FILE.put_line (l_file, '<?xml version= "1.0" ?>');
        UTL_FILE.put_line (l_file, '<FilmCasts>');
        open all_entities;
        fetch all_entities into sup;
        while all_entities%found loop
            select 
            XMLElement("FilmCast",
              XMLElement("id", sup.ID),
              XMLElement("role_type", sup.role_type),
              XMLElement("role_name", sup.role_name),
              XMLElement("film_id", sup.film_id),
              XMLElement("actor_id", sup.actor_id))
            into one_entity from dual;
            sup_string := one_entity.getStringVal();
            UTL_FILE.put_line (l_file, sup_string);
fetch all_entities into sup;
end loop;
close all_entities;
UTL_FILE.put_line (l_file, '</FilmCasts>');
UTL_FILE.fclose (l_file);
end ExportFilmCasts;

procedure ExportFilmReviews
is
    l_file UTL_FILE.file_type; --для дескриптора
    l_file_name VARCHAR2 (60) := 'FilmReviews.xml'; --имя файла
    
    cursor all_entities is select * from FILM_REVIEW;
    one_entity xmltype; --одна запись в xml
    sup FILM_REVIEW%rowtype; --для курсора
    sup_string varchar2(1024); --для записи в файл

    begin
        l_file := UTL_FILE.fopen ('EXPORT_DIR', l_file_name, 'w');
        UTL_FILE.put_line (l_file, '<?xml version= "1.0" ?>');
        UTL_FILE.put_line (l_file, '<FilmReviews>');
        open all_entities;
        fetch all_entities into sup;
        while all_entities%found loop
            select 
            XMLElement("FilmReview",
              XMLElement("id", sup.ID),
              XMLElement("review", sup.review),
              XMLElement("published", sup.published),
              XMLElement("score", sup.score),
              XMLElement("film_id", sup.film_id),
              XMLElement("score_id", sup.user_id))
            into one_entity from dual;
            sup_string := one_entity.getStringVal();
            UTL_FILE.put_line (l_file, sup_string);
fetch all_entities into sup;
end loop;
close all_entities;
UTL_FILE.put_line (l_file, '</FilmReviews>');
UTL_FILE.fclose (l_file);
end ExportFilmReviews;

procedure ExportFilmGenres
is
    l_file UTL_FILE.file_type; --для дескриптора
    l_file_name VARCHAR2 (60) := 'FilmGenres.xml'; --имя файла
    
    cursor all_entities is select * from FILM_GENRES;
    one_entity xmltype; --одна запись в xml
    sup FILM_GENRES%rowtype; --для курсора
    sup_string varchar2(1024); --для записи в файл

    begin
        l_file := UTL_FILE.fopen ('EXPORT_DIR', l_file_name, 'w');
        UTL_FILE.put_line (l_file, '<?xml version= "1.0" ?>');
        UTL_FILE.put_line (l_file, '<FilmGenres>');
        open all_entities;
        fetch all_entities into sup;
        while all_entities%found loop
            select 
            XMLElement("FilmGenre",
              XMLElement("id", sup.ID),
              XMLElement("film_id", sup.film_id),
              XMLElement("genre_id", sup.genre_id))
            into one_entity from dual;
            sup_string := one_entity.getStringVal();
            UTL_FILE.put_line (l_file, sup_string);
fetch all_entities into sup;
end loop;
close all_entities;
UTL_FILE.put_line (l_file, '</FilmGenres>');
UTL_FILE.fclose (l_file);
end ExportFilmGenres;

end DataExportPackage;

begin
     DataExportPackage.ExportGenres();
     DataExportPackage.ExportFilmGenres();
end;

end;

SELECT * FROM FILM_GENRES