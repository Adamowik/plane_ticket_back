use flightsdatabase;   
   CREATE TABLE ticket (
        ticket_id        INT(16) NOT NULL AUTO_INCREMENT,
        user_id   INT(8) NOT NULL,
        flight_id          INT(15) NOT NULL,
	name		VARCHAR(15) NOT NULL,
	surname		VARCHAR(30) NOT NULL,
        ticket_cost     DOUBLE(7,2) NOT NULL,
        category        VARCHAR(50) NOT NULL,
        which_row             INT(1) NOT NULL,
        place          INT(1) NOT NULL,
	insurance	TINYINT(1) NOT NULL DEFAULT 0,
	pesel		VARCHAR(11) NOT NULL,
	phone_number	VARCHAR(9) NOT NULL,
        PRIMARY KEY(ticket_id)
        );

        CREATE TABLE flight (
        flight_id            INT(15) NOT NULL AUTO_INCREMENT,
        connection_id      INT(5) NOT NULL,
        plane_id        INT(5) NOT NULL,
        departure_date        DATE NOT NULL,
        departure_time     VARCHAR(8) NOT NULL,
        arrival_date      DATE NOT NULL,
        arrival_time   VARCHAR(8) NOT NULL,
        ticket_cost       DOUBLE(7,2) NOT NULL,
        PRIMARY KEY(flight_id)
        );

        CREATE TABLE airport (
        airport_id      INT(5) NOT NULL AUTO_INCREMENT,
        airport_name   VARCHAR(50) NOT NULL UNIQUE,
        PRIMARY KEY(airport_id)
        );

        CREATE TABLE connections (
        connection_id          INT(5) NOT NULL AUTO_INCREMENT,
        departure_airport_id     INT(5) NOT NULL,
        arrival_airport_id   INT(5) NOT NULL,
        PRIMARY KEY(connection_id)
        );

        CREATE TABLE plane (
        plane_id      INT(5) NOT NULL AUTO_INCREMENT,
        plane_name   VARCHAR(30) NOT NULL UNIQUE,
        PRIMARY KEY(plane_id)
        );

		

        CREATE TABLE seats (
        seat_id      INT(5) NOT NULL AUTO_INCREMENT,
	flight_id INT(5) NOT NULL,
	category INT(1) NOT NULL,
        which_row   INT(1) NOT NULL,
	place INT(1) NOT NULL,
	is_free TINYINT(1) NOT NULL DEFAULT 1,
	  
        PRIMARY KEY(seat_id)
        );


        CREATE TABLE user_table (
        id      INT(8) NOT NULL AUTO_INCREMENT,
        name                VARCHAR(50),
		username			VARCHAR(50) NOT NULL UNIQUE,
        surname            VARCHAR(50),
        email       VARCHAR(50) NOT NULL UNIQUE,
        password               VARCHAR(512) NOT NULL,
        phone_number      VARCHAR(11),
        PRIMARY KEY(id)
        );
		
		CREATE TABLE roles (
        id      BIGINT(20) NOT NULL  AUTO_INCREMENT,
        name                VARCHAR(50) ,
        PRIMARY KEY(id)
        );
        
        CREATE TABLE user_roles (
		user_id      BIGINT(20),
        role_id      BIGINT(20)
        );


create table payment (id integer not null auto_increment, amount double precision, email varchar(255), mihpay_id varchar(255), mode varchar(255), name varchar(255), payment_date date, payment_status varchar(255), phone varchar(255), product_info varchar(255), txn_id varchar(255), primary key (id)) engine=MyISAM;

        ALTER TABLE ticket
        ADD CONSTRAINT ticket_flight_fk FOREIGN KEY ( flight_id )
        REFERENCES flight ( flight_id );

        ALTER TABLE ticket
        ADD CONSTRAINT ticket_user_fk FOREIGN KEY ( user_id )
        REFERENCES user_table ( id );

        ALTER TABLE flight
        ADD CONSTRAINT flight_connection_fk FOREIGN KEY ( connection_id )
        REFERENCES connections ( connection_id );

        ALTER TABLE flight
        ADD CONSTRAINT flight_plane_fk FOREIGN KEY ( plane_id )
        REFERENCES plane ( plane_id );

        ALTER TABLE connections
        ADD CONSTRAINT connections_airport_fk FOREIGN KEY ( departure_airport_id )
        REFERENCES airport ( airport_id );

        ALTER TABLE connections
        ADD CONSTRAINT connections_airport_fkv2 FOREIGN KEY ( arrival_airport_id )
        REFERENCES airport ( airport_id );

	ALTER TABLE seats
        ADD CONSTRAINT seats_flight_fk FOREIGN KEY ( flight_id )
        REFERENCES flight ( flight_id );

INSERT INTO airport (airport_name) values ('Warszawa-Okęcie');			#1
INSERT INTO airport (airport_name) values ('Warszawa-Modlin');			#2
INSERT INTO airport (airport_name) values ('Wrocław-Strachowice');		#3
INSERT INTO airport (airport_name) values ('Berlin-Brandenburg');		#4
INSERT INTO airport (airport_name) values ('Monachium');				#5
INSERT INTO airport (airport_name) values ('Kijów-Boryspol');			#6
INSERT INTO airport (airport_name) values ('Paryż-Orly');				#7
INSERT INTO airport (airport_name) values ('Barcelona');				#8
INSERT INTO airport (airport_name) values ('Madryt-Barajas');			#9
INSERT INTO airport (airport_name) values ('Lizbona');					#10
INSERT INTO airport (airport_name) values ('Mediolan-Malpensa');		#11
INSERT INTO airport (airport_name) values ('Kopenhaga-Kastrup');		#12
INSERT INTO airport (airport_name) values ('Sztokholm-Arlanda');		#13
INSERT INTO airport (airport_name) values ('Oslo-Gardenmoen');			#14
INSERT INTO airport (airport_name) values ('Rodos');					#15

insert into connections (departure_airport_id, arrival_airport_id) values (1,3);
insert into connections (departure_airport_id, arrival_airport_id) values (1,4);
insert into connections (departure_airport_id, arrival_airport_id) values (1,5);
insert into connections (departure_airport_id, arrival_airport_id) values (1,6);
insert into connections (departure_airport_id, arrival_airport_id) values (1,7);
insert into connections (departure_airport_id, arrival_airport_id) values (1,8);
insert into connections (departure_airport_id, arrival_airport_id) values (1,9);
insert into connections (departure_airport_id, arrival_airport_id) values (1,10);
insert into connections (departure_airport_id, arrival_airport_id) values (1,11);
insert into connections (departure_airport_id, arrival_airport_id) values (1,12);
insert into connections (departure_airport_id, arrival_airport_id) values (1,13);
insert into connections (departure_airport_id, arrival_airport_id) values (1,14);
insert into connections (departure_airport_id, arrival_airport_id) values (1,15);
insert into connections (departure_airport_id, arrival_airport_id) values (3,1);
insert into connections (departure_airport_id, arrival_airport_id) values (4,1);
insert into connections (departure_airport_id, arrival_airport_id) values (5,1);
insert into connections (departure_airport_id, arrival_airport_id) values (6,1);
insert into connections (departure_airport_id, arrival_airport_id) values (7,1);
insert into connections (departure_airport_id, arrival_airport_id) values (8,1);
insert into connections (departure_airport_id, arrival_airport_id) values (9,1);
insert into connections (departure_airport_id, arrival_airport_id) values (10,1);
insert into connections (departure_airport_id, arrival_airport_id) values (11,1);
insert into connections (departure_airport_id, arrival_airport_id) values (12,1);
insert into connections (departure_airport_id, arrival_airport_id) values (13,1);
insert into connections (departure_airport_id, arrival_airport_id) values (14,1);
insert into connections (departure_airport_id, arrival_airport_id) values (15,1);

insert into connections (departure_airport_id, arrival_airport_id) values (2,3);
insert into connections (departure_airport_id, arrival_airport_id) values (2,4);
insert into connections (departure_airport_id, arrival_airport_id) values (2,5);
insert into connections (departure_airport_id, arrival_airport_id) values (2,6);
insert into connections (departure_airport_id, arrival_airport_id) values (2,7);
insert into connections (departure_airport_id, arrival_airport_id) values (2,8);
insert into connections (departure_airport_id, arrival_airport_id) values (2,9);
insert into connections (departure_airport_id, arrival_airport_id) values (2,10);
insert into connections (departure_airport_id, arrival_airport_id) values (2,11);
insert into connections (departure_airport_id, arrival_airport_id) values (2,12);
insert into connections (departure_airport_id, arrival_airport_id) values (2,13);
insert into connections (departure_airport_id, arrival_airport_id) values (2,14);
insert into connections (departure_airport_id, arrival_airport_id) values (2,15);
insert into connections (departure_airport_id, arrival_airport_id) values (3,2);
insert into connections (departure_airport_id, arrival_airport_id) values (4,2);
insert into connections (departure_airport_id, arrival_airport_id) values (5,2);
insert into connections (departure_airport_id, arrival_airport_id) values (6,2);
insert into connections (departure_airport_id, arrival_airport_id) values (7,2);
insert into connections (departure_airport_id, arrival_airport_id) values (8,2);
insert into connections (departure_airport_id, arrival_airport_id) values (9,2);
insert into connections (departure_airport_id, arrival_airport_id) values (10,2);
insert into connections (departure_airport_id, arrival_airport_id) values (11,2);
insert into connections (departure_airport_id, arrival_airport_id) values (12,2);
insert into connections (departure_airport_id, arrival_airport_id) values (13,2);
insert into connections (departure_airport_id, arrival_airport_id) values (14,2);
insert into connections (departure_airport_id, arrival_airport_id) values (15,2);

insert into connections (departure_airport_id, arrival_airport_id) values (3,4);
insert into connections (departure_airport_id, arrival_airport_id) values (3,5);
insert into connections (departure_airport_id, arrival_airport_id) values (3,6);
insert into connections (departure_airport_id, arrival_airport_id) values (3,7);
insert into connections (departure_airport_id, arrival_airport_id) values (3,8);
insert into connections (departure_airport_id, arrival_airport_id) values (3,9);
insert into connections (departure_airport_id, arrival_airport_id) values (3,10);
insert into connections (departure_airport_id, arrival_airport_id) values (3,11);
insert into connections (departure_airport_id, arrival_airport_id) values (3,12);
insert into connections (departure_airport_id, arrival_airport_id) values (3,13);
insert into connections (departure_airport_id, arrival_airport_id) values (3,14);
insert into connections (departure_airport_id, arrival_airport_id) values (3,15);
insert into connections (departure_airport_id, arrival_airport_id) values (4,3);
insert into connections (departure_airport_id, arrival_airport_id) values (5,3);
insert into connections (departure_airport_id, arrival_airport_id) values (6,3);
insert into connections (departure_airport_id, arrival_airport_id) values (7,3);
insert into connections (departure_airport_id, arrival_airport_id) values (8,3);
insert into connections (departure_airport_id, arrival_airport_id) values (9,3);
insert into connections (departure_airport_id, arrival_airport_id) values (10,3);
insert into connections (departure_airport_id, arrival_airport_id) values (11,3);
insert into connections (departure_airport_id, arrival_airport_id) values (12,3);
insert into connections (departure_airport_id, arrival_airport_id) values (13,3);
insert into connections (departure_airport_id, arrival_airport_id) values (14,3);
insert into connections (departure_airport_id, arrival_airport_id) values (15,3);

insert into connections (departure_airport_id, arrival_airport_id) values (4,5);
insert into connections (departure_airport_id, arrival_airport_id) values (4,6);
insert into connections (departure_airport_id, arrival_airport_id) values (4,7);
insert into connections (departure_airport_id, arrival_airport_id) values (4,8);
insert into connections (departure_airport_id, arrival_airport_id) values (4,9);
insert into connections (departure_airport_id, arrival_airport_id) values (4,10);
insert into connections (departure_airport_id, arrival_airport_id) values (4,11);
insert into connections (departure_airport_id, arrival_airport_id) values (4,12);
insert into connections (departure_airport_id, arrival_airport_id) values (4,13);
insert into connections (departure_airport_id, arrival_airport_id) values (4,14);
insert into connections (departure_airport_id, arrival_airport_id) values (4,15);
insert into connections (departure_airport_id, arrival_airport_id) values (4,2);
insert into connections (departure_airport_id, arrival_airport_id) values (5,4);
insert into connections (departure_airport_id, arrival_airport_id) values (6,4);
insert into connections (departure_airport_id, arrival_airport_id) values (7,4);
insert into connections (departure_airport_id, arrival_airport_id) values (8,4);
insert into connections (departure_airport_id, arrival_airport_id) values (9,4);
insert into connections (departure_airport_id, arrival_airport_id) values (10,4);
insert into connections (departure_airport_id, arrival_airport_id) values (11,4);
insert into connections (departure_airport_id, arrival_airport_id) values (12,4);
insert into connections (departure_airport_id, arrival_airport_id) values (13,4);
insert into connections (departure_airport_id, arrival_airport_id) values (14,4);
insert into connections (departure_airport_id, arrival_airport_id) values (15,4);

insert into connections (departure_airport_id, arrival_airport_id) values (5,6);
insert into connections (departure_airport_id, arrival_airport_id) values (5,7);
insert into connections (departure_airport_id, arrival_airport_id) values (5,8);
insert into connections (departure_airport_id, arrival_airport_id) values (5,9);
insert into connections (departure_airport_id, arrival_airport_id) values (5,10);
insert into connections (departure_airport_id, arrival_airport_id) values (5,11);
insert into connections (departure_airport_id, arrival_airport_id) values (5,12);
insert into connections (departure_airport_id, arrival_airport_id) values (5,13);
insert into connections (departure_airport_id, arrival_airport_id) values (5,14);
insert into connections (departure_airport_id, arrival_airport_id) values (5,15);
insert into connections (departure_airport_id, arrival_airport_id) values (6,5);
insert into connections (departure_airport_id, arrival_airport_id) values (7,5);
insert into connections (departure_airport_id, arrival_airport_id) values (8,5);
insert into connections (departure_airport_id, arrival_airport_id) values (9,5);
insert into connections (departure_airport_id, arrival_airport_id) values (10,5);
insert into connections (departure_airport_id, arrival_airport_id) values (11,5);
insert into connections (departure_airport_id, arrival_airport_id) values (12,5);
insert into connections (departure_airport_id, arrival_airport_id) values (13,5);
insert into connections (departure_airport_id, arrival_airport_id) values (14,5);
insert into connections (departure_airport_id, arrival_airport_id) values (15,5);

insert into connections (departure_airport_id, arrival_airport_id) values (6,7);
insert into connections (departure_airport_id, arrival_airport_id) values (6,8);
insert into connections (departure_airport_id, arrival_airport_id) values (6,9);
insert into connections (departure_airport_id, arrival_airport_id) values (6,10);
insert into connections (departure_airport_id, arrival_airport_id) values (6,11);
insert into connections (departure_airport_id, arrival_airport_id) values (6,12);
insert into connections (departure_airport_id, arrival_airport_id) values (6,13);
insert into connections (departure_airport_id, arrival_airport_id) values (6,14);
insert into connections (departure_airport_id, arrival_airport_id) values (6,15);
insert into connections (departure_airport_id, arrival_airport_id) values (7,6);
insert into connections (departure_airport_id, arrival_airport_id) values (8,6);
insert into connections (departure_airport_id, arrival_airport_id) values (9,6);
insert into connections (departure_airport_id, arrival_airport_id) values (10,6);
insert into connections (departure_airport_id, arrival_airport_id) values (11,6);
insert into connections (departure_airport_id, arrival_airport_id) values (12,6);
insert into connections (departure_airport_id, arrival_airport_id) values (13,6);
insert into connections (departure_airport_id, arrival_airport_id) values (14,6);
insert into connections (departure_airport_id, arrival_airport_id) values (15,6);

insert into connections (departure_airport_id, arrival_airport_id) values (7,8);
insert into connections (departure_airport_id, arrival_airport_id) values (7,9);
insert into connections (departure_airport_id, arrival_airport_id) values (7,10);
insert into connections (departure_airport_id, arrival_airport_id) values (7,11);
insert into connections (departure_airport_id, arrival_airport_id) values (7,12);
insert into connections (departure_airport_id, arrival_airport_id) values (7,13);
insert into connections (departure_airport_id, arrival_airport_id) values (7,14);
insert into connections (departure_airport_id, arrival_airport_id) values (7,15);
insert into connections (departure_airport_id, arrival_airport_id) values (8,7);
insert into connections (departure_airport_id, arrival_airport_id) values (9,7);
insert into connections (departure_airport_id, arrival_airport_id) values (10,7);
insert into connections (departure_airport_id, arrival_airport_id) values (11,7);
insert into connections (departure_airport_id, arrival_airport_id) values (12,7);
insert into connections (departure_airport_id, arrival_airport_id) values (13,7);
insert into connections (departure_airport_id, arrival_airport_id) values (14,7);
insert into connections (departure_airport_id, arrival_airport_id) values (15,7);

