```sh
Table authors {
  author_id SERIAL [pk]
  first_name varchar(50) [not null]
  last_name varchar(50) [not null]
}

Table books {
  book_id SERIAL [pk]
  title varchar(100) [not null]
  author_id INT [not null, ref: > authors.author_id]
  published_year INT
}

Table users {
  user_id SERIAL [pk]
  name varchar(100) [not null]
  email varchar(100) [unique, not null]
}

Table loans {
  load_id SERIAL [pk]
  user_id INT [not null, ref: > users.user_id]
  book_id int [not null, ref: > books.book_id]
  loan_date DATE [not null]
  return_date DATE
}
```