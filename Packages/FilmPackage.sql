create or replace package body FilmPackage as

procedure GetAllFilms
as
  cursor cur is select * from film;
  rec cur%rowtype;
begin
    dbms_output.put_line('TITLE|DESCRIPTION|DIRECTOR|COUNTRY|BUDGET|RELEASE|FEES');
    for rec in cur
    loop
          dbms_output.put_line(rec.TITLE||'|'||rec.DESCRIPTION||'|'||rec.DIRECTOR||'|'||rec.COUNTRY||'|'||rec.BUDGET||'|'||rec.RELEASE||'|'||rec.FEES );
    end loop;
end;

function GetFilmsCount return number
is
    count_films number;
begin
    select count(*) into count_films from FILM;
    return count_films;
end;

procedure SearchFilmByContainingTitleIgnoreCase(p_Title FILM.Title%type)
is
    cursor cur is select f.title, f.description, f.director, f.country, f.budget, f.release, f.fees from film f where upper(f.title) like '%'||upper(p_Title)||'%';
    Title FILM.Title%type;
    Description FILM.Description%type;
    Director FILM.Director%type;
    Country FILM.Country%type;
    Budget FILM.Budget%type;
    Release FILM.Release%type;
    Fees FILM.Fees%type;
begin
    open cur;
    fetch cur into Title, Description, Director, Country, Budget, Release, Fees;
    while cur%found loop
        dbms_output.put_line(Title||'(DESCRIPTION: '||Description||', DIRECTOR: '||Director||', COUNTRY: '||Country||', BUDGET: '||Budget||', RELEASE: '||Release||', FEES: '||Fees||')');
        fetch cur into Title, Description, Director, Country, Budget, Release, Fees;
    end loop;
    close cur;
end SearchFilmByContainingTitleIgnoreCase;

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