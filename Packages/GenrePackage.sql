create or replace package body GenrePackage as

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