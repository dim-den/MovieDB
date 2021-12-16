-- ADMIN PRIVILEGES --
grant create any directory to MOVIE_USER;
grant read, write on directory source_dir to MOVIE_USER;
grant read, write on directory export_dir to MOVIE_USER;


grant grant any privilege to MOVIE_USER;
grant create user to MOVIE_USER;
grant alter user to MOVIE_USER;
grant drop user to MOVIE_USER;

grant create role to MOVIE_USER;
grant alter any role to MOVIE_USER;
grant drop any role to MOVIE_USER;

grant create profile to MOVIE_USER;
grant alter  profile to MOVIE_USER;
grant drop  profile to MOVIE_USER;

grant create tablespace to MOVIE_USER;
grant alter tablespace to MOVIE_USER;
grant drop tablespace to MOVIE_USER;

grant create sequence to MOVIE_USER;

grant create table to MOVIE_USER;
grant create any table to MOVIE_USER;
grant select any table to MOVIE_USER;
grant alter any table to MOVIE_USER;
grant drop any table to MOVIE_USER;

grant create public synonym to MOVIE_USER;
grant drop public synonym to MOVIE_USER;

grant create any view to MOVIE_USER;
grant drop any view to MOVIE_USER;

grant create trigger to MOVIE_USER;
grant drop any trigger  to MOVIE_USER;

grant create any index to MOVIE_USER;

grant create any procedure to MOVIE_USER;

grant create job to MOVIE_USER;
GRANT SCHEDULER_ADMIN TO MOVIE_USER;
GRANT MANAGE SCHEDULER TO MOVIE_USER;
grant select on dba_scheduler_running_jobs to MOVIE_USER;

----------------------------------------------------

-- USER PRIVILEGES --
GRANT SELECT ANY TABLE TO MOVIE_CUSTOMER;
GRANT CREATE SYNONYM TO MOVIE_CUSTOMER;
grant execute on FILMREVIEWPACKAGE to MOVIE_CUSTOMER;

----------------------------------------------------