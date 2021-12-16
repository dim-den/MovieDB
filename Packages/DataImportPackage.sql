CREATE TABLE tab1 (
    id NUMBER,
    clob_data CLOB
);

create or replace package body DataImportPackage as

procedure ImportActors (fname varchar2)
is
    TYPE actor_rec IS RECORD (
        name varchar2(255),
        surname varchar2(255),
        country varchar2(255),
        bday TIMESTAMP(6));
        
    l_bfile BFILE;
    l_clob CLOB;
    l_dest_offset INTEGER := 1;
    l_src_offset INTEGER := 1;
    l_bfile_csid NUMBER := 0;
    l_lang_context INTEGER := 0;
    l_warning INTEGER := 0;
    
    xml clob;
    type curtype is ref cursor;
    cur curtype;
    entity_row actor_rec;
begin
    INSERT INTO tab1 (id, clob_data)  VALUES (1, empty_clob())
    RETURN clob_data INTO l_clob;

    l_bfile := BFILENAME('IMPORT_DIR', fname);
    DBMS_LOB.fileopen(l_bfile, DBMS_LOB.file_readonly);
    
    DBMS_LOB.loadclobfromfile ( 
    dest_lob => l_clob,
    src_bfile => l_bfile,
    amount => DBMS_LOB.lobmaxsize,
    dest_offset => l_dest_offset,
    src_offset => l_src_offset,
    bfile_csid => l_bfile_csid ,
    lang_context => l_lang_context,
    warning => l_warning);
    DBMS_LOB.fileclose(l_bfile); 

    commit;
    select clob_data into xml from tab1;
    dbms_output.put_line(to_char(xml));
    
    open cur for select * 
    FROM XMLTABLE('/Actors/Actor' 
    PASSING xmltype( to_char(xml)) COLUMNS
        name varchar2(255) PATH './name',
        surname varchar2(255) PATH './surname',
        country varchar2(255) PATH './country',
        bday TIMESTAMP(6) PATH './bday');
        
    fetch cur into entity_row;
    while cur%found loop
        ActorPackage.AddActor(entity_row.name, entity_row.surname, entity_row.country, entity_row.bday);
        fetch cur into entity_row;
    end loop;
    close cur;
    
    --truncate table tab1;
    EXECUTE IMMEDIATE 'TRUNCATE TABLE tab1';
    commit;
    exception
    when others then dbms_output.put_line(sqlerrm);
end ImportActors;

procedure ImportFilms (fname varchar2)
is
    TYPE film_rec IS RECORD (
        title varchar2(255),
        description varchar2(255),
        director varchar2(255),
        country varchar2(255),
        budget number,
        fees number,
        release TIMESTAMP(6));
        
    l_bfile BFILE;
    l_clob CLOB;
    l_dest_offset INTEGER := 1;
    l_src_offset INTEGER := 1;
    l_bfile_csid NUMBER := 0;
    l_lang_context INTEGER := 0;
    l_warning INTEGER := 0;
    
    xml clob;
    type curtype is ref cursor;
    cur curtype;
    entity_row film_rec;
