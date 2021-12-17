create or replace package body FilmCastPackage as

procedure GetAllFilmCasts
as
  cursor cur is select * from film_cast;
  rec cur%rowtype;
begin
    dbms_output.put_line('ROLE_NAME|ROLE_TYPE|ACTOR_ID|FILM_ID');
    for rec in cur
    loop
          dbms_output.put_line(rec.ROLE_NAME||'|'||rec.ROLE_TYPE||'|'||rec.ACTOR_ID||'|'||rec.FILM_ID );
    end loop;
end;

function GetFilmCastsCount return number
is
    count_film_casts number;
begin
    select count(*) into count_film_casts from FILM_CAST;
    return count_film_casts;
end;


-- Insert
procedure AddFilmCast (
p_ROLE_TYPE in FILM_CAST.ROLE_TYPE%type,
p_ROLE_NAME in FILM_CAST.ROLE_NAME%type,
p_ACTOR_ID in FILM_CAST.ACTOR_ID%type,
p_FILM_ID in FILM_CAST.FILM_ID%type
) is
begin
    insert into FILM_CAST(ROLE_TYPE,ROLE_NAME,ACTOR_ID,FILM_ID) values 
    (p_ROLE_TYPE,p_ROLE_NAME,p_ACTOR_ID,p_FILM_ID);
end;

-- Update
procedure UpdateFilmCast (
p_ID in FILM_CAST.ID%type,
p_ROLE_TYPE in FILM_CAST.ROLE_TYPE%type,
p_ROLE_NAME in FILM_CAST.ROLE_NAME%type,
p_ACTOR_ID in FILM_CAST.ACTOR_ID%type,
p_FILM_ID in FILM_CAST.FILM_ID%type
) is
begin
    update FILM_CAST set
    ROLE_NAME = p_ROLE_NAME,
    ROLE_TYPE = p_ROLE_TYPE,
    ACTOR_ID = p_ACTOR_ID,  
    FILM_ID = p_FILM_ID
where ID = p_ID;
end;

-- Delete
procedure DeleteFilmCast (
p_ID in FILM_CAST.ID%type
) is
begin
    delete from FILM_CAST
    where ID = p_ID;
end;

end FilmCastPackage;