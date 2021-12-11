create or replace package body FilmCastPackage as

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