begin
    INSERT INTO tab1 (id, clob_data)  VALUES (1, empty_clob())
    RETURN clob_data INTO l_clob;

    l_bfile := BFILENAME('IMPORT_DIR', fname);
    DBMS_LOB.fileopen(l_bfile, DBMS_LOB.file_readonly);
    
    DBMS_LOB.loadclobfromfile ( 
    dest_lob => l_clob,
    src_bfile => l_bfile,
    amount => DBMS_LOB.lobmaxsize,
    dest_offset => l_dest_offset,
    src_offset => l_src_offset,
    bfile_csid => l_bfile_csid ,
    lang_context => l_lang_context,
    warning => l_warning);
    DBMS_LOB.fileclose(l_bfile); 

    commit;
    select clob_data into xml from tab1;
    dbms_output.put_line(to_char(xml));
    
    open cur for select * 
    FROM XMLTABLE('/Films/Film' 
    PASSING xmltype( to_char(xml)) COLUMNS
        title varchar2(255) PATH './title',
        description varchar2(255) PATH './description',
        director varchar2(255) PATH './director',
        country varchar2(255) PATH './country',
        budget number PATH './budget',
        fees number PATH './fees',
        release TIMESTAMP(6)PATH './release');
        
    fetch cur into entity_row;
    while cur%found loop
        FilmPackage.AddFilm(entity_row.title, entity_row.description, entity_row.director, entity_row.country, entity_row.budget, entity_row.fees, entity_row.release);
        fetch cur into entity_row;
    end loop;
    close cur;
    
    --truncate table tab1;
    EXECUTE IMMEDIATE 'TRUNCATE TABLE tab1';
    commit;
    exception
    when others then dbms_output.put_line(sqlerrm);
end ImportFilms;

procedure ImportUsers (fname varchar2)
is
    TYPE user_rec IS RECORD (
        email varchar2(255),
        username varchar2(255),
        password_hash varchar2(255),
        role varchar2(255));
        
    l_bfile BFILE;
    l_clob CLOB;
    l_dest_offset INTEGER := 1;
    l_src_offset INTEGER := 1;
    l_bfile_csid NUMBER := 0;
    l_lang_context INTEGER := 0;
    l_warning INTEGER := 0;
    
    xml clob;
    type curtype is ref cursor;
    cur curtype;
    entity_row user_rec;
begin
    INSERT INTO tab1 (id, clob_data)  VALUES (1, empty_clob())
    RETURN clob_data INTO l_clob;

    l_bfile := BFILENAME('IMPORT_DIR', fname);
    DBMS_LOB.fileopen(l_bfile, DBMS_LOB.file_readonly);
    
    DBMS_LOB.loadclobfromfile ( 
    dest_lob => l_clob,
    src_bfile => l_bfile,
    amount => DBMS_LOB.lobmaxsize,
    dest_offset => l_dest_offset,
    src_offset => l_src_offset,
    bfile_csid => l_bfile_csid ,
    lang_context => l_lang_context,
    warning => l_warning);
    DBMS_LOB.fileclose(l_bfile); 

    commit;
    select clob_data into xml from tab1;
    dbms_output.put_line(to_char(xml));
    
    open cur for select * 
    FROM XMLTABLE('/Users/User' 
    PASSING xmltype( to_char(xml)) COLUMNS
        email varchar2(255) PATH './email',
        username varchar2(255) PATH './username',
        password_hash varchar2(255) PATH './password_hash',
        role varchar2(255)PATH './role');
        
    fetch cur into entity_row;
    while cur%found loop
        UserPackage.AddUser(entity_row.email, entity_row.username, entity_row.password_hash, entity_row.role);
        fetch cur into entity_row;
    end loop;
    close cur;
    
    --truncate table tab1;
    EXECUTE IMMEDIATE 'TRUNCATE TABLE tab1';
    commit;
    exception
    when others then dbms_output.put_line(sqlerrm);
end ImportUsers;


procedure ImportGenres (fname varchar2)
is
    TYPE genre_rec IS RECORD (
        name varchar2(255));
        
    l_bfile BFILE;
    l_clob CLOB;
    l_dest_offset INTEGER := 1;
    l_src_offset INTEGER := 1;
    l_bfile_csid NUMBER := 0;
    l_lang_context INTEGER := 0;
    l_warning INTEGER := 0;
    
    xml clob;
    type curtype is ref cursor;
    cur curtype;
    entity_row genre_rec;
