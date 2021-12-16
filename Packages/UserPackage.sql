create or replace package body UserPackage as

procedure Login(p_EMAIL USERS.EMAIL%type, p_PASSWORD_HASH USERS.PASSWORD_HASH%type)
is
user_rec USERS%rowtype;
wrong_password exception;
begin
    select * into user_rec from Users where email = p_EMAIL;
    
    if user_rec.PASSWORD_HASH != p_PASSWORD_HASH then
        raise wrong_password;   
    end if;
    
    dbms_output.put_line('Succesful login');
     
     exception
     when no_data_found
        then raise_application_error(-20101,'Wrong email');
     when wrong_password
        then raise_application_error(-20102,'Wrong password');
     when others     
        then raise_application_error(-20103,'An error occurred');
  
end;

procedure Register(
p_EMAIL in USERS.EMAIL%type,
p_USERNAME in USERS.USERNAME%type,
p_PASSWORD_HASH in USERS.PASSWORD_HASH%type,
p_ROLE in USERS.ROLE%type)
is
users_by_email number;
users_by_username number;
email_already_exists exception;
username_already_exists exception;
wrong_role_exception exception;
begin
    select count(*) into users_by_email from Users where email = p_EMAIL;    
    if users_by_email != 0 then
        raise email_already_exists;
    end if;
    
    select count(*) into users_by_username from Users where username = p_USERNAME;    
    if users_by_username != 0 then
        raise username_already_exists;
    end if;
    
    if p_ROLE not in ('ADMIN', 'USER') then
        raise wrong_role_exception;
    end if;
    
    UserPackage.AddUser(p_EMAIL, p_USERNAME, p_PASSWORD_HASH, p_ROLE);
    
    dbms_output.put_line('Succesful registration');
    
     exception
     when email_already_exists
        then raise_application_error(-20111,'Email already exists');
     when username_already_exists
        then raise_application_error(-20112,'Username already exists');
     when wrong_role_exception
        then raise_application_error(-20113,'Wrong role name');
    when others
        then raise_application_error(-20114,'An error occurred');
    
  
end;

function GetUsersCount return number
is
    count_users number;
begin
    select count(*) into count_users from USERS;
    return count_users;
end;


-- Insert
procedure AddUser (
p_EMAIL in USERS.EMAIL%type,
p_USERNAME in USERS.USERNAME%type,
p_PASSWORD_HASH in USERS.PASSWORD_HASH%type,
p_ROLE in USERS.ROLE%type
) is
begin
    insert into USERS(EMAIL,USERNAME,PASSWORD_HASH,ROLE) values 
    (p_EMAIL,p_USERNAME,p_PASSWORD_HASH,p_ROLE);
end;

-- Update
procedure UpdateUser (
p_ID in USERS.ID%type,
p_EMAIL in USERS.EMAIL%type,
p_USERNAME in USERS.USERNAME%type,
p_PASSWORD_HASH in USERS.PASSWORD_HASH%type,
p_ROLE in USERS.ROLE%type
) is
begin
    update USERS set
    EMAIL = p_EMAIL,
    USERNAME = p_USERNAME,
    PASSWORD_HASH = p_PASSWORD_HASH,
    ROLE = p_ROLE   
    where ID = p_ID;
end;

-- Delete
procedure DeleteUser (
p_ID in USERS.ID%type
) is
begin
    delete from USERS
    where ID = p_ID;
end;

end UserPackage;
