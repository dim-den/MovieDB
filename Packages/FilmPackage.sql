create or replace package body FilmPackage as

-- Insert
procedure AddFilm (
p_Title in FILM.Title%type,
p_Description in FILM.Description%type,
p_Director in FILM.Director%type,
p_Country in FILM.Country%type,
p_Budget in FILM.Budget%type,
p_Fees in FILM.Fees%type,
p_Release in FILM.Release%type
) is
begin
    insert into FILM(Description,Director,Title,Country,Budget,Fees,Release) values 
    (p_Description,p_Director,p_Title,p_Country,p_Budget,p_Fees,p_Release);
end;

-- Update
procedure UpdateFilm (
p_ID in FILM.ID%type,
p_Title in FILM.Title%type,
p_Description in FILM.Description%type,
p_Director in FILM.Director%type,
p_Country in FILM.Country%type,
p_Budget in FILM.Budget%type,
p_Release in FILM.Release%type,
p_Fees in FILM.Fees%type
) is
begin
    update FILM set
    Description = p_Description,
    Director = p_Director,
    Title = p_Title,
    Country = p_Country,
    Budget = p_Budget,
    Fees = p_Fees,
    Release = p_Release
    where ID = p_ID;
end;

-- Delete
procedure DeleteFilm (
p_ID in FILM.ID%type
) is
begin
    delete from FILM
    where ID = p_ID;
end;


end FilmPackage;