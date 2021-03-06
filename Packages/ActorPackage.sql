create or replace package body ActorPackage as

procedure GetAllActors
as
  cursor cur is select * from actor;
  rec cur%rowtype;
begin
    dbms_output.put_line('NAME|SURNAME|COUNTRY|BDAY');
    for rec in cur
    loop
          dbms_output.put_line(rec.NAME||'|'||rec.SURNAME||'|'||rec.COUNTRY||'|'||rec.BDAY );
    end loop;
end;

procedure SearchActorByContainingSurnameIgnoreCase(p_SURNAME ACTOR.SURNAME%type)
is
    cursor cur is select a.name, a.surname, a.country, a.bday from actor a where upper(a.surname) like '%'||upper(p_SURNAME)||'%';
    NAME ACTOR.NAME%type;
    SURNAME ACTOR.SURNAME%type;
    COUNTRY ACTOR.COUNTRY%type;
    BDAY ACTOR.BDAY%type;
begin
    open cur;
    fetch cur into NAME, SURNAME, COUNTRY, BDAY;
    while cur%found loop
        dbms_output.put_line(NAME||' '||SURNAME||' (COUNTRY: '||COUNTRY||', BIRTHDAY: '||TO_CHAR(BDAY,'DD/MM/YYYY')||')' );
        fetch cur into NAME, SURNAME, COUNTRY, BDAY;
    end loop;
    close cur;
end SearchActorByContainingSurnameIgnoreCase;

function GetActorsCount return number
is
    count_actors number;
begin
    select count(*) into count_actors from ACTOR;
    return count_actors;
end;

-- Insert
procedure AddActor (    
p_NAME in ACTOR.NAME%type,
p_SURNAME in ACTOR.SURNAME%type,
p_COUNTRY in ACTOR.COUNTRY%type,
p_BDAY in ACTOR.BDAY%type
) is
begin
    insert into ACTOR(NAME,SURNAME,COUNTRY,BDAY) values 
    (p_NAME,p_SURNAME,p_COUNTRY,p_BDAY);
end;

-- Update
procedure UpdateActor (
p_ID in ACTOR.ID%type,
p_NAME in ACTOR.NAME%type,
p_SURNAME in ACTOR.SURNAME%type,
p_COUNTRY in ACTOR.COUNTRY%type,
p_BDAY in ACTOR.BDAY%type
) is
begin
    update ACTOR set    
    NAME = p_NAME,
    SURNAME = p_SURNAME,
    COUNTRY = p_COUNTRY,
    BDAY = p_BDAY
    where ID = p_ID;
end;

-- Delete
procedure DeleteActor (
p_ID in ACTOR.ID%type
) is
begin
    delete from ACTOR
    where ID = p_ID;
end;

end ActorPackage;