insert into connections (departure_airport_id, arrival_airport_id) values (8,9);
insert into connections (departure_airport_id, arrival_airport_id) values (8,10);
insert into connections (departure_airport_id, arrival_airport_id) values (8,11);
insert into connections (departure_airport_id, arrival_airport_id) values (8,12);
insert into connections (departure_airport_id, arrival_airport_id) values (8,13);
insert into connections (departure_airport_id, arrival_airport_id) values (8,14);
insert into connections (departure_airport_id, arrival_airport_id) values (8,15);
insert into connections (departure_airport_id, arrival_airport_id) values (9,8);
insert into connections (departure_airport_id, arrival_airport_id) values (10,8);
insert into connections (departure_airport_id, arrival_airport_id) values (11,8);
insert into connections (departure_airport_id, arrival_airport_id) values (12,8);
insert into connections (departure_airport_id, arrival_airport_id) values (13,8);
insert into connections (departure_airport_id, arrival_airport_id) values (14,8);
insert into connections (departure_airport_id, arrival_airport_id) values (15,8);

insert into connections (departure_airport_id, arrival_airport_id) values (9,10);
insert into connections (departure_airport_id, arrival_airport_id) values (9,11);
insert into connections (departure_airport_id, arrival_airport_id) values (9,12);
insert into connections (departure_airport_id, arrival_airport_id) values (9,13);
insert into connections (departure_airport_id, arrival_airport_id) values (9,14);
insert into connections (departure_airport_id, arrival_airport_id) values (9,15);
insert into connections (departure_airport_id, arrival_airport_id) values (10,9);
insert into connections (departure_airport_id, arrival_airport_id) values (11,9);
insert into connections (departure_airport_id, arrival_airport_id) values (12,9);
insert into connections (departure_airport_id, arrival_airport_id) values (13,9);
insert into connections (departure_airport_id, arrival_airport_id) values (14,9);
insert into connections (departure_airport_id, arrival_airport_id) values (15,9);

insert into connections (departure_airport_id, arrival_airport_id) values (10,11);
insert into connections (departure_airport_id, arrival_airport_id) values (10,12);
insert into connections (departure_airport_id, arrival_airport_id) values (10,13);
insert into connections (departure_airport_id, arrival_airport_id) values (10,14);
insert into connections (departure_airport_id, arrival_airport_id) values (10,15);
insert into connections (departure_airport_id, arrival_airport_id) values (11,10);
insert into connections (departure_airport_id, arrival_airport_id) values (12,10);
insert into connections (departure_airport_id, arrival_airport_id) values (13,10);
insert into connections (departure_airport_id, arrival_airport_id) values (14,10);
insert into connections (departure_airport_id, arrival_airport_id) values (15,10);

insert into connections (departure_airport_id, arrival_airport_id) values (11,12);
insert into connections (departure_airport_id, arrival_airport_id) values (11,13);
insert into connections (departure_airport_id, arrival_airport_id) values (11,14);
insert into connections (departure_airport_id, arrival_airport_id) values (11,15);
insert into connections (departure_airport_id, arrival_airport_id) values (12,11);
insert into connections (departure_airport_id, arrival_airport_id) values (13,11);
insert into connections (departure_airport_id, arrival_airport_id) values (14,11);
insert into connections (departure_airport_id, arrival_airport_id) values (15,11);

insert into connections (departure_airport_id, arrival_airport_id) values (12,13);
insert into connections (departure_airport_id, arrival_airport_id) values (12,14);
insert into connections (departure_airport_id, arrival_airport_id) values (12,15);
insert into connections (departure_airport_id, arrival_airport_id) values (13,12);
insert into connections (departure_airport_id, arrival_airport_id) values (14,12);
insert into connections (departure_airport_id, arrival_airport_id) values (15,12);

insert into connections (departure_airport_id, arrival_airport_id) values (13,14);
insert into connections (departure_airport_id, arrival_airport_id) values (13,15);
insert into connections (departure_airport_id, arrival_airport_id) values (14,13);
insert into connections (departure_airport_id, arrival_airport_id) values (15,13);

insert into connections (departure_airport_id, arrival_airport_id) values (14,15);
insert into connections (departure_airport_id, arrival_airport_id) values (15,14);

INSERT INTO plane (plane_name) values ('Airbus A380');
INSERT INTO plane (plane_name) values ('Airbus A310');
INSERT INTO plane (plane_name) values ('Airbus A318');
INSERT INTO plane (plane_name) values ('Airbus A300');
INSERT INTO plane (plane_name) values ('Airbus NSR');
INSERT INTO plane (plane_name) values ('Bombardier CRJ-100');
INSERT INTO plane (plane_name) values ('Bombardier CRJ-200');
INSERT INTO plane (plane_name) values ('Bombardier CRJ-705');
INSERT INTO plane (plane_name) values ('Bombardier CRJ-900');
INSERT INTO plane (plane_name) values ('Bombardier CRJ-1000');
INSERT INTO plane (plane_name) values ('Cessna 404');
INSERT INTO plane (plane_name) values ('Cessna 180');
INSERT INTO plane (plane_name) values ('Cessna 185');
INSERT INTO plane (plane_name) values ('Cessna 350');
INSERT INTO plane (plane_name) values ('Cessna 402');
INSERT INTO plane (plane_name) values ('Fokker 50');
INSERT INTO plane (plane_name) values ('Fokker 70');
INSERT INTO plane (plane_name) values ('Fokker 100');
INSERT INTO plane (plane_name) values ('Fokker F.VII');
INSERT INTO plane (plane_name) values ('TU-70');
INSERT INTO plane (plane_name) values ('TU-104');
INSERT INTO plane (plane_name) values ('TU-110');
INSERT INTO plane (plane_name) values ('TU-114');
INSERT INTO plane (plane_name) values ('TU-124');
INSERT INTO plane (plane_name) values ('TU-134');
INSERT INTO plane (plane_name) values ('TU-144');
INSERT INTO plane (plane_name) values ('TU-154');
INSERT INTO plane (plane_name) values ('TU-204');
INSERT INTO plane (plane_name) values ('TU-324');
INSERT INTO plane (plane_name) values ('TU-334');
INSERT INTO plane (plane_name) values ('TU-444');
INSERT INTO plane (plane_name) values ('TU-534');

