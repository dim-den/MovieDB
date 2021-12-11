create or replace package body DataGeneratorPackage as

procedure GenerateActors (rows_count number)
is
begin
for k in 1..rows_count
loop
    ActorPackage.AddActor(DBMS_RANDOM.string('a',10), 
                          DBMS_RANDOM.string('a',10), 
                          DBMS_RANDOM.string('a',10), 
                          add_months(SYSDATE, -12 * floor(dbms_random.value(10, 40))) + DBMS_RANDOM.value(0,366));
end loop;
end;

procedure GenerateFilms (rows_count number)
is
begin
for k in 1..rows_count
loop
    FilmPackage.AddFilm(DBMS_RANDOM.string('a',100), 
                        DBMS_RANDOM.string('a',10), 
                        DBMS_RANDOM.string('a',10), 
                        DBMS_RANDOM.string('a',10),
                        floor(dbms_random.value(100000, 50000000)),
                        floor(dbms_random.value(100000, 100000000)),
                        add_months(SYSDATE, -12 * floor(dbms_random.value(10, 40))) + DBMS_RANDOM.value(0,366));
end loop;
end;

procedure GenerateUsers (rows_count number)
is
begin
for k in 1..rows_count
loop
    UserPackage.AddUser(DBMS_RANDOM.string('l',10),
                        DBMS_RANDOM.string('x',6), 
                        DBMS_RANDOM.string('x',32),
                        'USER');
end loop;
end;

end DataGeneratorPackage;

begin 
    DataGenerator.GenerateUsers(10);
end;

select count(*) from actor;
delete from actor where id > 20;

select count(*) from film;
delete from film where id > 20;

select count(*) from users;
delete from users where id > 20;
