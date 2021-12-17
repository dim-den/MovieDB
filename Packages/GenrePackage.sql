create or replace package body GenrePackage as

procedure GetAllGenres
as
  cursor cur is select * from genre;
  rec cur%rowtype;
begin
    dbms_output.put_line('NAME');
    for rec in cur
    loop
          dbms_output.put_line(rec.NAME );
    end loop;
end;

function GetGenresCount return number
is
    count_genres number;
begin
    select count(*) into count_genres from Genre;
    return count_genres;
end;


-- Insert
procedure AddGenre (
p_NAME in Genre.NAME%type
) is
begin
    insert into Genre(NAME) values 
    (p_NAME);
end;

-- Update
procedure UpdateGenre (
p_ID in Genre.ID%type,
p_NAME in Genre.NAME%type
) is
begin
    update Genre set    
    NAME = p_NAME
    where ID = p_ID;
end;

-- Delete
procedure DeleteGenre (
p_ID in Genre.ID%type
) is
begin
    delete from Genre
    where ID = p_ID;
end;

end GenrePackage;