begin
    INSERT INTO tab1 (id, clob_data)  VALUES (1, empty_clob())
    RETURN clob_data INTO l_clob;

    l_bfile := BFILENAME('IMPORT_DIR', fname);
    DBMS_LOB.fileopen(l_bfile, DBMS_LOB.file_readonly);
    
    DBMS_LOB.loadclobfromfile ( 
    dest_lob => l_clob,
    src_bfile => l_bfile,
    amount => DBMS_LOB.lobmaxsize,
    dest_offset => l_dest_offset,
    src_offset => l_src_offset,
    bfile_csid => l_bfile_csid ,
    lang_context => l_lang_context,
    warning => l_warning);
    DBMS_LOB.fileclose(l_bfile); 

    commit;
    select clob_data into xml from tab1;
    dbms_output.put_line(to_char(xml));
    
    open cur for select * 
    FROM XMLTABLE('/Genres/Genre' 
    PASSING xmltype( to_char(xml)) COLUMNS
        name varchar2(255) PATH './name');
        
    fetch cur into entity_row;
    while cur%found loop
        GenrePackage.AddGenre(entity_row.name);
        fetch cur into entity_row;
    end loop;
    close cur;
    
    --truncate table tab1;
    EXECUTE IMMEDIATE 'TRUNCATE TABLE tab1';
    commit;
    exception
    when others then dbms_output.put_line(sqlerrm);
end ImportGenres;

procedure ImportFilmReviews (fname varchar2)
is
    TYPE film_review_rec IS RECORD (
        review varchar2(255),
        score number,
        published TIMESTAMP(6),
        film_id number,
        user_id number);
        
    l_bfile BFILE;
    l_clob CLOB;
    l_dest_offset INTEGER := 1;
    l_src_offset INTEGER := 1;
    l_bfile_csid NUMBER := 0;
    l_lang_context INTEGER := 0;
    l_warning INTEGER := 0;
    
    xml clob;
    type curtype is ref cursor;
    cur curtype;
    entity_row film_review_rec;
begin
    INSERT INTO tab1 (id, clob_data)  VALUES (1, empty_clob())
    RETURN clob_data INTO l_clob;

    l_bfile := BFILENAME('IMPORT_DIR', fname);
    DBMS_LOB.fileopen(l_bfile, DBMS_LOB.file_readonly);
    
    DBMS_LOB.loadclobfromfile ( 
    dest_lob => l_clob,
    src_bfile => l_bfile,
    amount => DBMS_LOB.lobmaxsize,
    dest_offset => l_dest_offset,
    src_offset => l_src_offset,
    bfile_csid => l_bfile_csid ,
    lang_context => l_lang_context,
    warning => l_warning);
    DBMS_LOB.fileclose(l_bfile); 

    commit;
    select clob_data into xml from tab1;
    dbms_output.put_line(to_char(xml));
    
    open cur for select * 
    FROM XMLTABLE('/FilmReviews/FilmReview' 
    PASSING xmltype( to_char(xml)) COLUMNS
        review varchar2(255) PATH './review',
        score number PATH './score',
        published TIMESTAMP(6) PATH './published',
        film_id number PATH './film_id',
        user_id number PATH './user_id');
        
    fetch cur into entity_row;
    while cur%found loop
        FilmReviewPackage.AddFilmReview(entity_row.review, entity_row.score, entity_row.published, entity_row.film_id, entity_row.user_id);
        fetch cur into entity_row;
    end loop;
    close cur;
    
    --truncate table tab1;
    EXECUTE IMMEDIATE 'TRUNCATE TABLE tab1';
    commit;
    exception
    when others then dbms_output.put_line(sqlerrm);
end ImportFilmReviews;

procedure ImportFilmCasts (fname varchar2)
is
    TYPE film_cast_rec IS RECORD (
        role_type varchar2(255),
        role_name varchar2(255),
        actor_id number,
        film_id number);
        
    l_bfile BFILE;
    l_clob CLOB;
    l_dest_offset INTEGER := 1;
    l_src_offset INTEGER := 1;
    l_bfile_csid NUMBER := 0;
    l_lang_context INTEGER := 0;
    l_warning INTEGER := 0;
    
    xml clob;
    type curtype is ref cursor;
    cur curtype;
    entity_row film_cast_rec;
