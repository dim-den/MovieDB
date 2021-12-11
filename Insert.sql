-- Users
insert into Users (Email, Username, password_hash, Role) values ('admin@mail.ru', 'admin', '$2a$12$GrRow3xFZVX8wYhZkZjuqe5SYxBCwExS.JfQ3QbiD.erNJq.fTAeW', 'ADMIN');
insert into Users (Email, Username, password_hash, Role) values ('user@mail.ru', 'user', '$2a$12$y1JFiwLCqdGU.HVImVRd/Ozc/wx8jLrnMdO5Pi5m0eiWYpuv8Q1Di', 'USER');
insert into Users (Email, Username, password_hash, Role) values ('dimden999@gmail.com', 'dimden', '$2a$12$GrRow3xFZVX8wYhZkZjuqe5SYxBCwExS.JfQ3QbiD.erNJq.fTAeW', 'ADMIN');

-- Actors
insert into Actor (Name, Surname, Country, Bday) values ('Leonardo', 'DiCaprio', 'USA', to_date('1974-11-11', 'yyyy-mm-dd'));
insert into Actor (Name, Surname, Country, Bday) values ('Brad', 'Pitt', 'USA', to_date('1963-11-18', 'yyyy-mm-dd'));
insert into Actor (Name, Surname, Country, Bday) values ('Margot', 'Robbie', 'Australia', to_date('1990-07-05', 'yyyy-mm-dd'));
insert into Actor (Name, Surname, Country, Bday) values ('Eva', 'Green', 'France', to_date('1980-07-06', 'yyyy-mm-dd'));
insert into Actor (Name, Surname, Country, Bday) values ('Daniel', 'Craig', 'UK', to_date('1968-03-02', 'yyyy-mm-dd'));
insert into Actor (Name, Surname, Country, Bday) values ('Natalie', 'Portman', 'Israel', to_date('1981-06-09', 'yyyy-mm-dd'));
insert into Actor (Name, Surname, Country, Bday) values ('Vincent', 'Cassel', 'France', to_date('1966-11-23', 'yyyy-mm-dd'));
insert into Actor (Name, Surname, Country, Bday) values ('Mila', 'Kunis', 'Ukraine', to_date('1983-08-14', 'yyyy-mm-dd'));

-- Films
insert into Film(Title, Description, Director, Country, Release, Budget, Fees) 
    values ('Black Swan', 'A committed dancer struggles to maintain her sanity after winning the lead role in a production of Tchaikovsky Swan Lake',
            'Darren Aronofsky', 'USA', to_date('2010-01-10', 'yyyy-mm-dd'), 13000000, 330000000);

insert into Film(Title, Description, Director, Country, Release, Budget, Fees) 
    values ('Once Upon a Time... in Hollywood', 'A faded television actor and his stunt double strive to achieve fame and success in the final years of Hollywood Golden Age in 1969 Los Angeles.',
            'Quentin Tarantino', 'USA', to_date('2019-08-08', 'yyyy-mm-dd'), 90000000, 370000000);
          
-- Genres  
INSERT INTO GENRE(Name) VALUES ('Action');
INSERT INTO GENRE(Name) VALUES ('Comedy');
INSERT INTO GENRE(Name) VALUES ('Drama');
INSERT INTO GENRE(Name) VALUES ('Fantasy');
INSERT INTO GENRE(Name) VALUES ('Horror');
INSERT INTO GENRE(Name) VALUES ('Mystery');
INSERT INTO GENRE(Name) VALUES ('Romance');
INSERT INTO GENRE(Name) VALUES ('Thriller');
INSERT INTO GENRE(Name) VALUES ('Western');

-- Film genres
INSERT INTO FILM_GENRES(FILM_ID, GENRE_ID) VALUES (1, 3);
INSERT INTO FILM_GENRES(FILM_ID, GENRE_ID) VALUES (1, 8);
INSERT INTO FILM_GENRES(FILM_ID, GENRE_ID) VALUES (2, 3);
INSERT INTO FILM_GENRES(FILM_ID, GENRE_ID) VALUES (2, 2);

-- User reviews
insert into FILM_REVIEW(Review, Score, Published, FILM_ID, USER_ID)
    values('Darren Aronofsky Black Swan makes ballet cool—and if that isnt a Herculean feat in itself, I dont know what is. It also happens to be one of the best films of the year, featuring one of the best performances of the year. Natalie Portman will be nominated for her devastating portrayal of petite perfectionist Nina the ballerina or Ill pull a Werner Herzog and eat my shoe.',
     8, to_date('2021-11-23', 'yyyy-mm-dd'), 1, 3);

insert into FILM_REVIEW(Review, Score, Published, FILM_ID, USER_ID)
    values('Its so sad to say this but I used to really like this show, up until season 6, when things should have ended. Why did they decide to do a season 7 with the same story line as before, my brain will never understand. I despise season 7. I cant stand Cinderellas character or the actress. The character just seems so weak, without any motivation or attitude to live life or to act, which isnt how I pictured Cinderella. ',
     3, to_date('2021-11-25', 'yyyy-mm-dd'), 2, 3);
          
-- Film cast
insert into FILM_CAST(Role_type, Role_name, ACTOR_ID, FILM_ID) values ('main', 'Nina Saires', 6, 1);
insert into FILM_CAST(Role_type, Role_name, ACTOR_ID, FILM_ID) values ('main', 'Tomas Leroy', 7, 1);
insert into FILM_CAST(Role_type, Role_name, ACTOR_ID, FILM_ID) values ('minor', 'Odillia', 8, 1);
insert into FILM_CAST(Role_type, Role_name, ACTOR_ID, FILM_ID) values ('main', 'Rik Dalton', 1, 2);
insert into FILM_CAST(Role_type, Role_name, ACTOR_ID, FILM_ID) values ('main', 'Kliff Bout', 2, 2);
insert into FILM_CAST(Role_type, Role_name, ACTOR_ID, FILM_ID) values ('main', 'Sharon Teight', 3, 2);