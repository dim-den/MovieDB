create or replace package body FilmReviewPackage as

procedure GetAllFilmReviews
as
  cursor cur is select * from film_review;
  rec cur%rowtype;
begin
    dbms_output.put_line('REVIEW|SCORE|PUBLISHED|FILM_ID|USER_ID');
    for rec in cur
    loop
          dbms_output.put_line(rec.REVIEW||'|'||rec.SCORE||'|'||rec.PUBLISHED||'|'||rec.FILM_ID||'|'||rec.USER_ID );
    end loop;
end;

function GetFilmReviewsCount return number
is
    count_film_reviews number;
begin
    select count(*) into count_film_reviews from FILM_REVIEW;
    return count_film_reviews;
end;

function GetFilmAvgScore(p_FILM_ID FILM_REVIEW.FILM_ID%type) return float
is
    avg_score float;
begin
    select avg(score) into avg_score from FILM_REVIEW where film_id = p_FILM_ID;
    return avg_score;
end;


-- Insert
procedure AddFilmReview (
p_REVIEW  FILM_REVIEW.REVIEW%type,
p_SCORE  FILM_REVIEW.SCORE%type,
p_PUBLISHED  FILM_REVIEW.PUBLISHED%type,
p_FILM_ID  FILM_REVIEW.FILM_ID%type,
p_USER_ID  FILM_REVIEW.USER_ID%type
) is
begin
    insert into FILM_REVIEW(REVIEW,SCORE,PUBLISHED,FILM_ID,USER_ID) values 
    (p_REVIEW,p_SCORE,p_PUBLISHED,p_FILM_ID,p_USER_ID);
end;

-- Update
procedure UpdateFilmReview (
p_ID  FILM_REVIEW.ID%type,
p_REVIEW  FILM_REVIEW.REVIEW%type,
p_SCORE  FILM_REVIEW.SCORE%type,
p_PUBLISHED  FILM_REVIEW.PUBLISHED%type,
p_FILM_ID  FILM_REVIEW.FILM_ID%type,
p_USER_ID  FILM_REVIEW.USER_ID%type
) is
begin
    update FILM_REVIEW set
    PUBLISHED = p_PUBLISHED,
    SCORE = p_SCORE,
    REVIEW = p_REVIEW,
    USER_ID = p_USER_ID,
    FILM_ID = p_FILM_ID
    where ID = p_ID;
end;

-- Delete
procedure DeleteFilmReview (
p_ID  FILM_REVIEW.ID%type
) is
begin
    delete from FILM_REVIEW
    where ID = p_ID;
end;

end FilmReviewPackage;