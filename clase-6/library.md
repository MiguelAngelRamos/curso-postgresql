```sql
create table authors (
 author_id serial primary key,
 firt_name varchar(50) not null,
 last_name varchar(50) not null
);

create table books (
 book_id serial primary key,
 title varchar(100) not null,
 author_id int not null,
 published_year int,
 foreign key (author_id) references authors(author_id)
);

create table users (
 user_id serial primary key,
 name varchar(100) not null,
 email varchar(100) not null unique
);

create table loans (
 load_id serial primary key,
 user_id int not null,
 book_id int not null,
 loan_date DATE not null,
 return_date DATE,
 foreign key(user_id) references users(user_id),
 foreign key(book_id) references books(book_id)
);



```