begin
    INSERT INTO tab1 (id, clob_data)  VALUES (1, empty_clob())
    RETURN clob_data INTO l_clob;

    l_bfile := BFILENAME('IMPORT_DIR', fname);
    DBMS_LOB.fileopen(l_bfile, DBMS_LOB.file_readonly);
    
    DBMS_LOB.loadclobfromfile ( 
    dest_lob => l_clob,
    src_bfile => l_bfile,
    amount => DBMS_LOB.lobmaxsize,
    dest_offset => l_dest_offset,
    src_offset => l_src_offset,
    bfile_csid => l_bfile_csid ,
    lang_context => l_lang_context,
    warning => l_warning);
    DBMS_LOB.fileclose(l_bfile); 

    commit;
    select clob_data into xml from tab1;
    dbms_output.put_line(to_char(xml));
    
    open cur for select * 
    FROM XMLTABLE('/FilmCasts/FilmCast' 
    PASSING xmltype( to_char(xml)) COLUMNS
        role_type varchar2(255) PATH './role_type',
        role_name varchar2(255) PATH './role_name',
        actor_id number PATH './actor_id',
        film_id number PATH './film_id');
        
    fetch cur into entity_row;
    while cur%found loop
        FilmCastPackage.AddFilmCast(entity_row.role_type, entity_row.role_name, entity_row.actor_id, entity_row.film_id);
        fetch cur into entity_row;
    end loop;
    close cur;
    
    --truncate table tab1;
    EXECUTE IMMEDIATE 'TRUNCATE TABLE tab1';
    commit;
    exception
    when others then dbms_output.put_line(sqlerrm);
end ImportFilmCasts;

procedure ImportFilmGenres (fname varchar2)
is
    TYPE film_genre_rec IS RECORD (
        film_id number,
        genre_id number);
        
    l_bfile BFILE;
    l_clob CLOB;
    l_dest_offset INTEGER := 1;
    l_src_offset INTEGER := 1;
    l_bfile_csid NUMBER := 0;
    l_lang_context INTEGER := 0;
    l_warning INTEGER := 0;
    
    xml clob;
    type curtype is ref cursor;
    cur curtype;
    entity_row film_genre_rec;
begin
    INSERT INTO tab1 (id, clob_data)  VALUES (1, empty_clob())
    RETURN clob_data INTO l_clob;

    l_bfile := BFILENAME('IMPORT_DIR', fname);
    DBMS_LOB.fileopen(l_bfile, DBMS_LOB.file_readonly);
    
    DBMS_LOB.loadclobfromfile ( 
    dest_lob => l_clob,
    src_bfile => l_bfile,
    amount => DBMS_LOB.lobmaxsize,
    dest_offset => l_dest_offset,
    src_offset => l_src_offset,
    bfile_csid => l_bfile_csid ,
    lang_context => l_lang_context,
    warning => l_warning);
    DBMS_LOB.fileclose(l_bfile); 

    commit;
    select clob_data into xml from tab1;
    dbms_output.put_line(to_char(xml));
    
    open cur for select * 
    FROM XMLTABLE('/FilmGenres/FilmGenre' 
    PASSING xmltype( to_char(xml)) COLUMNS
        film_id number PATH './film_id',
        genre_id number PATH './genre_id');
        
    fetch cur into entity_row;
    while cur%found loop
        FilmGenrePackage.AddFilmGenre(entity_row.film_id, entity_row.genre_id);
        fetch cur into entity_row;
    end loop;
    close cur;
    
    --truncate table tab1;
    EXECUTE IMMEDIATE 'TRUNCATE TABLE tab1';
    commit;
    exception
    when others then dbms_output.put_line(sqlerrm);
end ImportFilmGenres;

end DataImportPackage;

