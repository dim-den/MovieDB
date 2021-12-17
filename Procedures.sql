create or replace package FilmPackage as

procedure GetAllFilms;

procedure SearchFilmByContainingTitleIgnoreCase(p_Title FILM.Title%type);

function GetFilmsCount return number;

procedure AddFilm (
p_Title in FILM.Title%type,
p_Description in FILM.Description%type,
p_Director in FILM.Director%type,
p_Country in FILM.Country%type,
p_Budget in FILM.Budget%type,
p_Fees in FILM.Fees%type,
p_Release in FILM.Release%type
);

procedure UpdateFilm (
p_ID in FILM.ID%type,
p_Title in FILM.Title%type,
p_Description in FILM.Description%type,
p_Director in FILM.Director%type,
p_Country in FILM.Country%type,
p_Budget in FILM.Budget%type,
p_Release in FILM.Release%type,
p_Fees in FILM.Fees%type
);

procedure DeleteFilm (
p_ID in FILM.ID%type
);

end FilmPackage;

create or replace package ActorPackage as

procedure GetAllActors;

procedure SearchActorByContainingSurnameIgnoreCase(p_SURNAME ACTOR.SURNAME%type);

function GetActorsCount return number;

procedure AddActor (
p_NAME in ACTOR.NAME%type,
p_SURNAME in ACTOR.SURNAME%type,
p_COUNTRY in ACTOR.COUNTRY%type,
p_BDAY in ACTOR.BDAY%type
);

procedure UpdateActor (
p_ID in ACTOR.ID%type,
p_NAME in ACTOR.NAME%type,
p_SURNAME in ACTOR.SURNAME%type,
p_COUNTRY in ACTOR.COUNTRY%type,
p_BDAY in ACTOR.BDAY%type
);

procedure DeleteActor (
p_ID in ACTOR.ID%type
);

end ActorPackage;

create or replace package UserPackage as

procedure Login(
p_EMAIL USERS.EMAIL%type, 
p_PASSWORD_HASH USERS.PASSWORD_HASH%type);

procedure Register(
p_EMAIL in USERS.EMAIL%type,
p_USERNAME in USERS.USERNAME%type,
p_PASSWORD_HASH in USERS.PASSWORD_HASH%type,
p_ROLE in USERS.ROLE%type);

procedure GetAllUsers;

function GetUsersCount return number;

procedure AddUser (
p_EMAIL in USERS.EMAIL%type,
p_USERNAME in USERS.USERNAME%type,
p_PASSWORD_HASH in USERS.PASSWORD_HASH%type,
p_ROLE in USERS.ROLE%type
);

procedure UpdateUser (
p_ID in USERS.ID%type,
p_EMAIL in USERS.EMAIL%type,
p_USERNAME in USERS.USERNAME%type,
p_PASSWORD_HASH in USERS.PASSWORD_HASH%type,
p_ROLE in USERS.ROLE%type
);

procedure DeleteUser (
p_ID in USERS.ID%type
);

end UserPackage;

create or replace package GenrePackage as

procedure GetAllGenres;

function GetGenresCount return number;

procedure AddGenre (
p_NAME in Genre.NAME%type
);

procedure UpdateGenre (
p_ID in Genre.ID%type,
p_NAME in Genre.NAME%type
);

procedure DeleteGenre(
p_ID in Genre.ID%type
);

end GenrePackage;

create or replace package FilmReviewPackage as

procedure GetAllFilmReviews;

function GetFilmReviewsCount return number;

function GetFilmAvgScore(p_FILM_ID FILM_REVIEW.FILM_ID%type) return float;

procedure AddFilmReview (
p_REVIEW  FILM_REVIEW.REVIEW%type,
p_SCORE  FILM_REVIEW.SCORE%type,
p_PUBLISHED  FILM_REVIEW.PUBLISHED%type,
p_FILM_ID  FILM_REVIEW.FILM_ID%type,
p_USER_ID  FILM_REVIEW.USER_ID%type
);

procedure UpdateFilmReview (
p_ID  FILM_REVIEW.ID%type,
p_REVIEW  FILM_REVIEW.REVIEW%type,
p_SCORE  FILM_REVIEW.SCORE%type,
p_PUBLISHED  FILM_REVIEW.PUBLISHED%type,
p_FILM_ID  FILM_REVIEW.FILM_ID%type,
p_USER_ID  FILM_REVIEW.USER_ID%type
);

procedure DeleteFilmReview (
p_ID  FILM_REVIEW.ID%type
);

end FilmReviewPackage;

create or replace package FilmCastPackage as

procedure GetAllFilmCasts;

function GetFilmCastsCount return number;

procedure AddFilmCast (
p_ROLE_TYPE in FILM_CAST.ROLE_TYPE%type,
p_ROLE_NAME in FILM_CAST.ROLE_NAME%type,
p_ACTOR_ID in FILM_CAST.ACTOR_ID%type,
p_FILM_ID in FILM_CAST.FILM_ID%type
);

procedure UpdateFilmCast (
p_ID in FILM_CAST.ID%type,
p_ROLE_TYPE in FILM_CAST.ROLE_TYPE%type,
p_ROLE_NAME in FILM_CAST.ROLE_NAME%type,
p_ACTOR_ID in FILM_CAST.ACTOR_ID%type,
p_FILM_ID in FILM_CAST.FILM_ID%type
);

procedure DeleteFilmCast (
p_ID in FILM_CAST.ID%type
);

end FilmCastPackage;

create or replace package FilmGenrePackage as

procedure GetAllFilmGenres;

function GetFilmGenresCount return number;

procedure AddFilmGenre (
p_FILM_ID in FILM_GENRES.FILM_ID%type,
p_GENRE_ID in FILM_GENRES.GENRE_ID%type
);

procedure UpdateFilmGenre (
p_ID in FILM_GENRES.ID%type,
p_FILM_ID in FILM_GENRES.FILM_ID%type,
p_GENRE_ID in FILM_GENRES.GENRE_ID%type
);

procedure DeleteFilmGenre (
p_ID in FILM_GENRES.ID%type
);

end FilmGenrePackage;

create or replace package DataExportPackage as
    procedure ExportFilms;
    procedure ExportActors;
    procedure ExportUsers;
    procedure ExportGenres;
    procedure ExportFilmCasts;
    procedure ExportFilmReviews;
    procedure ExportFilmGenres;
end DataExportPackage;

create or replace package DataImportPackage as
  procedure ImportActors (fname varchar2);
  procedure ImportFilms (fname varchar2);
  procedure ImportUsers (fname varchar2);
  procedure ImportGenres (fname varchar2);
  procedure ImportFilmReviews (fname varchar2);
  procedure ImportFilmCasts (fname varchar2);
  procedure ImportFilmGenres (fname varchar2);
end DataImportPackage;

create or replace package DataGeneratorPackage as
  procedure GenerateActors (rows_count number);
  procedure GenerateFilms (rows_count number);
  procedure GenerateUsers (rows_count number);
end DataGeneratorPackage;


