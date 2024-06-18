```sql
create table authors (
	id serial primary key,
	name varchar(100) not null,
	birthdate DATE
);

create table books (
	id serial primary key,
	title varchar(100) not null,
	author_id INT,
	publication_date DATE,
	foreign key(author_id) references authors(id)
);

-- J. K. Rowling

insert into authors (name, birthdate) values
('J. K. Rowling', '1965-07-31'),
('J.R.R Tolkien', '1892-01-03'),
('George R.R. Martin', '1948-09-20');




```