# waawa- wroclaw
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (1,1,'2021-02-07','08:00:00', '2021-02-07', '08:31:00', 90.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (1,2,'2021-02-07','14:00:00', '2021-02-07', '14:31:00', 75.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (1,3,'2021-02-07','19:30:00', '2021-02-07', '20:00:00', 75.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (1,1,'2021-02-08','15:00:00', '2021-02-08', '15:30:00', 75.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (1,2,'2021-02-09','08:00:00', '2021-02-09', '08:31:00', 100.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (1,3,'2021-02-09','17:00:00', '2021-02-09', '17:31:00', 80.00);

# wroclaw-modlin
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (40,1,'2021-02-07','08:00:00', '2021-02-07', '08:31:00', 90.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (40,2,'2021-02-07','14:00:00', '2021-02-07', '14:31:00', 75.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (40,3,'2021-02-07','19:30:00', '2021-02-07', '20:00:00', 75.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (40,4,'2021-02-08','15:00:00', '2021-02-08', '15:30:00', 75.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (40,3,'2021-02-09','08:00:00', '2021-02-09', '08:31:00', 100.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (40,2,'2021-02-09','17:00:00', '2021-02-09', '17:31:00', 80.00);

# wroclaw- okecie
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (14,6,'2021-02-07','12:00:00', '2021-02-07', '12:31:00', 90.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (14,2,'2021-02-07','14:00:00', '2021-02-07', '14:31:00', 75.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (14,4,'2021-02-07','20:30:00', '2021-02-07', '21:00:00', 75.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (14,3,'2021-02-08','15:00:00', '2021-02-08', '15:30:00', 75.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (14,5,'2021-02-09','08:00:00', '2021-02-09', '08:31:00', 100.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (14,2,'2021-02-09','17:00:00', '2021-02-09', '17:31:00', 80.00);

# berlin - madryt
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (81,2,'2021-02-07','08:00:00', '2021-02-07', '08:50:00', 120.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (81,2,'2021-02-07','14:00:00', '2021-02-07', '14:50:00', 160.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (81,2,'2021-02-07','19:30:00', '2021-02-07', '20:20:00', 90.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (81,2,'2021-02-08','15:00:00', '2021-02=08', '15:50:00', 90.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (81,2,'2021-02-09','08:00:00', '2021-02-09', '08:50:00', 100.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (81,2,'2021-02-09','17:00:00', '2021-02-09', '17:50:00', 90.00);

# madryt - berlin
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (93,3,'2021-02-07','10:00:00', '2021-02-07', '10:50:00', 120.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (93,3,'2021-02-07','15:00:00', '2021-02-07', '15:50:00', 160.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (93,3,'2021-02-08','19:30:00', '2021-02-08', '20:20:00', 90.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (93,3,'2021-02-08','15:00:00', '2021-02-08', '15:50:00', 90.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (93,3,'2021-02-09','08:00:00', '2021-02-09', '08:50:00', 100.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (93,3,'2021-02-09','17:00:00', '2021-02-09', '17:50:00', 90.00);

# warszawa- reszta
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (2,5,'2021-02-07','13:05:00', '2021-02-07', '14:08:00', 170.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (3,6,'2021-02-07','17:00:00', '2021-02-07', '17:55:00', 145.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (4,7,'2021-02-07','20:00:00', '2021-02-07', '20:48:00', 135.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (5,8,'2021-02-07','11:00:00', '2021-02-07', '13:05:00', 350.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (6,9,'2021-02-07','14:00:00', '2021-02-07', '16:11:00', 400.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (7,10,'2021-02-07','21:10:00', '2021-02-07', '23:35:00', 420.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (8,11,'2021-02-07','08:00:00', '2021-02-07', '10:40:00', 440.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (9,12,'2021-02-07','10:00:00', '2021-02-07', '11:47:00', 370.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (10,13,'2021-02-07','15:10:00', '2021-02-07', '18:00:00', 300.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (11,14,'2021-02-07','09:00:00', '2021-02-07', '13:00:00', 460.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (12,15,'2021-02-07','10:00:00', '2021-02-07', '14:50:00', 500.00);
insert into flight(connection_id, plane_id, departure_date, departure_time, arrival_date, arrival_time, ticket_cost)
values (13,16,'2021-02-07','06:10:00', '2021-02-07', '14:00:00', 700.00);


insert into seats (flight_id, which_row, place, category) values (1,1,1,2);
insert into seats (flight_id, which_row, place, category) values (1,1,2,2);
insert into seats (flight_id, which_row, place, category) values (1,1,3,1);
insert into seats (flight_id, which_row, place, category) values (1,1,4,1);
insert into seats (flight_id, which_row, place, category) values (1,1,5,1);
insert into seats (flight_id, which_row, place, category) values (1,1,6,1);
insert into seats (flight_id, which_row, place, category) values (1,1,7,1);
insert into seats (flight_id, which_row, place, category) values (1,1,8,1);
insert into seats (flight_id, which_row, place, category) values (1,1,9,1);
insert into seats (flight_id, which_row, place, category) values (1,2,1,2);
insert into seats (flight_id, which_row, place, category) values (1,2,2,2);
insert into seats (flight_id, which_row, place, category) values (1,2,3,1);
insert into seats (flight_id, which_row, place, category) values (1,2,4,1);
insert into seats (flight_id, which_row, place, category) values (1,2,5,1);
insert into seats (flight_id, which_row, place, category) values (1,2,6,1);
insert into seats (flight_id, which_row, place, category) values (1,2,7,1);
insert into seats (flight_id, which_row, place, category) values (1,2,8,1);
insert into seats (flight_id, which_row, place, category) values (1,2,9,1);
insert into seats (flight_id, which_row, place, category) values (1,3,1,2);
insert into seats (flight_id, which_row, place, category) values (1,3,2,2);
insert into seats (flight_id, which_row, place, category) values (1,3,3,1);
insert into seats (flight_id, which_row, place, category) values (1,3,4,1);
insert into seats (flight_id, which_row, place, category) values (1,3,5,1);
insert into seats (flight_id, which_row, place, category) values (1,3,6,1);
insert into seats (flight_id, which_row, place, category) values (1,3,7,1);
insert into seats (flight_id, which_row, place, category) values (1,3,8,1);
insert into seats (flight_id, which_row, place, category) values (1,3,9,1);
insert into seats (flight_id, which_row, place, category) values (1,4,1,2);
insert into seats (flight_id, which_row, place, category) values (1,4,2,2);
insert into seats (flight_id, which_row, place, category) values (1,4,3,1);
insert into seats (flight_id, which_row, place, category) values (1,4,4,1);
insert into seats (flight_id, which_row, place, category) values (1,4,5,1);
insert into seats (flight_id, which_row, place, category) values (1,4,6,1);
insert into seats (flight_id, which_row, place, category) values (1,4,7,1);
insert into seats (flight_id, which_row, place, category) values (1,4,8,1);
insert into seats (flight_id, which_row, place, category) values (1,4,9,1);

insert into seats (flight_id, which_row, place, category) values (2,1,1,2);
insert into seats (flight_id, which_row, place, category) values (2,1,2,2);
insert into seats (flight_id, which_row, place, category) values (2,1,3,1);
insert into seats (flight_id, which_row, place, category) values (2,1,4,1);
insert into seats (flight_id, which_row, place, category) values (2,1,5,1);
insert into seats (flight_id, which_row, place, category) values (2,1,6,1);
insert into seats (flight_id, which_row, place, category) values (2,1,7,1);
insert into seats (flight_id, which_row, place, category) values (2,1,8,1);
insert into seats (flight_id, which_row, place, category) values (2,1,9,1);
insert into seats (flight_id, which_row, place, category) values (2,2,1,2);
insert into seats (flight_id, which_row, place, category) values (2,2,2,2);
insert into seats (flight_id, which_row, place, category) values (2,2,3,1);
insert into seats (flight_id, which_row, place, category) values (2,2,4,1);
insert into seats (flight_id, which_row, place, category) values (2,2,5,1);
insert into seats (flight_id, which_row, place, category) values (2,2,6,1);
insert into seats (flight_id, which_row, place, category) values (2,2,7,1);
insert into seats (flight_id, which_row, place, category) values (2,2,8,1);
insert into seats (flight_id, which_row, place, category) values (2,2,9,1);
insert into seats (flight_id, which_row, place, category) values (2,3,1,2);
insert into seats (flight_id, which_row, place, category) values (2,3,2,2);
insert into seats (flight_id, which_row, place, category) values (2,3,3,1);
insert into seats (flight_id, which_row, place, category) values (2,3,4,1);
insert into seats (flight_id, which_row, place, category) values (2,3,5,1);
insert into seats (flight_id, which_row, place, category) values (2,3,6,1);
insert into seats (flight_id, which_row, place, category) values (2,3,7,1);
insert into seats (flight_id, which_row, place, category) values (2,3,8,1);
insert into seats (flight_id, which_row, place, category) values (2,3,9,1);
insert into seats (flight_id, which_row, place, category) values (2,4,1,2);
insert into seats (flight_id, which_row, place, category) values (2,4,2,2);
insert into seats (flight_id, which_row, place, category) values (2,4,3,1);
insert into seats (flight_id, which_row, place, category) values (2,4,4,1);
insert into seats (flight_id, which_row, place, category) values (2,4,5,1);
insert into seats (flight_id, which_row, place, category) values (2,4,6,1);
insert into seats (flight_id, which_row, place, category) values (2,4,7,1);
insert into seats (flight_id, which_row, place, category) values (2,4,8,1);
insert into seats (flight_id, which_row, place, category) values (2,4,9,1);

insert into seats (flight_id, which_row, place, category) values (3,1,1,2);
insert into seats (flight_id, which_row, place, category) values (3,1,2,2);
insert into seats (flight_id, which_row, place, category) values (3,1,3,1);
insert into seats (flight_id, which_row, place, category) values (3,1,4,1);
insert into seats (flight_id, which_row, place, category) values (3,1,5,1);
insert into seats (flight_id, which_row, place, category) values (3,1,6,1);
insert into seats (flight_id, which_row, place, category) values (3,1,7,1);
insert into seats (flight_id, which_row, place, category) values (3,1,8,1);
insert into seats (flight_id, which_row, place, category) values (3,1,9,1);
insert into seats (flight_id, which_row, place, category) values (3,2,1,2);
insert into seats (flight_id, which_row, place, category) values (3,2,2,2);
insert into seats (flight_id, which_row, place, category) values (3,2,3,1);
insert into seats (flight_id, which_row, place, category) values (3,2,4,1);
insert into seats (flight_id, which_row, place, category) values (3,2,5,1);
insert into seats (flight_id, which_row, place, category) values (3,2,6,1);
insert into seats (flight_id, which_row, place, category) values (3,2,7,1);
insert into seats (flight_id, which_row, place, category) values (3,2,8,1);
insert into seats (flight_id, which_row, place, category) values (3,2,9,1);
insert into seats (flight_id, which_row, place, category) values (3,3,1,2);
insert into seats (flight_id, which_row, place, category) values (3,3,2,2);
insert into seats (flight_id, which_row, place, category) values (3,3,3,1);
insert into seats (flight_id, which_row, place, category) values (3,3,4,1);
insert into seats (flight_id, which_row, place, category) values (3,3,5,1);
insert into seats (flight_id, which_row, place, category) values (3,3,6,1);
insert into seats (flight_id, which_row, place, category) values (3,3,7,1);
insert into seats (flight_id, which_row, place, category) values (3,3,8,1);
insert into seats (flight_id, which_row, place, category) values (3,3,9,1);
insert into seats (flight_id, which_row, place, category) values (3,4,1,2);
insert into seats (flight_id, which_row, place, category) values (3,4,2,2);
insert into seats (flight_id, which_row, place, category) values (3,4,3,1);
insert into seats (flight_id, which_row, place, category) values (3,4,4,1);
insert into seats (flight_id, which_row, place, category) values (3,4,5,1);
insert into seats (flight_id, which_row, place, category) values (3,4,6,1);
insert into seats (flight_id, which_row, place, category) values (3,4,7,1);
insert into seats (flight_id, which_row, place, category) values (3,4,8,1);
insert into seats (flight_id, which_row, place, category) values (3,4,9,1);

insert into seats (flight_id, which_row, place, category) values (4,1,1,2);
insert into seats (flight_id, which_row, place, category) values (4,1,2,2);
insert into seats (flight_id, which_row, place, category) values (4,1,3,1);
insert into seats (flight_id, which_row, place, category) values (4,1,4,1);
insert into seats (flight_id, which_row, place, category) values (4,1,5,1);
insert into seats (flight_id, which_row, place, category) values (4,1,6,1);
insert into seats (flight_id, which_row, place, category) values (4,1,7,1);
insert into seats (flight_id, which_row, place, category) values (4,1,8,1);
insert into seats (flight_id, which_row, place, category) values (4,1,9,1);
insert into seats (flight_id, which_row, place, category) values (4,2,1,2);
insert into seats (flight_id, which_row, place, category) values (4,2,2,2);
insert into seats (flight_id, which_row, place, category) values (4,2,3,1);
insert into seats (flight_id, which_row, place, category) values (4,2,4,1);
insert into seats (flight_id, which_row, place, category) values (4,2,5,1);
insert into seats (flight_id, which_row, place, category) values (4,2,6,1);
insert into seats (flight_id, which_row, place, category) values (4,2,7,1);
insert into seats (flight_id, which_row, place, category) values (4,2,8,1);
insert into seats (flight_id, which_row, place, category) values (4,2,9,1);
insert into seats (flight_id, which_row, place, category) values (4,3,1,2);
insert into seats (flight_id, which_row, place, category) values (4,3,2,2);
insert into seats (flight_id, which_row, place, category) values (4,3,3,1);
insert into seats (flight_id, which_row, place, category) values (4,3,4,1);
insert into seats (flight_id, which_row, place, category) values (4,3,5,1);
insert into seats (flight_id, which_row, place, category) values (4,3,6,1);
insert into seats (flight_id, which_row, place, category) values (4,3,7,1);
insert into seats (flight_id, which_row, place, category) values (4,3,8,1);
insert into seats (flight_id, which_row, place, category) values (4,3,9,1);
insert into seats (flight_id, which_row, place, category) values (4,4,1,2);
insert into seats (flight_id, which_row, place, category) values (4,4,2,2);
insert into seats (flight_id, which_row, place, category) values (4,4,3,1);
insert into seats (flight_id, which_row, place, category) values (4,4,4,1);
insert into seats (flight_id, which_row, place, category) values (4,4,5,1);
insert into seats (flight_id, which_row, place, category) values (4,4,6,1);
insert into seats (flight_id, which_row, place, category) values (4,4,7,1);
insert into seats (flight_id, which_row, place, category) values (4,4,8,1);
insert into seats (flight_id, which_row, place, category) values (4,4,9,1);

insert into seats (flight_id, which_row, place, category) values (5,1,1,2);
insert into seats (flight_id, which_row, place, category) values (5,1,2,2);
insert into seats (flight_id, which_row, place, category) values (5,1,3,1);
insert into seats (flight_id, which_row, place, category) values (5,1,4,1);
insert into seats (flight_id, which_row, place, category) values (5,1,5,1);
insert into seats (flight_id, which_row, place, category) values (5,1,6,1);
insert into seats (flight_id, which_row, place, category) values (5,1,7,1);
insert into seats (flight_id, which_row, place, category) values (5,1,8,1);
insert into seats (flight_id, which_row, place, category) values (5,1,9,1);
insert into seats (flight_id, which_row, place, category) values (5,2,1,2);
insert into seats (flight_id, which_row, place, category) values (5,2,2,2);
insert into seats (flight_id, which_row, place, category) values (5,2,3,1);
insert into seats (flight_id, which_row, place, category) values (5,2,4,1);
insert into seats (flight_id, which_row, place, category) values (5,2,5,1);
insert into seats (flight_id, which_row, place, category) values (5,2,6,1);
insert into seats (flight_id, which_row, place, category) values (5,2,7,1);
insert into seats (flight_id, which_row, place, category) values (5,2,8,1);
insert into seats (flight_id, which_row, place, category) values (5,2,9,1);
insert into seats (flight_id, which_row, place, category) values (5,3,1,2);
insert into seats (flight_id, which_row, place, category) values (5,3,2,2);
insert into seats (flight_id, which_row, place, category) values (5,3,3,1);
insert into seats (flight_id, which_row, place, category) values (5,3,4,1);
insert into seats (flight_id, which_row, place, category) values (5,3,5,1);
insert into seats (flight_id, which_row, place, category) values (5,3,6,1);
insert into seats (flight_id, which_row, place, category) values (5,3,7,1);
insert into seats (flight_id, which_row, place, category) values (5,3,8,1);
insert into seats (flight_id, which_row, place, category) values (5,3,9,1);
insert into seats (flight_id, which_row, place, category) values (5,4,1,2);
insert into seats (flight_id, which_row, place, category) values (5,4,2,2);
insert into seats (flight_id, which_row, place, category) values (5,4,3,1);
insert into seats (flight_id, which_row, place, category) values (5,4,4,1);
insert into seats (flight_id, which_row, place, category) values (5,4,5,1);
insert into seats (flight_id, which_row, place, category) values (5,4,6,1);
insert into seats (flight_id, which_row, place, category) values (5,4,7,1);
insert into seats (flight_id, which_row, place, category) values (5,4,8,1);
insert into seats (flight_id, which_row, place, category) values (5,4,9,1);

insert into seats (flight_id, which_row, place, category) values (6,1,1,2);
insert into seats (flight_id, which_row, place, category) values (6,1,2,2);
insert into seats (flight_id, which_row, place, category) values (6,1,3,1);
insert into seats (flight_id, which_row, place, category) values (6,1,4,1);
insert into seats (flight_id, which_row, place, category) values (6,1,5,1);
insert into seats (flight_id, which_row, place, category) values (6,1,6,1);
insert into seats (flight_id, which_row, place, category) values (6,1,7,1);
insert into seats (flight_id, which_row, place, category) values (6,1,8,1);
insert into seats (flight_id, which_row, place, category) values (6,1,9,1);
insert into seats (flight_id, which_row, place, category) values (6,2,1,2);
insert into seats (flight_id, which_row, place, category) values (6,2,2,2);
insert into seats (flight_id, which_row, place, category) values (6,2,3,1);
insert into seats (flight_id, which_row, place, category) values (6,2,4,1);
insert into seats (flight_id, which_row, place, category) values (6,2,5,1);
insert into seats (flight_id, which_row, place, category) values (6,2,6,1);
insert into seats (flight_id, which_row, place, category) values (6,2,7,1);
insert into seats (flight_id, which_row, place, category) values (6,2,8,1);
insert into seats (flight_id, which_row, place, category) values (6,2,9,1);
insert into seats (flight_id, which_row, place, category) values (6,3,1,2);
insert into seats (flight_id, which_row, place, category) values (6,3,2,2);
insert into seats (flight_id, which_row, place, category) values (6,3,3,1);
insert into seats (flight_id, which_row, place, category) values (6,3,4,1);
insert into seats (flight_id, which_row, place, category) values (6,3,5,1);
insert into seats (flight_id, which_row, place, category) values (6,3,6,1);
insert into seats (flight_id, which_row, place, category) values (6,3,7,1);
insert into seats (flight_id, which_row, place, category) values (6,3,8,1);
insert into seats (flight_id, which_row, place, category) values (6,3,9,1);
insert into seats (flight_id, which_row, place, category) values (6,4,1,2);
insert into seats (flight_id, which_row, place, category) values (6,4,2,2);
insert into seats (flight_id, which_row, place, category) values (6,4,3,1);
insert into seats (flight_id, which_row, place, category) values (6,4,4,1);
insert into seats (flight_id, which_row, place, category) values (6,4,5,1);
insert into seats (flight_id, which_row, place, category) values (6,4,6,1);
insert into seats (flight_id, which_row, place, category) values (6,4,7,1);
insert into seats (flight_id, which_row, place, category) values (6,4,8,1);
insert into seats (flight_id, which_row, place, category) values (6,4,9,1);

insert into seats (flight_id, which_row, place, category) values (7,1,1,2);
insert into seats (flight_id, which_row, place, category) values (7,1,2,2);
insert into seats (flight_id, which_row, place, category) values (7,1,3,1);
insert into seats (flight_id, which_row, place, category) values (7,1,4,1);
insert into seats (flight_id, which_row, place, category) values (7,1,5,1);
insert into seats (flight_id, which_row, place, category) values (7,1,6,1);
insert into seats (flight_id, which_row, place, category) values (7,1,7,1);
insert into seats (flight_id, which_row, place, category) values (7,1,8,1);
insert into seats (flight_id, which_row, place, category) values (7,1,9,1);
insert into seats (flight_id, which_row, place, category) values (7,2,1,2);
insert into seats (flight_id, which_row, place, category) values (7,2,2,2);
insert into seats (flight_id, which_row, place, category) values (7,2,3,1);
insert into seats (flight_id, which_row, place, category) values (7,2,4,1);
insert into seats (flight_id, which_row, place, category) values (7,2,5,1);
insert into seats (flight_id, which_row, place, category) values (7,2,6,1);
insert into seats (flight_id, which_row, place, category) values (7,2,7,1);
insert into seats (flight_id, which_row, place, category) values (7,2,8,1);
insert into seats (flight_id, which_row, place, category) values (7,2,9,1);
insert into seats (flight_id, which_row, place, category) values (7,3,1,2);
insert into seats (flight_id, which_row, place, category) values (7,3,2,2);
insert into seats (flight_id, which_row, place, category) values (7,3,3,1);
insert into seats (flight_id, which_row, place, category) values (7,3,4,1);
insert into seats (flight_id, which_row, place, category) values (7,3,5,1);
insert into seats (flight_id, which_row, place, category) values (7,3,6,1);
insert into seats (flight_id, which_row, place, category) values (7,3,7,1);
insert into seats (flight_id, which_row, place, category) values (7,3,8,1);
insert into seats (flight_id, which_row, place, category) values (7,3,9,1);
insert into seats (flight_id, which_row, place, category) values (7,4,1,2);
insert into seats (flight_id, which_row, place, category) values (7,4,2,2);
insert into seats (flight_id, which_row, place, category) values (7,4,3,1);
insert into seats (flight_id, which_row, place, category) values (7,4,4,1);
insert into seats (flight_id, which_row, place, category) values (7,4,5,1);
insert into seats (flight_id, which_row, place, category) values (7,4,6,1);
insert into seats (flight_id, which_row, place, category) values (7,4,7,1);
insert into seats (flight_id, which_row, place, category) values (7,4,8,1);
insert into seats (flight_id, which_row, place, category) values (7,4,9,1);

insert into seats (flight_id, which_row, place, category) values (8,1,1,2);
insert into seats (flight_id, which_row, place, category) values (8,1,2,2);
insert into seats (flight_id, which_row, place, category) values (8,1,3,1);
insert into seats (flight_id, which_row, place, category) values (8,1,4,1);
insert into seats (flight_id, which_row, place, category) values (8,1,5,1);
insert into seats (flight_id, which_row, place, category) values (8,1,6,1);
insert into seats (flight_id, which_row, place, category) values (8,1,7,1);
insert into seats (flight_id, which_row, place, category) values (8,1,8,1);
insert into seats (flight_id, which_row, place, category) values (8,1,9,1);
insert into seats (flight_id, which_row, place, category) values (8,2,1,2);
insert into seats (flight_id, which_row, place, category) values (8,2,2,2);
insert into seats (flight_id, which_row, place, category) values (8,2,3,1);
insert into seats (flight_id, which_row, place, category) values (8,2,4,1);
insert into seats (flight_id, which_row, place, category) values (8,2,5,1);
insert into seats (flight_id, which_row, place, category) values (8,2,6,1);
insert into seats (flight_id, which_row, place, category) values (8,2,7,1);
insert into seats (flight_id, which_row, place, category) values (8,2,8,1);
insert into seats (flight_id, which_row, place, category) values (8,2,9,1);
insert into seats (flight_id, which_row, place, category) values (8,3,1,2);
insert into seats (flight_id, which_row, place, category) values (8,3,2,2);
insert into seats (flight_id, which_row, place, category) values (8,3,3,1);
insert into seats (flight_id, which_row, place, category) values (8,3,4,1);
insert into seats (flight_id, which_row, place, category) values (8,3,5,1);
insert into seats (flight_id, which_row, place, category) values (8,3,6,1);
insert into seats (flight_id, which_row, place, category) values (8,3,7,1);
insert into seats (flight_id, which_row, place, category) values (8,3,8,1);
insert into seats (flight_id, which_row, place, category) values (8,3,9,1);
insert into seats (flight_id, which_row, place, category) values (8,4,1,2);
insert into seats (flight_id, which_row, place, category) values (8,4,2,2);
insert into seats (flight_id, which_row, place, category) values (8,4,3,1);
insert into seats (flight_id, which_row, place, category) values (8,4,4,1);
insert into seats (flight_id, which_row, place, category) values (8,4,5,1);
insert into seats (flight_id, which_row, place, category) values (8,4,6,1);
insert into seats (flight_id, which_row, place, category) values (8,4,7,1);
insert into seats (flight_id, which_row, place, category) values (8,4,8,1);
insert into seats (flight_id, which_row, place, category) values (8,4,9,1);

insert into seats (flight_id, which_row, place, category) values (9,1,1,2);
insert into seats (flight_id, which_row, place, category) values (9,1,2,2);
insert into seats (flight_id, which_row, place, category) values (9,1,3,1);
insert into seats (flight_id, which_row, place, category) values (9,1,4,1);
insert into seats (flight_id, which_row, place, category) values (9,1,5,1);
insert into seats (flight_id, which_row, place, category) values (9,1,6,1);
insert into seats (flight_id, which_row, place, category) values (9,1,7,1);
insert into seats (flight_id, which_row, place, category) values (9,1,8,1);
insert into seats (flight_id, which_row, place, category) values (9,1,9,1);
insert into seats (flight_id, which_row, place, category) values (9,2,1,2);
insert into seats (flight_id, which_row, place, category) values (9,2,2,2);
insert into seats (flight_id, which_row, place, category) values (9,3,3,1);
insert into seats (flight_id, which_row, place, category) values (9,2,4,1);
insert into seats (flight_id, which_row, place, category) values (9,2,5,1);
insert into seats (flight_id, which_row, place, category) values (9,2,6,1);
insert into seats (flight_id, which_row, place, category) values (9,2,7,1);
insert into seats (flight_id, which_row, place, category) values (9,2,8,1);
insert into seats (flight_id, which_row, place, category) values (9,2,9,1);
insert into seats (flight_id, which_row, place, category) values (9,3,1,2);
insert into seats (flight_id, which_row, place, category) values (9,3,2,2);
insert into seats (flight_id, which_row, place, category) values (9,3,3,1);
insert into seats (flight_id, which_row, place, category) values (9,3,4,1);
insert into seats (flight_id, which_row, place, category) values (9,3,5,1);
insert into seats (flight_id, which_row, place, category) values (9,3,6,1);
insert into seats (flight_id, which_row, place, category) values (9,3,7,1);
insert into seats (flight_id, which_row, place, category) values (9,3,8,1);
insert into seats (flight_id, which_row, place, category) values (9,3,9,1);
insert into seats (flight_id, which_row, place, category) values (9,4,1,2);
insert into seats (flight_id, which_row, place, category) values (9,4,2,2);
insert into seats (flight_id, which_row, place, category) values (9,4,3,1);
insert into seats (flight_id, which_row, place, category) values (9,4,4,1);
insert into seats (flight_id, which_row, place, category) values (9,4,5,1);
insert into seats (flight_id, which_row, place, category) values (9,4,6,1);
insert into seats (flight_id, which_row, place, category) values (9,4,7,1);
insert into seats (flight_id, which_row, place, category) values (9,4,8,1);
insert into seats (flight_id, which_row, place, category) values (9,4,9,1);

insert into seats (flight_id, which_row, place, category) values (10,1,1,2);
insert into seats (flight_id, which_row, place, category) values (10,1,2,2);
insert into seats (flight_id, which_row, place, category) values (10,1,3,1);
insert into seats (flight_id, which_row, place, category) values (10,1,4,1);
insert into seats (flight_id, which_row, place, category) values (10,1,5,1);
insert into seats (flight_id, which_row, place, category) values (10,1,6,1);
insert into seats (flight_id, which_row, place, category) values (10,1,7,1);
insert into seats (flight_id, which_row, place, category) values (10,1,8,1);
insert into seats (flight_id, which_row, place, category) values (10,1,9,1);
insert into seats (flight_id, which_row, place, category) values (10,2,1,2);
insert into seats (flight_id, which_row, place, category) values (10,2,2,2);
insert into seats (flight_id, which_row, place, category) values (10,2,3,1);
insert into seats (flight_id, which_row, place, category) values (10,2,4,1);
insert into seats (flight_id, which_row, place, category) values (10,2,5,1);
insert into seats (flight_id, which_row, place, category) values (10,2,6,1);
insert into seats (flight_id, which_row, place, category) values (10,2,7,1);
insert into seats (flight_id, which_row, place, category) values (10,2,8,1);
insert into seats (flight_id, which_row, place, category) values (10,2,9,1);
insert into seats (flight_id, which_row, place, category) values (10,3,1,2);
insert into seats (flight_id, which_row, place, category) values (10,3,2,2);
insert into seats (flight_id, which_row, place, category) values (10,3,3,1);
insert into seats (flight_id, which_row, place, category) values (10,3,4,1);
insert into seats (flight_id, which_row, place, category) values (10,3,5,1);
insert into seats (flight_id, which_row, place, category) values (10,3,6,1);
insert into seats (flight_id, which_row, place, category) values (10,3,7,1);
insert into seats (flight_id, which_row, place, category) values (10,3,8,1);
insert into seats (flight_id, which_row, place, category) values (10,3,9,1);
insert into seats (flight_id, which_row, place, category) values (10,4,1,2);
insert into seats (flight_id, which_row, place, category) values (10,4,2,2);
insert into seats (flight_id, which_row, place, category) values (10,4,3,1);
insert into seats (flight_id, which_row, place, category) values (10,4,4,1);
insert into seats (flight_id, which_row, place, category) values (10,4,5,1);
insert into seats (flight_id, which_row, place, category) values (10,4,6,1);
insert into seats (flight_id, which_row, place, category) values (10,4,7,1);
insert into seats (flight_id, which_row, place, category) values (10,4,8,1);
insert into seats (flight_id, which_row, place, category) values (10,4,9,1);

insert into seats (flight_id, which_row, place, category) values (11,1,1,2);
insert into seats (flight_id, which_row, place, category) values (11,1,2,2);
insert into seats (flight_id, which_row, place, category) values (11,1,3,1);
insert into seats (flight_id, which_row, place, category) values (11,1,4,1);
insert into seats (flight_id, which_row, place, category) values (11,1,5,1);
insert into seats (flight_id, which_row, place, category) values (11,1,6,1);
insert into seats (flight_id, which_row, place, category) values (11,1,7,1);
insert into seats (flight_id, which_row, place, category) values (11,1,8,1);
insert into seats (flight_id, which_row, place, category) values (11,1,9,1);
insert into seats (flight_id, which_row, place, category) values (11,2,1,2);
insert into seats (flight_id, which_row, place, category) values (11,2,2,2);
insert into seats (flight_id, which_row, place, category) values (11,2,3,1);
insert into seats (flight_id, which_row, place, category) values (11,2,4,1);
insert into seats (flight_id, which_row, place, category) values (11,2,5,1);
insert into seats (flight_id, which_row, place, category) values (11,2,6,1);
insert into seats (flight_id, which_row, place, category) values (11,2,7,1);
insert into seats (flight_id, which_row, place, category) values (11,2,8,1);
insert into seats (flight_id, which_row, place, category) values (11,2,9,1);
insert into seats (flight_id, which_row, place, category) values (11,3,1,2);
insert into seats (flight_id, which_row, place, category) values (11,3,2,2);
insert into seats (flight_id, which_row, place, category) values (11,3,3,1);
insert into seats (flight_id, which_row, place, category) values (11,3,4,1);
insert into seats (flight_id, which_row, place, category) values (11,3,5,1);
insert into seats (flight_id, which_row, place, category) values (11,3,6,1);
insert into seats (flight_id, which_row, place, category) values (11,3,7,1);
insert into seats (flight_id, which_row, place, category) values (11,3,8,1);
insert into seats (flight_id, which_row, place, category) values (11,3,9,1);
insert into seats (flight_id, which_row, place, category) values (11,4,1,2);
insert into seats (flight_id, which_row, place, category) values (11,4,2,2);
insert into seats (flight_id, which_row, place, category) values (11,4,3,1);
insert into seats (flight_id, which_row, place, category) values (11,4,4,1);
insert into seats (flight_id, which_row, place, category) values (11,4,5,1);
insert into seats (flight_id, which_row, place, category) values (11,4,6,1);
insert into seats (flight_id, which_row, place, category) values (11,4,7,1);
insert into seats (flight_id, which_row, place, category) values (11,4,8,1);
insert into seats (flight_id, which_row, place, category) values (11,4,9,1);

insert into seats (flight_id, which_row, place, category) values (12,1,1,2);
insert into seats (flight_id, which_row, place, category) values (12,1,2,2);
insert into seats (flight_id, which_row, place, category) values (12,1,3,1);
insert into seats (flight_id, which_row, place, category) values (12,1,4,1);
insert into seats (flight_id, which_row, place, category) values (12,1,5,1);
insert into seats (flight_id, which_row, place, category) values (12,1,6,1);
insert into seats (flight_id, which_row, place, category) values (12,1,7,1);
insert into seats (flight_id, which_row, place, category) values (12,1,8,1);
insert into seats (flight_id, which_row, place, category) values (12,1,9,1);
insert into seats (flight_id, which_row, place, category) values (12,2,1,2);
insert into seats (flight_id, which_row, place, category) values (12,2,2,2);
insert into seats (flight_id, which_row, place, category) values (12,2,3,1);
insert into seats (flight_id, which_row, place, category) values (12,2,4,1);
insert into seats (flight_id, which_row, place, category) values (12,2,5,1);
insert into seats (flight_id, which_row, place, category) values (12,2,6,1);
insert into seats (flight_id, which_row, place, category) values (12,2,7,1);
insert into seats (flight_id, which_row, place, category) values (12,2,8,1);
insert into seats (flight_id, which_row, place, category) values (12,2,9,1);
insert into seats (flight_id, which_row, place, category) values (12,3,1,2);
insert into seats (flight_id, which_row, place, category) values (12,3,2,2);
insert into seats (flight_id, which_row, place, category) values (12,3,3,1);
insert into seats (flight_id, which_row, place, category) values (12,3,4,1);
insert into seats (flight_id, which_row, place, category) values (12,3,5,1);
insert into seats (flight_id, which_row, place, category) values (12,3,6,1);
insert into seats (flight_id, which_row, place, category) values (12,3,7,1);
insert into seats (flight_id, which_row, place, category) values (12,3,8,1);
insert into seats (flight_id, which_row, place, category) values (12,3,9,1);
insert into seats (flight_id, which_row, place, category) values (12,4,1,2);
insert into seats (flight_id, which_row, place, category) values (12,4,2,2);
insert into seats (flight_id, which_row, place, category) values (12,4,3,1);
insert into seats (flight_id, which_row, place, category) values (12,4,4,1);
insert into seats (flight_id, which_row, place, category) values (12,4,5,1);
insert into seats (flight_id, which_row, place, category) values (12,4,6,1);
insert into seats (flight_id, which_row, place, category) values (12,4,7,1);
insert into seats (flight_id, which_row, place, category) values (12,4,8,1);
insert into seats (flight_id, which_row, place, category) values (12,4,9,1);

insert into seats (flight_id, which_row, place, category) values (13,1,1,2);
insert into seats (flight_id, which_row, place, category) values (13,1,2,2);
insert into seats (flight_id, which_row, place, category) values (13,1,3,1);
insert into seats (flight_id, which_row, place, category) values (13,1,4,1);
insert into seats (flight_id, which_row, place, category) values (13,1,5,1);
insert into seats (flight_id, which_row, place, category) values (13,1,6,1);
insert into seats (flight_id, which_row, place, category) values (13,1,7,1);
insert into seats (flight_id, which_row, place, category) values (13,1,8,1);
insert into seats (flight_id, which_row, place, category) values (13,1,9,1);
insert into seats (flight_id, which_row, place, category) values (13,2,1,2);
insert into seats (flight_id, which_row, place, category) values (13,2,2,2);
insert into seats (flight_id, which_row, place, category) values (13,2,3,1);
insert into seats (flight_id, which_row, place, category) values (13,2,4,1);
insert into seats (flight_id, which_row, place, category) values (13,2,5,1);
insert into seats (flight_id, which_row, place, category) values (13,2,6,1);
insert into seats (flight_id, which_row, place, category) values (13,2,7,1);
insert into seats (flight_id, which_row, place, category) values (13,2,8,1);
insert into seats (flight_id, which_row, place, category) values (13,2,9,1);
insert into seats (flight_id, which_row, place, category) values (13,3,1,2);
insert into seats (flight_id, which_row, place, category) values (13,3,2,2);
insert into seats (flight_id, which_row, place, category) values (13,3,3,1);
insert into seats (flight_id, which_row, place, category) values (13,3,4,1);
insert into seats (flight_id, which_row, place, category) values (13,3,5,1);
insert into seats (flight_id, which_row, place, category) values (13,3,6,1);
insert into seats (flight_id, which_row, place, category) values (13,3,7,1);
insert into seats (flight_id, which_row, place, category) values (13,3,8,1);
insert into seats (flight_id, which_row, place, category) values (13,3,9,1);
insert into seats (flight_id, which_row, place, category) values (13,4,1,2);
insert into seats (flight_id, which_row, place, category) values (13,4,2,2);
insert into seats (flight_id, which_row, place, category) values (13,4,3,1);
insert into seats (flight_id, which_row, place, category) values (13,4,4,1);
insert into seats (flight_id, which_row, place, category) values (13,4,5,1);
insert into seats (flight_id, which_row, place, category) values (13,4,6,1);
insert into seats (flight_id, which_row, place, category) values (13,4,7,1);
insert into seats (flight_id, which_row, place, category) values (13,4,8,1);
insert into seats (flight_id, which_row, place, category) values (13,4,9,1);

insert into seats (flight_id, which_row, place, category) values (14,1,1,2);
insert into seats (flight_id, which_row, place, category) values (14,1,2,2);
insert into seats (flight_id, which_row, place, category) values (14,1,3,1);
insert into seats (flight_id, which_row, place, category) values (14,1,4,1);
insert into seats (flight_id, which_row, place, category) values (14,1,5,1);
insert into seats (flight_id, which_row, place, category) values (14,1,6,1);
insert into seats (flight_id, which_row, place, category) values (14,1,7,1);
insert into seats (flight_id, which_row, place, category) values (14,1,8,1);
insert into seats (flight_id, which_row, place, category) values (14,1,9,1);
insert into seats (flight_id, which_row, place, category) values (14,2,1,2);
insert into seats (flight_id, which_row, place, category) values (14,2,2,2);
insert into seats (flight_id, which_row, place, category) values (14,2,3,1);
insert into seats (flight_id, which_row, place, category) values (14,2,4,1);
insert into seats (flight_id, which_row, place, category) values (14,2,5,1);
insert into seats (flight_id, which_row, place, category) values (14,2,6,1);
insert into seats (flight_id, which_row, place, category) values (14,2,7,1);
insert into seats (flight_id, which_row, place, category) values (14,2,8,1);
insert into seats (flight_id, which_row, place, category) values (14,2,9,1);
insert into seats (flight_id, which_row, place, category) values (14,3,1,2);
insert into seats (flight_id, which_row, place, category) values (14,3,2,2);
insert into seats (flight_id, which_row, place, category) values (14,3,3,1);
insert into seats (flight_id, which_row, place, category) values (14,3,4,1);
insert into seats (flight_id, which_row, place, category) values (14,3,5,1);
insert into seats (flight_id, which_row, place, category) values (14,3,6,1);
insert into seats (flight_id, which_row, place, category) values (14,3,7,1);
insert into seats (flight_id, which_row, place, category) values (14,3,8,1);
insert into seats (flight_id, which_row, place, category) values (14,3,9,1);
insert into seats (flight_id, which_row, place, category) values (14,4,1,2);
insert into seats (flight_id, which_row, place, category) values (14,4,2,2);
insert into seats (flight_id, which_row, place, category) values (14,4,3,1);
insert into seats (flight_id, which_row, place, category) values (14,4,4,1);
insert into seats (flight_id, which_row, place, category) values (14,4,5,1);
insert into seats (flight_id, which_row, place, category) values (14,4,6,1);
insert into seats (flight_id, which_row, place, category) values (14,4,7,1);
insert into seats (flight_id, which_row, place, category) values (14,4,8,1);
insert into seats (flight_id, which_row, place, category) values (14,4,9,1);

insert into seats (flight_id, which_row, place, category) values (15,1,1,2);
insert into seats (flight_id, which_row, place, category) values (15,1,2,2);
insert into seats (flight_id, which_row, place, category) values (15,1,3,1);
insert into seats (flight_id, which_row, place, category) values (15,1,4,1);
insert into seats (flight_id, which_row, place, category) values (15,1,5,1);
insert into seats (flight_id, which_row, place, category) values (15,1,6,1);
insert into seats (flight_id, which_row, place, category) values (15,1,7,1);
insert into seats (flight_id, which_row, place, category) values (15,1,8,1);
insert into seats (flight_id, which_row, place, category) values (15,1,9,1);
insert into seats (flight_id, which_row, place, category) values (15,2,1,2);
insert into seats (flight_id, which_row, place, category) values (15,2,2,2);
insert into seats (flight_id, which_row, place, category) values (15,2,3,1);
insert into seats (flight_id, which_row, place, category) values (15,2,4,1);
insert into seats (flight_id, which_row, place, category) values (15,2,5,1);
insert into seats (flight_id, which_row, place, category) values (15,2,6,1);
insert into seats (flight_id, which_row, place, category) values (15,2,7,1);
insert into seats (flight_id, which_row, place, category) values (15,2,8,1);
insert into seats (flight_id, which_row, place, category) values (15,2,9,1);
insert into seats (flight_id, which_row, place, category) values (15,3,1,2);
insert into seats (flight_id, which_row, place, category) values (15,3,2,2);
insert into seats (flight_id, which_row, place, category) values (15,3,3,1);
insert into seats (flight_id, which_row, place, category) values (15,3,4,1);
insert into seats (flight_id, which_row, place, category) values (15,3,5,1);
insert into seats (flight_id, which_row, place, category) values (15,3,6,1);
insert into seats (flight_id, which_row, place, category) values (15,3,7,1);
insert into seats (flight_id, which_row, place, category) values (15,3,8,1);
insert into seats (flight_id, which_row, place, category) values (15,3,9,1);
insert into seats (flight_id, which_row, place, category) values (15,4,1,2);
insert into seats (flight_id, which_row, place, category) values (15,4,2,2);
insert into seats (flight_id, which_row, place, category) values (15,4,3,1);
insert into seats (flight_id, which_row, place, category) values (15,4,4,1);
insert into seats (flight_id, which_row, place, category) values (15,4,5,1);
insert into seats (flight_id, which_row, place, category) values (15,4,6,1);
insert into seats (flight_id, which_row, place, category) values (15,4,7,1);
insert into seats (flight_id, which_row, place, category) values (15,4,8,1);
insert into seats (flight_id, which_row, place, category) values (15,4,9,1);

insert into seats (flight_id, which_row, place, category) values (16,1,1,2);
insert into seats (flight_id, which_row, place, category) values (16,1,2,2);
insert into seats (flight_id, which_row, place, category) values (16,1,3,1);
insert into seats (flight_id, which_row, place, category) values (16,1,4,1);
insert into seats (flight_id, which_row, place, category) values (16,1,5,1);
insert into seats (flight_id, which_row, place, category) values (16,1,6,1);
insert into seats (flight_id, which_row, place, category) values (16,1,7,1);
insert into seats (flight_id, which_row, place, category) values (16,1,8,1);
insert into seats (flight_id, which_row, place, category) values (16,1,9,1);
insert into seats (flight_id, which_row, place, category) values (16,2,1,2);
insert into seats (flight_id, which_row, place, category) values (16,2,2,2);
insert into seats (flight_id, which_row, place, category) values (16,2,3,1);
insert into seats (flight_id, which_row, place, category) values (16,2,4,1);
insert into seats (flight_id, which_row, place, category) values (16,2,5,1);
insert into seats (flight_id, which_row, place, category) values (16,2,6,1);
insert into seats (flight_id, which_row, place, category) values (16,2,7,1);
insert into seats (flight_id, which_row, place, category) values (16,2,8,1);
insert into seats (flight_id, which_row, place, category) values (16,2,9,1);
insert into seats (flight_id, which_row, place, category) values (16,3,1,2);
insert into seats (flight_id, which_row, place, category) values (16,3,2,2);
insert into seats (flight_id, which_row, place, category) values (16,3,3,1);
insert into seats (flight_id, which_row, place, category) values (16,3,4,1);
insert into seats (flight_id, which_row, place, category) values (16,3,5,1);
insert into seats (flight_id, which_row, place, category) values (16,3,6,1);
insert into seats (flight_id, which_row, place, category) values (16,3,7,1);
insert into seats (flight_id, which_row, place, category) values (16,3,8,1);
insert into seats (flight_id, which_row, place, category) values (16,3,9,1);
insert into seats (flight_id, which_row, place, category) values (16,4,1,2);
insert into seats (flight_id, which_row, place, category) values (16,4,2,2);
insert into seats (flight_id, which_row, place, category) values (16,4,3,1);
insert into seats (flight_id, which_row, place, category) values (16,4,4,1);
insert into seats (flight_id, which_row, place, category) values (16,4,5,1);
insert into seats (flight_id, which_row, place, category) values (16,4,6,1);
insert into seats (flight_id, which_row, place, category) values (16,4,7,1);
insert into seats (flight_id, which_row, place, category) values (16,4,8,1);
insert into seats (flight_id, which_row, place, category) values (16,4,9,1);

insert into seats (flight_id, which_row, place, category) values (17,1,1,2);
insert into seats (flight_id, which_row, place, category) values (17,1,2,2);
insert into seats (flight_id, which_row, place, category) values (17,1,3,1);
insert into seats (flight_id, which_row, place, category) values (17,1,4,1);
insert into seats (flight_id, which_row, place, category) values (17,1,5,1);
insert into seats (flight_id, which_row, place, category) values (17,1,6,1);
insert into seats (flight_id, which_row, place, category) values (17,1,7,1);
insert into seats (flight_id, which_row, place, category) values (17,1,8,1);
insert into seats (flight_id, which_row, place, category) values (17,1,9,1);
insert into seats (flight_id, which_row, place, category) values (17,2,1,2);
insert into seats (flight_id, which_row, place, category) values (17,2,2,2);
insert into seats (flight_id, which_row, place, category) values (17,2,3,1);
insert into seats (flight_id, which_row, place, category) values (17,2,4,1);
insert into seats (flight_id, which_row, place, category) values (17,2,5,1);
insert into seats (flight_id, which_row, place, category) values (17,2,6,1);
insert into seats (flight_id, which_row, place, category) values (17,2,7,1);
insert into seats (flight_id, which_row, place, category) values (17,2,8,1);
insert into seats (flight_id, which_row, place, category) values (17,2,9,1);
insert into seats (flight_id, which_row, place, category) values (17,3,1,2);
insert into seats (flight_id, which_row, place, category) values (17,3,2,2);
insert into seats (flight_id, which_row, place, category) values (17,3,3,1);
insert into seats (flight_id, which_row, place, category) values (17,3,4,1);
insert into seats (flight_id, which_row, place, category) values (17,3,5,1);
insert into seats (flight_id, which_row, place, category) values (17,3,6,1);
insert into seats (flight_id, which_row, place, category) values (17,3,7,1);
insert into seats (flight_id, which_row, place, category) values (17,3,8,1);
insert into seats (flight_id, which_row, place, category) values (17,3,9,1);
insert into seats (flight_id, which_row, place, category) values (17,4,1,2);
insert into seats (flight_id, which_row, place, category) values (17,4,2,2);
insert into seats (flight_id, which_row, place, category) values (17,4,3,1);
insert into seats (flight_id, which_row, place, category) values (17,4,4,1);
insert into seats (flight_id, which_row, place, category) values (17,4,5,1);
insert into seats (flight_id, which_row, place, category) values (17,4,6,1);
insert into seats (flight_id, which_row, place, category) values (17,4,7,1);
insert into seats (flight_id, which_row, place, category) values (17,4,8,1);
insert into seats (flight_id, which_row, place, category) values (17,4,9,1);

insert into seats (flight_id, which_row, place, category) values (18,1,1,2);
insert into seats (flight_id, which_row, place, category) values (18,1,2,2);
insert into seats (flight_id, which_row, place, category) values (18,1,3,1);
insert into seats (flight_id, which_row, place, category) values (18,1,4,1);
insert into seats (flight_id, which_row, place, category) values (18,1,5,1);
insert into seats (flight_id, which_row, place, category) values (18,1,6,1);
insert into seats (flight_id, which_row, place, category) values (18,1,7,1);
insert into seats (flight_id, which_row, place, category) values (18,1,8,1);
insert into seats (flight_id, which_row, place, category) values (18,1,9,1);
insert into seats (flight_id, which_row, place, category) values (18,2,1,2);
insert into seats (flight_id, which_row, place, category) values (18,2,2,2);
insert into seats (flight_id, which_row, place, category) values (18,2,3,1);
insert into seats (flight_id, which_row, place, category) values (18,2,4,1);
insert into seats (flight_id, which_row, place, category) values (18,2,5,1);
insert into seats (flight_id, which_row, place, category) values (18,2,6,1);
insert into seats (flight_id, which_row, place, category) values (18,2,7,1);
insert into seats (flight_id, which_row, place, category) values (18,2,8,1);
insert into seats (flight_id, which_row, place, category) values (18,2,9,1);
insert into seats (flight_id, which_row, place, category) values (18,3,1,2);
insert into seats (flight_id, which_row, place, category) values (18,3,2,2);
insert into seats (flight_id, which_row, place, category) values (18,3,3,1);
insert into seats (flight_id, which_row, place, category) values (18,3,4,1);
insert into seats (flight_id, which_row, place, category) values (18,3,5,1);
insert into seats (flight_id, which_row, place, category) values (18,3,6,1);
insert into seats (flight_id, which_row, place, category) values (18,3,7,1);
insert into seats (flight_id, which_row, place, category) values (18,3,8,1);
insert into seats (flight_id, which_row, place, category) values (18,3,9,1);
insert into seats (flight_id, which_row, place, category) values (18,4,1,2);
insert into seats (flight_id, which_row, place, category) values (18,4,2,2);
insert into seats (flight_id, which_row, place, category) values (18,4,3,1);
insert into seats (flight_id, which_row, place, category) values (18,4,4,1);
insert into seats (flight_id, which_row, place, category) values (18,4,5,1);
insert into seats (flight_id, which_row, place, category) values (18,4,6,1);
insert into seats (flight_id, which_row, place, category) values (18,4,7,1);
insert into seats (flight_id, which_row, place, category) values (18,4,8,1);
insert into seats (flight_id, which_row, place, category) values (18,4,9,1);

insert into seats (flight_id, which_row, place, category) values (19,1,1,2);
insert into seats (flight_id, which_row, place, category) values (19,1,2,2);
insert into seats (flight_id, which_row, place, category) values (19,1,3,1);
insert into seats (flight_id, which_row, place, category) values (19,1,4,1);
insert into seats (flight_id, which_row, place, category) values (19,1,5,1);
insert into seats (flight_id, which_row, place, category) values (19,1,6,1);
insert into seats (flight_id, which_row, place, category) values (19,1,7,1);
insert into seats (flight_id, which_row, place, category) values (19,1,8,1);
insert into seats (flight_id, which_row, place, category) values (19,1,9,1);
insert into seats (flight_id, which_row, place, category) values (19,2,1,2);
insert into seats (flight_id, which_row, place, category) values (19,2,2,2);
insert into seats (flight_id, which_row, place, category) values (19,2,3,1);
insert into seats (flight_id, which_row, place, category) values (19,2,4,1);
insert into seats (flight_id, which_row, place, category) values (19,2,5,1);
insert into seats (flight_id, which_row, place, category) values (19,2,6,1);
insert into seats (flight_id, which_row, place, category) values (19,2,7,1);
insert into seats (flight_id, which_row, place, category) values (19,2,8,1);
insert into seats (flight_id, which_row, place, category) values (19,2,9,1);
insert into seats (flight_id, which_row, place, category) values (19,3,1,2);
insert into seats (flight_id, which_row, place, category) values (19,3,2,2);
insert into seats (flight_id, which_row, place, category) values (19,3,3,1);
insert into seats (flight_id, which_row, place, category) values (19,3,4,1);
insert into seats (flight_id, which_row, place, category) values (19,3,5,1);
insert into seats (flight_id, which_row, place, category) values (19,3,6,1);
insert into seats (flight_id, which_row, place, category) values (19,3,7,1);
insert into seats (flight_id, which_row, place, category) values (19,3,8,1);
insert into seats (flight_id, which_row, place, category) values (19,3,9,1);
insert into seats (flight_id, which_row, place, category) values (19,4,1,2);
insert into seats (flight_id, which_row, place, category) values (19,4,2,2);
insert into seats (flight_id, which_row, place, category) values (19,4,3,1);
insert into seats (flight_id, which_row, place, category) values (19,4,4,1);
insert into seats (flight_id, which_row, place, category) values (19,4,5,1);
insert into seats (flight_id, which_row, place, category) values (19,4,6,1);
insert into seats (flight_id, which_row, place, category) values (19,4,7,1);
insert into seats (flight_id, which_row, place, category) values (19,4,8,1);
insert into seats (flight_id, which_row, place, category) values (19,4,9,1);

insert into seats (flight_id, which_row, place, category) values (20,1,1,2);
insert into seats (flight_id, which_row, place, category) values (20,1,2,2);
insert into seats (flight_id, which_row, place, category) values (20,1,3,1);
insert into seats (flight_id, which_row, place, category) values (20,1,4,1);
insert into seats (flight_id, which_row, place, category) values (20,1,5,1);
insert into seats (flight_id, which_row, place, category) values (20,1,6,1);
insert into seats (flight_id, which_row, place, category) values (20,1,7,1);
insert into seats (flight_id, which_row, place, category) values (20,1,8,1);
insert into seats (flight_id, which_row, place, category) values (20,1,9,1);
insert into seats (flight_id, which_row, place, category) values (20,2,1,2);
insert into seats (flight_id, which_row, place, category) values (20,2,2,2);
insert into seats (flight_id, which_row, place, category) values (20,2,3,1);
insert into seats (flight_id, which_row, place, category) values (20,2,4,1);
insert into seats (flight_id, which_row, place, category) values (20,2,5,1);
insert into seats (flight_id, which_row, place, category) values (20,2,6,1);
insert into seats (flight_id, which_row, place, category) values (20,2,7,1);
insert into seats (flight_id, which_row, place, category) values (20,2,8,1);
insert into seats (flight_id, which_row, place, category) values (20,2,9,1);
insert into seats (flight_id, which_row, place, category) values (20,3,1,2);
insert into seats (flight_id, which_row, place, category) values (20,3,2,2);
insert into seats (flight_id, which_row, place, category) values (20,3,3,1);
insert into seats (flight_id, which_row, place, category) values (20,3,4,1);
insert into seats (flight_id, which_row, place, category) values (20,3,5,1);
insert into seats (flight_id, which_row, place, category) values (20,3,6,1);
insert into seats (flight_id, which_row, place, category) values (20,3,7,1);
insert into seats (flight_id, which_row, place, category) values (20,3,8,1);
insert into seats (flight_id, which_row, place, category) values (20,3,9,1);
insert into seats (flight_id, which_row, place, category) values (20,4,1,2);
insert into seats (flight_id, which_row, place, category) values (20,4,2,2);
insert into seats (flight_id, which_row, place, category) values (20,4,3,1);
insert into seats (flight_id, which_row, place, category) values (20,4,4,1);
insert into seats (flight_id, which_row, place, category) values (20,4,5,1);
insert into seats (flight_id, which_row, place, category) values (20,4,6,1);
insert into seats (flight_id, which_row, place, category) values (20,4,7,1);
insert into seats (flight_id, which_row, place, category) values (20,4,8,1);
insert into seats (flight_id, which_row, place, category) values (20,4,9,1);

insert into seats (flight_id, which_row, place, category) values (21,1,1,2);
insert into seats (flight_id, which_row, place, category) values (21,1,2,2);
insert into seats (flight_id, which_row, place, category) values (21,1,3,1);
insert into seats (flight_id, which_row, place, category) values (21,1,4,1);
insert into seats (flight_id, which_row, place, category) values (21,1,5,1);
insert into seats (flight_id, which_row, place, category) values (21,1,6,1);
insert into seats (flight_id, which_row, place, category) values (21,1,7,1);
insert into seats (flight_id, which_row, place, category) values (21,1,8,1);
insert into seats (flight_id, which_row, place, category) values (21,1,9,1);
insert into seats (flight_id, which_row, place, category) values (21,2,1,2);
insert into seats (flight_id, which_row, place, category) values (21,2,2,2);
insert into seats (flight_id, which_row, place, category) values (21,2,3,1);
insert into seats (flight_id, which_row, place, category) values (21,2,4,1);
insert into seats (flight_id, which_row, place, category) values (21,2,5,1);
insert into seats (flight_id, which_row, place, category) values (21,2,6,1);
insert into seats (flight_id, which_row, place, category) values (21,2,7,1);
insert into seats (flight_id, which_row, place, category) values (21,2,8,1);
insert into seats (flight_id, which_row, place, category) values (21,2,9,1);
insert into seats (flight_id, which_row, place, category) values (21,3,1,2);
insert into seats (flight_id, which_row, place, category) values (21,3,2,2);
insert into seats (flight_id, which_row, place, category) values (21,3,3,1);
insert into seats (flight_id, which_row, place, category) values (21,3,4,1);
insert into seats (flight_id, which_row, place, category) values (21,3,5,1);
insert into seats (flight_id, which_row, place, category) values (21,3,6,1);
insert into seats (flight_id, which_row, place, category) values (21,3,7,1);
insert into seats (flight_id, which_row, place, category) values (21,3,8,1);
insert into seats (flight_id, which_row, place, category) values (21,3,9,1);
insert into seats (flight_id, which_row, place, category) values (21,4,1,2);
insert into seats (flight_id, which_row, place, category) values (2,4,2,2);
insert into seats (flight_id, which_row, place, category) values (21,4,3,1);
insert into seats (flight_id, which_row, place, category) values (21,4,4,1);
insert into seats (flight_id, which_row, place, category) values (21,4,5,1);
insert into seats (flight_id, which_row, place, category) values (21,4,6,1);
insert into seats (flight_id, which_row, place, category) values (21,4,7,1);
insert into seats (flight_id, which_row, place, category) values (21,4,8,1);
insert into seats (flight_id, which_row, place, category) values (21,4,9,1);

insert into seats (flight_id, which_row, place, category) values (22,1,1,2);
insert into seats (flight_id, which_row, place, category) values (22,1,2,2);
insert into seats (flight_id, which_row, place, category) values (22,1,3,1);
insert into seats (flight_id, which_row, place, category) values (22,1,4,1);
insert into seats (flight_id, which_row, place, category) values (22,1,5,1);
insert into seats (flight_id, which_row, place, category) values (22,1,6,1);
insert into seats (flight_id, which_row, place, category) values (22,1,7,1);
insert into seats (flight_id, which_row, place, category) values (22,1,8,1);
insert into seats (flight_id, which_row, place, category) values (22,1,9,1);
insert into seats (flight_id, which_row, place, category) values (22,2,1,2);
insert into seats (flight_id, which_row, place, category) values (22,2,2,2);
insert into seats (flight_id, which_row, place, category) values (22,2,3,1);
insert into seats (flight_id, which_row, place, category) values (22,2,4,1);
insert into seats (flight_id, which_row, place, category) values (22,2,5,1);
insert into seats (flight_id, which_row, place, category) values (22,2,6,1);
insert into seats (flight_id, which_row, place, category) values (22,2,7,1);
insert into seats (flight_id, which_row, place, category) values (22,2,8,1);
insert into seats (flight_id, which_row, place, category) values (22,2,9,1);
insert into seats (flight_id, which_row, place, category) values (22,3,1,2);
insert into seats (flight_id, which_row, place, category) values (22,3,2,2);
insert into seats (flight_id, which_row, place, category) values (22,3,3,1);
insert into seats (flight_id, which_row, place, category) values (22,3,4,1);
insert into seats (flight_id, which_row, place, category) values (22,3,5,1);
insert into seats (flight_id, which_row, place, category) values (22,3,6,1);
insert into seats (flight_id, which_row, place, category) values (22,3,7,1);
insert into seats (flight_id, which_row, place, category) values (22,3,8,1);
insert into seats (flight_id, which_row, place, category) values (22,3,9,1);
insert into seats (flight_id, which_row, place, category) values (22,4,1,2);
insert into seats (flight_id, which_row, place, category) values (22,4,2,2);
insert into seats (flight_id, which_row, place, category) values (22,4,3,1);
insert into seats (flight_id, which_row, place, category) values (22,4,4,1);
insert into seats (flight_id, which_row, place, category) values (22,4,5,1);
insert into seats (flight_id, which_row, place, category) values (22,4,6,1);
insert into seats (flight_id, which_row, place, category) values (22,4,7,1);
insert into seats (flight_id, which_row, place, category) values (22,4,8,1);
insert into seats (flight_id, which_row, place, category) values (22,4,9,1);

insert into seats (flight_id, which_row, place, category) values (23,1,1,2);
insert into seats (flight_id, which_row, place, category) values (23,1,2,2);
insert into seats (flight_id, which_row, place, category) values (23,1,3,1);
insert into seats (flight_id, which_row, place, category) values (23,1,4,1);
insert into seats (flight_id, which_row, place, category) values (23,1,5,1);
insert into seats (flight_id, which_row, place, category) values (23,1,6,1);
insert into seats (flight_id, which_row, place, category) values (23,1,7,1);
insert into seats (flight_id, which_row, place, category) values (23,1,8,1);
insert into seats (flight_id, which_row, place, category) values (23,1,9,1);
insert into seats (flight_id, which_row, place, category) values (23,2,1,2);
insert into seats (flight_id, which_row, place, category) values (23,2,2,2);
insert into seats (flight_id, which_row, place, category) values (23,2,3,1);
insert into seats (flight_id, which_row, place, category) values (23,2,4,1);
insert into seats (flight_id, which_row, place, category) values (23,2,5,1);
insert into seats (flight_id, which_row, place, category) values (23,2,6,1);
insert into seats (flight_id, which_row, place, category) values (23,2,7,1);
insert into seats (flight_id, which_row, place, category) values (23,2,8,1);
insert into seats (flight_id, which_row, place, category) values (23,2,9,1);
insert into seats (flight_id, which_row, place, category) values (23,3,1,2);
insert into seats (flight_id, which_row, place, category) values (23,3,2,2);
insert into seats (flight_id, which_row, place, category) values (23,3,3,1);
insert into seats (flight_id, which_row, place, category) values (23,3,4,1);
insert into seats (flight_id, which_row, place, category) values (23,3,5,1);
insert into seats (flight_id, which_row, place, category) values (23,3,6,1);
insert into seats (flight_id, which_row, place, category) values (23,3,7,1);
insert into seats (flight_id, which_row, place, category) values (23,3,8,1);
insert into seats (flight_id, which_row, place, category) values (23,3,9,1);
insert into seats (flight_id, which_row, place, category) values (23,4,1,2);
insert into seats (flight_id, which_row, place, category) values (23,4,2,2);
insert into seats (flight_id, which_row, place, category) values (23,4,3,1);
insert into seats (flight_id, which_row, place, category) values (23,4,4,1);
insert into seats (flight_id, which_row, place, category) values (23,4,5,1);
insert into seats (flight_id, which_row, place, category) values (23,4,6,1);
insert into seats (flight_id, which_row, place, category) values (23,4,7,1);
insert into seats (flight_id, which_row, place, category) values (23,4,8,1);
insert into seats (flight_id, which_row, place, category) values (23,4,9,1);

insert into seats (flight_id, which_row, place, category) values (24,1,1,2);
insert into seats (flight_id, which_row, place, category) values (24,1,2,2);
insert into seats (flight_id, which_row, place, category) values (24,1,3,1);
insert into seats (flight_id, which_row, place, category) values (24,1,4,1);
insert into seats (flight_id, which_row, place, category) values (24,1,5,1);
insert into seats (flight_id, which_row, place, category) values (24,1,6,1);
insert into seats (flight_id, which_row, place, category) values (24,1,7,1);
insert into seats (flight_id, which_row, place, category) values (24,1,8,1);
insert into seats (flight_id, which_row, place, category) values (24,1,9,1);
insert into seats (flight_id, which_row, place, category) values (24,2,1,2);
insert into seats (flight_id, which_row, place, category) values (24,2,2,2);
insert into seats (flight_id, which_row, place, category) values (24,2,3,1);
insert into seats (flight_id, which_row, place, category) values (24,2,4,1);
insert into seats (flight_id, which_row, place, category) values (24,2,5,1);
insert into seats (flight_id, which_row, place, category) values (24,2,6,1);
insert into seats (flight_id, which_row, place, category) values (24,2,7,1);
insert into seats (flight_id, which_row, place, category) values (24,2,8,1);
insert into seats (flight_id, which_row, place, category) values (24,2,9,1);
insert into seats (flight_id, which_row, place, category) values (24,3,1,2);
insert into seats (flight_id, which_row, place, category) values (24,3,2,2);
insert into seats (flight_id, which_row, place, category) values (24,3,3,1);
insert into seats (flight_id, which_row, place, category) values (24,3,4,1);
insert into seats (flight_id, which_row, place, category) values (24,3,5,1);
insert into seats (flight_id, which_row, place, category) values (24,3,6,1);
insert into seats (flight_id, which_row, place, category) values (24,3,7,1);
insert into seats (flight_id, which_row, place, category) values (24,3,8,1);
insert into seats (flight_id, which_row, place, category) values (24,3,9,1);
insert into seats (flight_id, which_row, place, category) values (24,4,1,2);
insert into seats (flight_id, which_row, place, category) values (24,4,2,2);
insert into seats (flight_id, which_row, place, category) values (24,4,3,1);
insert into seats (flight_id, which_row, place, category) values (24,4,4,1);
insert into seats (flight_id, which_row, place, category) values (24,4,5,1);
insert into seats (flight_id, which_row, place, category) values (24,4,6,1);
insert into seats (flight_id, which_row, place, category) values (24,4,7,1);
insert into seats (flight_id, which_row, place, category) values (24,4,8,1);
insert into seats (flight_id, which_row, place, category) values (24,4,9,1);

insert into seats (flight_id, which_row, place, category) values (25,1,1,2);
insert into seats (flight_id, which_row, place, category) values (25,1,2,2);
insert into seats (flight_id, which_row, place, category) values (25,1,3,1);
insert into seats (flight_id, which_row, place, category) values (25,1,4,1);
insert into seats (flight_id, which_row, place, category) values (25,1,5,1);
insert into seats (flight_id, which_row, place, category) values (25,1,6,1);
insert into seats (flight_id, which_row, place, category) values (25,1,7,1);
insert into seats (flight_id, which_row, place, category) values (25,1,8,1);
insert into seats (flight_id, which_row, place, category) values (25,1,9,1);
insert into seats (flight_id, which_row, place, category) values (25,2,1,2);
insert into seats (flight_id, which_row, place, category) values (25,2,2,2);
insert into seats (flight_id, which_row, place, category) values (25,2,3,1);
insert into seats (flight_id, which_row, place, category) values (25,2,4,1);
insert into seats (flight_id, which_row, place, category) values (25,2,5,1);
insert into seats (flight_id, which_row, place, category) values (25,2,6,1);
insert into seats (flight_id, which_row, place, category) values (25,2,7,1);
insert into seats (flight_id, which_row, place, category) values (25,2,8,1);
insert into seats (flight_id, which_row, place, category) values (25,2,9,1);
insert into seats (flight_id, which_row, place, category) values (25,3,1,2);
insert into seats (flight_id, which_row, place, category) values (25,3,2,2);
insert into seats (flight_id, which_row, place, category) values (25,3,3,1);
insert into seats (flight_id, which_row, place, category) values (25,3,4,1);
insert into seats (flight_id, which_row, place, category) values (25,3,5,1);
insert into seats (flight_id, which_row, place, category) values (25,3,6,1);
insert into seats (flight_id, which_row, place, category) values (25,3,7,1);
insert into seats (flight_id, which_row, place, category) values (25,3,8,1);
insert into seats (flight_id, which_row, place, category) values (25,3,9,1);
insert into seats (flight_id, which_row, place, category) values (25,4,1,2);
insert into seats (flight_id, which_row, place, category) values (25,4,2,2);
insert into seats (flight_id, which_row, place, category) values (25,4,3,1);
insert into seats (flight_id, which_row, place, category) values (25,4,4,1);
insert into seats (flight_id, which_row, place, category) values (25,4,5,1);
insert into seats (flight_id, which_row, place, category) values (25,4,6,1);
insert into seats (flight_id, which_row, place, category) values (25,4,7,1);
insert into seats (flight_id, which_row, place, category) values (25,4,8,1);
insert into seats (flight_id, which_row, place, category) values (25,4,9,1);

insert into seats (flight_id, which_row, place, category) values (26,1,1,2);
insert into seats (flight_id, which_row, place, category) values (26,1,2,2);
insert into seats (flight_id, which_row, place, category) values (26,1,3,1);
insert into seats (flight_id, which_row, place, category) values (26,1,4,1);
insert into seats (flight_id, which_row, place, category) values (26,1,5,1);
insert into seats (flight_id, which_row, place, category) values (26,1,6,1);
insert into seats (flight_id, which_row, place, category) values (26,1,7,1);
insert into seats (flight_id, which_row, place, category) values (26,1,8,1);
insert into seats (flight_id, which_row, place, category) values (26,1,9,1);
insert into seats (flight_id, which_row, place, category) values (26,2,1,2);
insert into seats (flight_id, which_row, place, category) values (26,2,2,2);
insert into seats (flight_id, which_row, place, category) values (26,2,3,1);
insert into seats (flight_id, which_row, place, category) values (26,2,4,1);
insert into seats (flight_id, which_row, place, category) values (26,2,5,1);
insert into seats (flight_id, which_row, place, category) values (26,2,6,1);
insert into seats (flight_id, which_row, place, category) values (26,2,7,1);
insert into seats (flight_id, which_row, place, category) values (26,2,8,1);
insert into seats (flight_id, which_row, place, category) values (26,2,9,1);
insert into seats (flight_id, which_row, place, category) values (26,3,1,2);
insert into seats (flight_id, which_row, place, category) values (26,3,2,2);
insert into seats (flight_id, which_row, place, category) values (26,3,3,1);
insert into seats (flight_id, which_row, place, category) values (26,3,4,1);
insert into seats (flight_id, which_row, place, category) values (26,3,5,1);
insert into seats (flight_id, which_row, place, category) values (26,3,6,1);
insert into seats (flight_id, which_row, place, category) values (26,3,7,1);
insert into seats (flight_id, which_row, place, category) values (26,3,8,1);
insert into seats (flight_id, which_row, place, category) values (26,3,9,1);
insert into seats (flight_id, which_row, place, category) values (26,4,1,2);
insert into seats (flight_id, which_row, place, category) values (26,4,2,2);
insert into seats (flight_id, which_row, place, category) values (26,4,3,1);
insert into seats (flight_id, which_row, place, category) values (26,4,4,1);
insert into seats (flight_id, which_row, place, category) values (26,4,5,1);
insert into seats (flight_id, which_row, place, category) values (26,4,6,1);
insert into seats (flight_id, which_row, place, category) values (26,4,7,1);
insert into seats (flight_id, which_row, place, category) values (26,4,8,1);
insert into seats (flight_id, which_row, place, category) values (26,4,9,1);

insert into seats (flight_id, which_row, place, category) values (27,1,1,2);
insert into seats (flight_id, which_row, place, category) values (27,1,2,2);
insert into seats (flight_id, which_row, place, category) values (27,1,3,1);
insert into seats (flight_id, which_row, place, category) values (27,1,4,1);
insert into seats (flight_id, which_row, place, category) values (27,1,5,1);
insert into seats (flight_id, which_row, place, category) values (27,1,6,1);
insert into seats (flight_id, which_row, place, category) values (27,1,7,1);
insert into seats (flight_id, which_row, place, category) values (27,1,8,1);
insert into seats (flight_id, which_row, place, category) values (27,1,9,1);
insert into seats (flight_id, which_row, place, category) values (27,2,1,2);
insert into seats (flight_id, which_row, place, category) values (27,2,2,2);
insert into seats (flight_id, which_row, place, category) values (27,2,3,1);
insert into seats (flight_id, which_row, place, category) values (27,2,4,1);
insert into seats (flight_id, which_row, place, category) values (27,2,5,1);
insert into seats (flight_id, which_row, place, category) values (27,2,6,1);
insert into seats (flight_id, which_row, place, category) values (27,2,7,1);
insert into seats (flight_id, which_row, place, category) values (27,2,8,1);
insert into seats (flight_id, which_row, place, category) values (27,2,9,1);
insert into seats (flight_id, which_row, place, category) values (27,3,1,2);
insert into seats (flight_id, which_row, place, category) values (2,3,2,2);
insert into seats (flight_id, which_row, place, category) values (27,3,3,1);
insert into seats (flight_id, which_row, place, category) values (27,3,4,1);
insert into seats (flight_id, which_row, place, category) values (27,3,5,1);
insert into seats (flight_id, which_row, place, category) values (27,3,6,1);
insert into seats (flight_id, which_row, place, category) values (27,3,7,1);
insert into seats (flight_id, which_row, place, category) values (27,3,8,1);
insert into seats (flight_id, which_row, place, category) values (27,3,9,1);
insert into seats (flight_id, which_row, place, category) values (27,4,1,2);
insert into seats (flight_id, which_row, place, category) values (27,4,2,2);
insert into seats (flight_id, which_row, place, category) values (27,4,3,1);
insert into seats (flight_id, which_row, place, category) values (27,4,4,1);
insert into seats (flight_id, which_row, place, category) values (27,4,5,1);
insert into seats (flight_id, which_row, place, category) values (27,4,6,1);
insert into seats (flight_id, which_row, place, category) values (27,4,7,1);
insert into seats (flight_id, which_row, place, category) values (27,4,8,1);
insert into seats (flight_id, which_row, place, category) values (27,4,9,1);

insert into seats (flight_id, which_row, place, category) values (28,1,1,2);
insert into seats (flight_id, which_row, place, category) values (28,1,2,2);
insert into seats (flight_id, which_row, place, category) values (28,1,3,1);
insert into seats (flight_id, which_row, place, category) values (28,1,4,1);
insert into seats (flight_id, which_row, place, category) values (28,1,5,1);
insert into seats (flight_id, which_row, place, category) values (28,1,6,1);
insert into seats (flight_id, which_row, place, category) values (28,1,7,1);
insert into seats (flight_id, which_row, place, category) values (28,1,8,1);
insert into seats (flight_id, which_row, place, category) values (28,1,9,1);
insert into seats (flight_id, which_row, place, category) values (28,2,1,2);
insert into seats (flight_id, which_row, place, category) values (28,2,2,2);
insert into seats (flight_id, which_row, place, category) values (28,2,3,1);
insert into seats (flight_id, which_row, place, category) values (28,2,4,1);
insert into seats (flight_id, which_row, place, category) values (28,2,5,1);
insert into seats (flight_id, which_row, place, category) values (28,2,6,1);
insert into seats (flight_id, which_row, place, category) values (28,2,7,1);
insert into seats (flight_id, which_row, place, category) values (28,2,8,1);
insert into seats (flight_id, which_row, place, category) values (28,2,9,1);
insert into seats (flight_id, which_row, place, category) values (28,3,1,2);
insert into seats (flight_id, which_row, place, category) values (28,3,2,2);
insert into seats (flight_id, which_row, place, category) values (28,3,3,1);
insert into seats (flight_id, which_row, place, category) values (28,3,4,1);
insert into seats (flight_id, which_row, place, category) values (28,3,5,1);
insert into seats (flight_id, which_row, place, category) values (28,3,6,1);
insert into seats (flight_id, which_row, place, category) values (28,3,7,1);
insert into seats (flight_id, which_row, place, category) values (28,3,8,1);
insert into seats (flight_id, which_row, place, category) values (28,3,9,1);
insert into seats (flight_id, which_row, place, category) values (28,4,1,2);
insert into seats (flight_id, which_row, place, category) values (28,4,2,2);
insert into seats (flight_id, which_row, place, category) values (28,4,3,1);
insert into seats (flight_id, which_row, place, category) values (28,4,4,1);
insert into seats (flight_id, which_row, place, category) values (28,4,5,1);
insert into seats (flight_id, which_row, place, category) values (28,4,6,1);
insert into seats (flight_id, which_row, place, category) values (28,4,7,1);
insert into seats (flight_id, which_row, place, category) values (28,4,8,1);
insert into seats (flight_id, which_row, place, category) values (28,4,9,1);

insert into seats (flight_id, which_row, place, category) values (29,1,1,2);
insert into seats (flight_id, which_row, place, category) values (29,1,2,2);
insert into seats (flight_id, which_row, place, category) values (29,1,3,1);
insert into seats (flight_id, which_row, place, category) values (29,1,4,1);
insert into seats (flight_id, which_row, place, category) values (29,1,5,1);
insert into seats (flight_id, which_row, place, category) values (29,1,6,1);
insert into seats (flight_id, which_row, place, category) values (29,1,7,1);
insert into seats (flight_id, which_row, place, category) values (29,1,8,1);
insert into seats (flight_id, which_row, place, category) values (29,1,9,1);
insert into seats (flight_id, which_row, place, category) values (29,2,1,2);
insert into seats (flight_id, which_row, place, category) values (29,2,2,2);
insert into seats (flight_id, which_row, place, category) values (29,2,3,1);
insert into seats (flight_id, which_row, place, category) values (29,2,4,1);
insert into seats (flight_id, which_row, place, category) values (29,2,5,1);
insert into seats (flight_id, which_row, place, category) values (29,2,6,1);
insert into seats (flight_id, which_row, place, category) values (29,2,7,1);
insert into seats (flight_id, which_row, place, category) values (29,2,8,1);
insert into seats (flight_id, which_row, place, category) values (29,2,9,1);
insert into seats (flight_id, which_row, place, category) values (29,3,1,2);
insert into seats (flight_id, which_row, place, category) values (29,3,2,2);
insert into seats (flight_id, which_row, place, category) values (29,3,3,1);
insert into seats (flight_id, which_row, place, category) values (29,3,4,1);
insert into seats (flight_id, which_row, place, category) values (29,3,5,1);
insert into seats (flight_id, which_row, place, category) values (29,3,6,1);
insert into seats (flight_id, which_row, place, category) values (29,3,7,1);
insert into seats (flight_id, which_row, place, category) values (29,3,8,1);
insert into seats (flight_id, which_row, place, category) values (29,3,9,1);
insert into seats (flight_id, which_row, place, category) values (29,4,1,2);
insert into seats (flight_id, which_row, place, category) values (29,4,2,2);
insert into seats (flight_id, which_row, place, category) values (29,4,3,1);
insert into seats (flight_id, which_row, place, category) values (29,4,4,1);
insert into seats (flight_id, which_row, place, category) values (29,4,5,1);
insert into seats (flight_id, which_row, place, category) values (29,4,6,1);
insert into seats (flight_id, which_row, place, category) values (29,4,7,1);
insert into seats (flight_id, which_row, place, category) values (29,4,8,1);
insert into seats (flight_id, which_row, place, category) values (29,4,9,1);

insert into seats (flight_id, which_row, place, category) values (30,1,1,2);
insert into seats (flight_id, which_row, place, category) values (30,1,2,2);
insert into seats (flight_id, which_row, place, category) values (30,1,3,1);
insert into seats (flight_id, which_row, place, category) values (30,1,4,1);
insert into seats (flight_id, which_row, place, category) values (30,1,5,1);
insert into seats (flight_id, which_row, place, category) values (30,1,6,1);
insert into seats (flight_id, which_row, place, category) values (30,1,7,1);
insert into seats (flight_id, which_row, place, category) values (30,1,8,1);
insert into seats (flight_id, which_row, place, category) values (30,1,9,1);
insert into seats (flight_id, which_row, place, category) values (30,2,1,2);
insert into seats (flight_id, which_row, place, category) values (30,2,2,2);
insert into seats (flight_id, which_row, place, category) values (30,2,3,1);
insert into seats (flight_id, which_row, place, category) values (30,2,4,1);
insert into seats (flight_id, which_row, place, category) values (30,2,5,1);
insert into seats (flight_id, which_row, place, category) values (30,2,6,1);
insert into seats (flight_id, which_row, place, category) values (30,2,7,1);
insert into seats (flight_id, which_row, place, category) values (30,2,8,1);
insert into seats (flight_id, which_row, place, category) values (30,2,9,1);
insert into seats (flight_id, which_row, place, category) values (30,3,1,2);
insert into seats (flight_id, which_row, place, category) values (30,3,2,2);
insert into seats (flight_id, which_row, place, category) values (30,3,3,1);
insert into seats (flight_id, which_row, place, category) values (30,3,4,1);
insert into seats (flight_id, which_row, place, category) values (30,3,5,1);
insert into seats (flight_id, which_row, place, category) values (30,3,6,1);
insert into seats (flight_id, which_row, place, category) values (30,3,7,1);
insert into seats (flight_id, which_row, place, category) values (30,3,8,1);
insert into seats (flight_id, which_row, place, category) values (30,3,9,1);
insert into seats (flight_id, which_row, place, category) values (30,4,1,2);
insert into seats (flight_id, which_row, place, category) values (30,4,2,2);
insert into seats (flight_id, which_row, place, category) values (30,4,3,1);
insert into seats (flight_id, which_row, place, category) values (30,4,4,1);
insert into seats (flight_id, which_row, place, category) values (30,4,5,1);
insert into seats (flight_id, which_row, place, category) values (30,4,6,1);
insert into seats (flight_id, which_row, place, category) values (30,4,7,1);
insert into seats (flight_id, which_row, place, category) values (30,4,8,1);
insert into seats (flight_id, which_row, place, category) values (30,4,9,1);

insert into seats (flight_id, which_row, place, category) values (31,1,1,2);
insert into seats (flight_id, which_row, place, category) values (31,1,2,2);
insert into seats (flight_id, which_row, place, category) values (31,1,3,1);
insert into seats (flight_id, which_row, place, category) values (31,1,4,1);
insert into seats (flight_id, which_row, place, category) values (31,1,5,1);
insert into seats (flight_id, which_row, place, category) values (31,1,6,1);
insert into seats (flight_id, which_row, place, category) values (31,1,7,1);
insert into seats (flight_id, which_row, place, category) values (31,1,8,1);
insert into seats (flight_id, which_row, place, category) values (31,1,9,1);
insert into seats (flight_id, which_row, place, category) values (31,2,1,2);
insert into seats (flight_id, which_row, place, category) values (31,2,2,2);
insert into seats (flight_id, which_row, place, category) values (31,2,3,1);
insert into seats (flight_id, which_row, place, category) values (31,2,4,1);
insert into seats (flight_id, which_row, place, category) values (31,2,5,1);
insert into seats (flight_id, which_row, place, category) values (31,2,6,1);
insert into seats (flight_id, which_row, place, category) values (31,2,7,1);
insert into seats (flight_id, which_row, place, category) values (31,2,8,1);
insert into seats (flight_id, which_row, place, category) values (31,2,9,1);
insert into seats (flight_id, which_row, place, category) values (31,3,1,2);
insert into seats (flight_id, which_row, place, category) values (31,3,2,2);
insert into seats (flight_id, which_row, place, category) values (31,3,3,1);
insert into seats (flight_id, which_row, place, category) values (31,3,4,1);
insert into seats (flight_id, which_row, place, category) values (31,3,5,1);
insert into seats (flight_id, which_row, place, category) values (31,3,6,1);
insert into seats (flight_id, which_row, place, category) values (31,3,7,1);
insert into seats (flight_id, which_row, place, category) values (31,3,8,1);
insert into seats (flight_id, which_row, place, category) values (31,3,9,1);
insert into seats (flight_id, which_row, place, category) values (31,4,1,2);
insert into seats (flight_id, which_row, place, category) values (31,4,2,2);
insert into seats (flight_id, which_row, place, category) values (31,4,3,1);
insert into seats (flight_id, which_row, place, category) values (31,4,4,1);
insert into seats (flight_id, which_row, place, category) values (31,4,5,1);
insert into seats (flight_id, which_row, place, category) values (31,4,6,1);
insert into seats (flight_id, which_row, place, category) values (31,4,7,1);
insert into seats (flight_id, which_row, place, category) values (31,4,8,1);
insert into seats (flight_id, which_row, place, category) values (31,4,9,1);

insert into seats (flight_id, which_row, place, category) values (32,1,1,2);
insert into seats (flight_id, which_row, place, category) values (32,1,2,2);
insert into seats (flight_id, which_row, place, category) values (32,1,3,1);
insert into seats (flight_id, which_row, place, category) values (32,1,4,1);
insert into seats (flight_id, which_row, place, category) values (32,1,5,1);
insert into seats (flight_id, which_row, place, category) values (32,1,6,1);
insert into seats (flight_id, which_row, place, category) values (32,1,7,1);
insert into seats (flight_id, which_row, place, category) values (32,1,8,1);
insert into seats (flight_id, which_row, place, category) values (32,1,9,1);
insert into seats (flight_id, which_row, place, category) values (32,2,1,2);
insert into seats (flight_id, which_row, place, category) values (32,2,2,2);
insert into seats (flight_id, which_row, place, category) values (32,2,3,1);
insert into seats (flight_id, which_row, place, category) values (32,2,4,1);
insert into seats (flight_id, which_row, place, category) values (32,2,5,1);
insert into seats (flight_id, which_row, place, category) values (32,2,6,1);
insert into seats (flight_id, which_row, place, category) values (32,2,7,1);
insert into seats (flight_id, which_row, place, category) values (32,2,8,1);
insert into seats (flight_id, which_row, place, category) values (32,2,9,1);
insert into seats (flight_id, which_row, place, category) values (32,3,1,2);
insert into seats (flight_id, which_row, place, category) values (32,3,2,2);
insert into seats (flight_id, which_row, place, category) values (32,3,3,1);
insert into seats (flight_id, which_row, place, category) values (32,3,4,1);
insert into seats (flight_id, which_row, place, category) values (32,3,5,1);
insert into seats (flight_id, which_row, place, category) values (32,3,6,1);
insert into seats (flight_id, which_row, place, category) values (32,3,7,1);
insert into seats (flight_id, which_row, place, category) values (32,3,8,1);
insert into seats (flight_id, which_row, place, category) values (32,3,9,1);
insert into seats (flight_id, which_row, place, category) values (32,4,1,2);
insert into seats (flight_id, which_row, place, category) values (32,4,2,2);
insert into seats (flight_id, which_row, place, category) values (32,4,3,1);
insert into seats (flight_id, which_row, place, category) values (32,4,4,1);
insert into seats (flight_id, which_row, place, category) values (32,4,5,1);
insert into seats (flight_id, which_row, place, category) values (32,4,6,1);
insert into seats (flight_id, which_row, place, category) values (32,4,7,1);
insert into seats (flight_id, which_row, place, category) values (32,4,8,1);
insert into seats (flight_id, which_row, place, category) values (32,4,9,1);

insert into seats (flight_id, which_row, place, category) values (33,1,1,2);
insert into seats (flight_id, which_row, place, category) values (33,1,2,2);
insert into seats (flight_id, which_row, place, category) values (33,1,3,1);
insert into seats (flight_id, which_row, place, category) values (33,1,4,1);
insert into seats (flight_id, which_row, place, category) values (33,1,5,1);
insert into seats (flight_id, which_row, place, category) values (33,1,6,1);
insert into seats (flight_id, which_row, place, category) values (33,1,7,1);
insert into seats (flight_id, which_row, place, category) values (33,1,8,1);
insert into seats (flight_id, which_row, place, category) values (33,1,9,1);
insert into seats (flight_id, which_row, place, category) values (33,2,1,2);
insert into seats (flight_id, which_row, place, category) values (33,2,2,2);
insert into seats (flight_id, which_row, place, category) values (33,2,3,1);
insert into seats (flight_id, which_row, place, category) values (33,2,4,1);
insert into seats (flight_id, which_row, place, category) values (33,2,5,1);
insert into seats (flight_id, which_row, place, category) values (33,2,6,1);
insert into seats (flight_id, which_row, place, category) values (33,2,7,1);
insert into seats (flight_id, which_row, place, category) values (33,2,8,1);
insert into seats (flight_id, which_row, place, category) values (33,2,9,1);
insert into seats (flight_id, which_row, place, category) values (33,3,1,2);
insert into seats (flight_id, which_row, place, category) values (33,3,2,2);
insert into seats (flight_id, which_row, place, category) values (33,3,3,1);
insert into seats (flight_id, which_row, place, category) values (33,3,4,1);
insert into seats (flight_id, which_row, place, category) values (33,3,5,1);
insert into seats (flight_id, which_row, place, category) values (33,3,6,1);
insert into seats (flight_id, which_row, place, category) values (33,3,7,1);
insert into seats (flight_id, which_row, place, category) values (33,3,8,1);
insert into seats (flight_id, which_row, place, category) values (33,3,9,1);
insert into seats (flight_id, which_row, place, category) values (33,4,1,2);
insert into seats (flight_id, which_row, place, category) values (33,4,2,2);
insert into seats (flight_id, which_row, place, category) values (33,4,3,1);
insert into seats (flight_id, which_row, place, category) values (33,4,4,1);
insert into seats (flight_id, which_row, place, category) values (33,4,5,1);
insert into seats (flight_id, which_row, place, category) values (33,4,6,1);
insert into seats (flight_id, which_row, place, category) values (33,4,7,1);
insert into seats (flight_id, which_row, place, category) values (33,4,8,1);
insert into seats (flight_id, which_row, place, category) values (33,4,9,1);

insert into seats (flight_id, which_row, place, category) values (34,1,1,2);
insert into seats (flight_id, which_row, place, category) values (34,1,2,2);
insert into seats (flight_id, which_row, place, category) values (34,1,3,1);
insert into seats (flight_id, which_row, place, category) values (34,1,4,1);
insert into seats (flight_id, which_row, place, category) values (34,1,5,1);
insert into seats (flight_id, which_row, place, category) values (34,1,6,1);
insert into seats (flight_id, which_row, place, category) values (34,1,7,1);
insert into seats (flight_id, which_row, place, category) values (34,1,8,1);
insert into seats (flight_id, which_row, place, category) values (34,1,9,1);
insert into seats (flight_id, which_row, place, category) values (34,2,1,2);
insert into seats (flight_id, which_row, place, category) values (34,2,2,2);
insert into seats (flight_id, which_row, place, category) values (34,2,3,1);
insert into seats (flight_id, which_row, place, category) values (34,2,4,1);
insert into seats (flight_id, which_row, place, category) values (34,2,5,1);
insert into seats (flight_id, which_row, place, category) values (34,2,6,1);
insert into seats (flight_id, which_row, place, category) values (34,2,7,1);
insert into seats (flight_id, which_row, place, category) values (34,2,8,1);
insert into seats (flight_id, which_row, place, category) values (34,2,9,1);
insert into seats (flight_id, which_row, place, category) values (34,3,1,2);
insert into seats (flight_id, which_row, place, category) values (34,3,2,2);
insert into seats (flight_id, which_row, place, category) values (34,3,3,1);
insert into seats (flight_id, which_row, place, category) values (34,3,4,1);
insert into seats (flight_id, which_row, place, category) values (34,3,5,1);
insert into seats (flight_id, which_row, place, category) values (34,3,6,1);
insert into seats (flight_id, which_row, place, category) values (34,3,7,1);
insert into seats (flight_id, which_row, place, category) values (34,3,8,1);
insert into seats (flight_id, which_row, place, category) values (34,3,9,1);
insert into seats (flight_id, which_row, place, category) values (34,4,1,2);
insert into seats (flight_id, which_row, place, category) values (34,4,2,2);
insert into seats (flight_id, which_row, place, category) values (34,4,3,1);
insert into seats (flight_id, which_row, place, category) values (34,4,4,1);
insert into seats (flight_id, which_row, place, category) values (34,4,5,1);
insert into seats (flight_id, which_row, place, category) values (34,4,6,1);
insert into seats (flight_id, which_row, place, category) values (34,4,7,1);
insert into seats (flight_id, which_row, place, category) values (34,4,8,1);
insert into seats (flight_id, which_row, place, category) values (34,4,9,1);

insert into seats (flight_id, which_row, place, category) values (35,1,1,2);
insert into seats (flight_id, which_row, place, category) values (35,1,2,2);
insert into seats (flight_id, which_row, place, category) values (35,1,3,1);
insert into seats (flight_id, which_row, place, category) values (35,1,4,1);
insert into seats (flight_id, which_row, place, category) values (35,1,5,1);
insert into seats (flight_id, which_row, place, category) values (35,1,6,1);
insert into seats (flight_id, which_row, place, category) values (35,1,7,1);
insert into seats (flight_id, which_row, place, category) values (35,1,8,1);
insert into seats (flight_id, which_row, place, category) values (35,1,9,1);
insert into seats (flight_id, which_row, place, category) values (35,2,1,2);
insert into seats (flight_id, which_row, place, category) values (35,2,2,2);
insert into seats (flight_id, which_row, place, category) values (35,2,3,1);
insert into seats (flight_id, which_row, place, category) values (35,2,4,1);
insert into seats (flight_id, which_row, place, category) values (35,2,5,1);
insert into seats (flight_id, which_row, place, category) values (35,2,6,1);
insert into seats (flight_id, which_row, place, category) values (35,2,7,1);
insert into seats (flight_id, which_row, place, category) values (35,2,8,1);
insert into seats (flight_id, which_row, place, category) values (35,2,9,1);
insert into seats (flight_id, which_row, place, category) values (35,3,1,2);
insert into seats (flight_id, which_row, place, category) values (35,3,2,2);
insert into seats (flight_id, which_row, place, category) values (35,3,3,1);
insert into seats (flight_id, which_row, place, category) values (35,3,4,1);
insert into seats (flight_id, which_row, place, category) values (35,3,5,1);
insert into seats (flight_id, which_row, place, category) values (35,3,6,1);
insert into seats (flight_id, which_row, place, category) values (35,3,7,1);
insert into seats (flight_id, which_row, place, category) values (35,3,8,1);
insert into seats (flight_id, which_row, place, category) values (35,3,9,1);
insert into seats (flight_id, which_row, place, category) values (35,4,1,2);
insert into seats (flight_id, which_row, place, category) values (35,4,2,2);
insert into seats (flight_id, which_row, place, category) values (35,4,3,1);
insert into seats (flight_id, which_row, place, category) values (35,4,4,1);
insert into seats (flight_id, which_row, place, category) values (35,4,5,1);
insert into seats (flight_id, which_row, place, category) values (35,4,6,1);
insert into seats (flight_id, which_row, place, category) values (35,4,7,1);
insert into seats (flight_id, which_row, place, category) values (35,4,8,1);
insert into seats (flight_id, which_row, place, category) values (35,4,9,1);

insert into seats (flight_id, which_row, place, category) values (36,1,1,2);
insert into seats (flight_id, which_row, place, category) values (36,1,2,2);
insert into seats (flight_id, which_row, place, category) values (36,1,3,1);
insert into seats (flight_id, which_row, place, category) values (36,1,4,1);
insert into seats (flight_id, which_row, place, category) values (36,1,5,1);
insert into seats (flight_id, which_row, place, category) values (36,1,6,1);
insert into seats (flight_id, which_row, place, category) values (36,1,7,1);
insert into seats (flight_id, which_row, place, category) values (36,1,8,1);
insert into seats (flight_id, which_row, place, category) values (36,1,9,1);
insert into seats (flight_id, which_row, place, category) values (36,2,1,2);
insert into seats (flight_id, which_row, place, category) values (36,2,2,2);
insert into seats (flight_id, which_row, place, category) values (36,2,3,1);
insert into seats (flight_id, which_row, place, category) values (36,2,4,1);
insert into seats (flight_id, which_row, place, category) values (36,2,5,1);
insert into seats (flight_id, which_row, place, category) values (36,2,6,1);
insert into seats (flight_id, which_row, place, category) values (36,2,7,1);
insert into seats (flight_id, which_row, place, category) values (36,2,8,1);
insert into seats (flight_id, which_row, place, category) values (36,2,9,1);
insert into seats (flight_id, which_row, place, category) values (36,3,1,2);
insert into seats (flight_id, which_row, place, category) values (36,3,2,2);
insert into seats (flight_id, which_row, place, category) values (36,3,3,1);
insert into seats (flight_id, which_row, place, category) values (36,3,4,1);
insert into seats (flight_id, which_row, place, category) values (36,3,5,1);
insert into seats (flight_id, which_row, place, category) values (36,3,6,1);
insert into seats (flight_id, which_row, place, category) values (36,3,7,1);
insert into seats (flight_id, which_row, place, category) values (36,3,8,1);
insert into seats (flight_id, which_row, place, category) values (36,3,9,1);
insert into seats (flight_id, which_row, place, category) values (36,4,1,2);
insert into seats (flight_id, which_row, place, category) values (36,4,2,2);
insert into seats (flight_id, which_row, place, category) values (36,4,3,1);
insert into seats (flight_id, which_row, place, category) values (36,4,4,1);
insert into seats (flight_id, which_row, place, category) values (36,4,5,1);
insert into seats (flight_id, which_row, place, category) values (36,4,6,1);
insert into seats (flight_id, which_row, place, category) values (36,4,7,1);
insert into seats (flight_id, which_row, place, category) values (36,4,8,1);
insert into seats (flight_id, which_row, place, category) values (36,4,9,1);

insert into seats (flight_id, which_row, place, category) values (37,1,1,2);
insert into seats (flight_id, which_row, place, category) values (37,1,2,2);
insert into seats (flight_id, which_row, place, category) values (37,1,3,1);
insert into seats (flight_id, which_row, place, category) values (37,1,4,1);
insert into seats (flight_id, which_row, place, category) values (37,1,5,1);
insert into seats (flight_id, which_row, place, category) values (37,1,6,1);
insert into seats (flight_id, which_row, place, category) values (37,1,7,1);
insert into seats (flight_id, which_row, place, category) values (37,1,8,1);
insert into seats (flight_id, which_row, place, category) values (37,1,9,1);
insert into seats (flight_id, which_row, place, category) values (37,2,1,2);
insert into seats (flight_id, which_row, place, category) values (37,2,2,2);
insert into seats (flight_id, which_row, place, category) values (37,2,3,1);
insert into seats (flight_id, which_row, place, category) values (37,2,4,1);
insert into seats (flight_id, which_row, place, category) values (37,2,5,1);
insert into seats (flight_id, which_row, place, category) values (37,2,6,1);
insert into seats (flight_id, which_row, place, category) values (37,2,7,1);
insert into seats (flight_id, which_row, place, category) values (37,2,8,1);
insert into seats (flight_id, which_row, place, category) values (37,2,9,1);
insert into seats (flight_id, which_row, place, category) values (37,3,1,2);
insert into seats (flight_id, which_row, place, category) values (37,3,2,2);
insert into seats (flight_id, which_row, place, category) values (37,3,3,1);
insert into seats (flight_id, which_row, place, category) values (37,3,4,1);
insert into seats (flight_id, which_row, place, category) values (37,3,5,1);
insert into seats (flight_id, which_row, place, category) values (37,3,6,1);
insert into seats (flight_id, which_row, place, category) values (37,3,7,1);
insert into seats (flight_id, which_row, place, category) values (37,3,8,1);
insert into seats (flight_id, which_row, place, category) values (37,3,9,1);
insert into seats (flight_id, which_row, place, category) values (37,4,1,2);
insert into seats (flight_id, which_row, place, category) values (37,4,2,2);
insert into seats (flight_id, which_row, place, category) values (37,4,3,1);
insert into seats (flight_id, which_row, place, category) values (37,4,4,1);
insert into seats (flight_id, which_row, place, category) values (37,4,5,1);
insert into seats (flight_id, which_row, place, category) values (37,4,6,1);
insert into seats (flight_id, which_row, place, category) values (37,4,7,1);
insert into seats (flight_id, which_row, place, category) values (37,4,8,1);
insert into seats (flight_id, which_row, place, category) values (37,4,9,1);

insert into seats (flight_id, which_row, place, category) values (38,1,1,2);
insert into seats (flight_id, which_row, place, category) values (38,1,2,2);
insert into seats (flight_id, which_row, place, category) values (38,1,3,1);
insert into seats (flight_id, which_row, place, category) values (38,1,4,1);
insert into seats (flight_id, which_row, place, category) values (38,1,5,1);
insert into seats (flight_id, which_row, place, category) values (38,1,6,1);
insert into seats (flight_id, which_row, place, category) values (38,1,7,1);
insert into seats (flight_id, which_row, place, category) values (38,1,8,1);
insert into seats (flight_id, which_row, place, category) values (38,1,9,1);
insert into seats (flight_id, which_row, place, category) values (38,2,1,2);
insert into seats (flight_id, which_row, place, category) values (38,2,2,2);
insert into seats (flight_id, which_row, place, category) values (38,2,3,1);
insert into seats (flight_id, which_row, place, category) values (38,2,4,1);
insert into seats (flight_id, which_row, place, category) values (38,2,5,1);
insert into seats (flight_id, which_row, place, category) values (38,2,6,1);
insert into seats (flight_id, which_row, place, category) values (38,2,7,1);
insert into seats (flight_id, which_row, place, category) values (38,2,8,1);
insert into seats (flight_id, which_row, place, category) values (38,2,9,1);
insert into seats (flight_id, which_row, place, category) values (38,3,1,2);
insert into seats (flight_id, which_row, place, category) values (38,3,2,2);
insert into seats (flight_id, which_row, place, category) values (38,3,3,1);
insert into seats (flight_id, which_row, place, category) values (38,3,4,1);
insert into seats (flight_id, which_row, place, category) values (38,3,5,1);
insert into seats (flight_id, which_row, place, category) values (38,3,6,1);
insert into seats (flight_id, which_row, place, category) values (38,3,7,1);
insert into seats (flight_id, which_row, place, category) values (38,3,8,1);
insert into seats (flight_id, which_row, place, category) values (38,3,9,1);
insert into seats (flight_id, which_row, place, category) values (38,4,1,2);
insert into seats (flight_id, which_row, place, category) values (38,4,2,2);
insert into seats (flight_id, which_row, place, category) values (38,4,3,1);
insert into seats (flight_id, which_row, place, category) values (38,4,4,1);
insert into seats (flight_id, which_row, place, category) values (38,4,5,1);
insert into seats (flight_id, which_row, place, category) values (38,4,6,1);
insert into seats (flight_id, which_row, place, category) values (38,4,7,1);
insert into seats (flight_id, which_row, place, category) values (38,4,8,1);
insert into seats (flight_id, which_row, place, category) values (38,4,9,1);

insert into seats (flight_id, which_row, place, category) values (39,1,1,2);
insert into seats (flight_id, which_row, place, category) values (39,1,2,2);
insert into seats (flight_id, which_row, place, category) values (39,1,3,1);
insert into seats (flight_id, which_row, place, category) values (39,1,4,1);
insert into seats (flight_id, which_row, place, category) values (39,1,5,1);
insert into seats (flight_id, which_row, place, category) values (39,1,6,1);
insert into seats (flight_id, which_row, place, category) values (39,1,7,1);
insert into seats (flight_id, which_row, place, category) values (39,1,8,1);
insert into seats (flight_id, which_row, place, category) values (39,1,9,1);
insert into seats (flight_id, which_row, place, category) values (39,2,1,2);
insert into seats (flight_id, which_row, place, category) values (39,2,2,2);
insert into seats (flight_id, which_row, place, category) values (39,2,3,1);
insert into seats (flight_id, which_row, place, category) values (39,2,4,1);
insert into seats (flight_id, which_row, place, category) values (39,2,5,1);
insert into seats (flight_id, which_row, place, category) values (39,2,6,1);
insert into seats (flight_id, which_row, place, category) values (39,2,7,1);
insert into seats (flight_id, which_row, place, category) values (39,2,8,1);
insert into seats (flight_id, which_row, place, category) values (39,2,9,1);
insert into seats (flight_id, which_row, place, category) values (39,3,1,2);
insert into seats (flight_id, which_row, place, category) values (39,3,2,2);
insert into seats (flight_id, which_row, place, category) values (39,3,3,1);
insert into seats (flight_id, which_row, place, category) values (39,3,4,1);
insert into seats (flight_id, which_row, place, category) values (39,3,5,1);
insert into seats (flight_id, which_row, place, category) values (39,3,6,1);
insert into seats (flight_id, which_row, place, category) values (39,3,7,1);
insert into seats (flight_id, which_row, place, category) values (39,3,8,1);
insert into seats (flight_id, which_row, place, category) values (39,3,9,1);
insert into seats (flight_id, which_row, place, category) values (39,4,1,2);
insert into seats (flight_id, which_row, place, category) values (39,4,2,2);
insert into seats (flight_id, which_row, place, category) values (39,4,3,1);
insert into seats (flight_id, which_row, place, category) values (39,4,4,1);
insert into seats (flight_id, which_row, place, category) values (39,4,5,1);
insert into seats (flight_id, which_row, place, category) values (39,4,6,1);
insert into seats (flight_id, which_row, place, category) values (39,4,7,1);
insert into seats (flight_id, which_row, place, category) values (39,4,8,1);
insert into seats (flight_id, which_row, place, category) values (39,4,9,1);

insert into seats (flight_id, which_row, place, category) values (40,1,1,2);
insert into seats (flight_id, which_row, place, category) values (40,1,2,2);
insert into seats (flight_id, which_row, place, category) values (40,1,3,1);
insert into seats (flight_id, which_row, place, category) values (40,1,4,1);
insert into seats (flight_id, which_row, place, category) values (40,1,5,1);
insert into seats (flight_id, which_row, place, category) values (40,1,6,1);
insert into seats (flight_id, which_row, place, category) values (40,1,7,1);
insert into seats (flight_id, which_row, place, category) values (40,1,8,1);
insert into seats (flight_id, which_row, place, category) values (40,1,9,1);
insert into seats (flight_id, which_row, place, category) values (40,2,1,2);
insert into seats (flight_id, which_row, place, category) values (40,2,2,2);
insert into seats (flight_id, which_row, place, category) values (40,2,3,1);
insert into seats (flight_id, which_row, place, category) values (40,2,4,1);
insert into seats (flight_id, which_row, place, category) values (40,2,5,1);
insert into seats (flight_id, which_row, place, category) values (40,2,6,1);
insert into seats (flight_id, which_row, place, category) values (40,2,7,1);
insert into seats (flight_id, which_row, place, category) values (40,2,8,1);
insert into seats (flight_id, which_row, place, category) values (40,2,9,1);
insert into seats (flight_id, which_row, place, category) values (40,3,1,2);
insert into seats (flight_id, which_row, place, category) values (40,3,2,2);
insert into seats (flight_id, which_row, place, category) values (40,3,3,1);
insert into seats (flight_id, which_row, place, category) values (40,3,4,1);
insert into seats (flight_id, which_row, place, category) values (40,3,5,1);
insert into seats (flight_id, which_row, place, category) values (40,3,6,1);
insert into seats (flight_id, which_row, place, category) values (40,3,7,1);
insert into seats (flight_id, which_row, place, category) values (40,3,8,1);
insert into seats (flight_id, which_row, place, category) values (40,3,9,1);
insert into seats (flight_id, which_row, place, category) values (40,4,1,2);
insert into seats (flight_id, which_row, place, category) values (40,4,2,2);
insert into seats (flight_id, which_row, place, category) values (40,4,3,1);
insert into seats (flight_id, which_row, place, category) values (40,4,4,1);
insert into seats (flight_id, which_row, place, category) values (40,4,5,1);
insert into seats (flight_id, which_row, place, category) values (40,4,6,1);
insert into seats (flight_id, which_row, place, category) values (40,4,7,1);
insert into seats (flight_id, which_row, place, category) values (40,4,8,1);
insert into seats (flight_id, which_row, place, category) values (40,4,9,1);

insert into seats (flight_id, which_row, place, category) values (41,1,1,2);
insert into seats (flight_id, which_row, place, category) values (41,1,2,2);
insert into seats (flight_id, which_row, place, category) values (41,1,3,1);
insert into seats (flight_id, which_row, place, category) values (41,1,4,1);
insert into seats (flight_id, which_row, place, category) values (41,1,5,1);
insert into seats (flight_id, which_row, place, category) values (41,1,6,1);
insert into seats (flight_id, which_row, place, category) values (41,1,7,1);
insert into seats (flight_id, which_row, place, category) values (41,1,8,1);
insert into seats (flight_id, which_row, place, category) values (41,1,9,1);
insert into seats (flight_id, which_row, place, category) values (41,2,1,2);
insert into seats (flight_id, which_row, place, category) values (41,2,2,2);
insert into seats (flight_id, which_row, place, category) values (41,2,3,1);
insert into seats (flight_id, which_row, place, category) values (41,2,4,1);
insert into seats (flight_id, which_row, place, category) values (41,2,5,1);
insert into seats (flight_id, which_row, place, category) values (41,2,6,1);
insert into seats (flight_id, which_row, place, category) values (41,2,7,1);
insert into seats (flight_id, which_row, place, category) values (41,2,8,1);
insert into seats (flight_id, which_row, place, category) values (41,2,9,1);
insert into seats (flight_id, which_row, place, category) values (41,3,1,2);
insert into seats (flight_id, which_row, place, category) values (41,3,2,2);
insert into seats (flight_id, which_row, place, category) values (41,3,3,1);
insert into seats (flight_id, which_row, place, category) values (41,3,4,1);
insert into seats (flight_id, which_row, place, category) values (41,3,5,1);
insert into seats (flight_id, which_row, place, category) values (41,3,6,1);
insert into seats (flight_id, which_row, place, category) values (41,3,7,1);
insert into seats (flight_id, which_row, place, category) values (41,3,8,1);
insert into seats (flight_id, which_row, place, category) values (41,3,9,1);
insert into seats (flight_id, which_row, place, category) values (41,4,1,2);
insert into seats (flight_id, which_row, place, category) values (41,4,2,2);
insert into seats (flight_id, which_row, place, category) values (41,4,3,1);
insert into seats (flight_id, which_row, place, category) values (41,4,4,1);
insert into seats (flight_id, which_row, place, category) values (41,4,5,1);
insert into seats (flight_id, which_row, place, category) values (41,4,6,1);
insert into seats (flight_id, which_row, place, category) values (41,4,7,1);
insert into seats (flight_id, which_row, place, category) values (41,4,8,1);
insert into seats (flight_id, which_row, place, category) values (41,4,9,1);

insert into seats (flight_id, which_row, place, category) values (42,1,1,2);
insert into seats (flight_id, which_row, place, category) values (42,1,2,2);
insert into seats (flight_id, which_row, place, category) values (42,1,3,1);
insert into seats (flight_id, which_row, place, category) values (42,1,4,1);
insert into seats (flight_id, which_row, place, category) values (42,1,5,1);
insert into seats (flight_id, which_row, place, category) values (42,1,6,1);
insert into seats (flight_id, which_row, place, category) values (42,1,7,1);
insert into seats (flight_id, which_row, place, category) values (42,1,8,1);
insert into seats (flight_id, which_row, place, category) values (42,1,9,1);
insert into seats (flight_id, which_row, place, category) values (42,2,1,2);
insert into seats (flight_id, which_row, place, category) values (42,2,2,2);
insert into seats (flight_id, which_row, place, category) values (42,2,3,1);
insert into seats (flight_id, which_row, place, category) values (42,2,4,1);
insert into seats (flight_id, which_row, place, category) values (42,2,5,1);
insert into seats (flight_id, which_row, place, category) values (42,2,6,1);
insert into seats (flight_id, which_row, place, category) values (42,2,7,1);
insert into seats (flight_id, which_row, place, category) values (42,2,8,1);
insert into seats (flight_id, which_row, place, category) values (42,2,9,1);
insert into seats (flight_id, which_row, place, category) values (42,3,1,2);
insert into seats (flight_id, which_row, place, category) values (42,3,2,2);
insert into seats (flight_id, which_row, place, category) values (42,3,3,1);
insert into seats (flight_id, which_row, place, category) values (42,3,4,1);
insert into seats (flight_id, which_row, place, category) values (42,3,5,1);
insert into seats (flight_id, which_row, place, category) values (42,3,6,1);
insert into seats (flight_id, which_row, place, category) values (42,3,7,1);
insert into seats (flight_id, which_row, place, category) values (42,3,8,1);
insert into seats (flight_id, which_row, place, category) values (42,3,9,1);
insert into seats (flight_id, which_row, place, category) values (42,4,1,2);
insert into seats (flight_id, which_row, place, category) values (42,4,2,2);
insert into seats (flight_id, which_row, place, category) values (42,4,3,1);
insert into seats (flight_id, which_row, place, category) values (42,4,4,1);
insert into seats (flight_id, which_row, place, category) values (42,4,5,1);
insert into seats (flight_id, which_row, place, category) values (42,4,6,1);
insert into seats (flight_id, which_row, place, category) values (42,4,7,1);
insert into seats (flight_id, which_row, place, category) values (42,4,8,1);
insert into seats (flight_id, which_row, place, category) values (42,4,9,1);

INSERT INTO roles(name) VALUES('ROLE_USER');
INSERT INTO roles(name) VALUES('ROLE_PM');
INSERT INTO roles(name) VALUES('ROLE_ADMIN');
