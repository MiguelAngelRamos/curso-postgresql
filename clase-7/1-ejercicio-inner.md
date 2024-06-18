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

insert into books(title, author_id, publication_date) values
('Harry Potter and the Philosopher stone',1, '1997-06-26'),
('Harry Potter and the Chamber of Secrets',1, '1998-07-02'),
('The Hobbit',2, '1937-09-21'),
('The Lord of the Rings',2, '1954-07-29'),
('A Game of Thrones', 3, '1996-08-06');

select * from authors;

-- Consulta con Inner Join para obtener una lista de libros junto con los nombres de sus authores

select
	i.title ,
	a."name" ,
	a.birthdate
from
	authors a
inner join books i
on
	a.id = i.author_id;

-- Otra propuesta
select
	books.title as book_title,
	authors.name as author_name,
	books.publication_date
from
	books
inner join 
	authors on books.author_id = authors.id;
 
```