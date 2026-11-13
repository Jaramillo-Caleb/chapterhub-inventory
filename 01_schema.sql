drop table if exists
  audit_logs, payments, order_items, orders, profiles,
  order_statuses, customers, cities, books, genres
cascade;

create table genres (
  id          integer generated always as identity primary key,
  name        varchar(100) not null unique,
  description text,
  created_at  timestamptz not null default now()
);

create table books (
  id          integer generated always as identity primary key,
  title       varchar(255) not null,
  author      varchar(255),
  description text,
  year        integer       check (year between 1000 and 2100),
  genre_id    integer       references genres (id)
                              on delete set null on update cascade,
  image_url   text,
  price       numeric(10,2) not null default 0 check (price >= 0),
  quantity    integer       not null default 0 check (quantity >= 0),
  created_at  timestamptz   not null default now(),
  constraint books_title_author_key unique (title, author)
);

create table cities (
  id         integer generated always as identity primary key,
  name       varchar(100) not null,
  department varchar(100) not null,
  constraint cities_name_department_key unique (name, department)
);

create table customers (
  id         integer generated always as identity primary key,
  full_name  varchar(150) not null,
  email      varchar(150) not null unique,
  phone      varchar(20),
  city_id    integer references cities (id)
                on delete restrict on update cascade,
  created_at timestamptz not null default now()
);

create table order_statuses (
  id   integer generated always as identity primary key,
  name varchar(30) not null unique
);

create table profiles (
  id         uuid primary key default gen_random_uuid(),
  full_name  varchar(150) not null,
  email      varchar(150) not null unique,
  role       varchar(20)  not null default 'vendedor'
               check (role in ('admin', 'vendedor')),
  created_at timestamptz  not null default now()
);

create table orders (
  id          integer generated always as identity primary key,
  customer_id integer not null references customers (id)
                on delete restrict on update cascade,
  status_id   integer not null default 1 references order_statuses (id)
                on delete restrict on update cascade,
  created_by  uuid references profiles (id)
                on delete set null on update cascade,
  order_date  timestamptz   not null default now(),
  total       numeric(12,2) not null default 0 check (total >= 0)
);

create table order_items (
  id         integer generated always as identity primary key,
  order_id   integer not null references orders (id)
               on delete cascade on update cascade,
  book_id    integer not null references books (id)
               on delete restrict on update cascade,
  quantity   integer       not null check (quantity > 0),
  unit_price numeric(10,2) not null check (unit_price >= 0),
  constraint order_items_order_book_key unique (order_id, book_id)
);

create table payments (
  id       integer generated always as identity primary key,
  order_id integer not null references orders (id)
             on delete cascade on update cascade,
  amount   numeric(12,2) not null check (amount > 0),
  method   varchar(30)   not null
             check (method in ('Tarjeta de crédito','Tarjeta débito','PSE',
                               'Transferencia','Efectivo','Nequi')),
  paid_at  timestamptz   not null default now()
);

create table audit_logs (
  id         integer generated always as identity primary key,
  profile_id uuid references profiles (id)
               on delete set null on update cascade,
  table_name varchar(50) not null,
  action     varchar(10) not null check (action in ('INSERT','UPDATE','DELETE')),
  record_id  integer,
  details    jsonb,
  created_at timestamptz not null default now()
);

create index idx_books_genre_id       on books (genre_id);
create index idx_books_author         on books (author);
create index idx_books_title          on books (title);
create index idx_customers_city_id    on customers (city_id);
create index idx_orders_customer_id   on orders (customer_id);
create index idx_orders_status_id     on orders (status_id);
create index idx_orders_created_by    on orders (created_by);
create index idx_orders_order_date    on orders (order_date);
create index idx_order_items_book_id  on order_items (book_id);
create index idx_payments_order_id    on payments (order_id);
create index idx_payments_paid_at     on payments (paid_at);
create index idx_audit_logs_profile   on audit_logs (profile_id);
create index idx_audit_logs_table_rec on audit_logs (table_name, record_id);
create index idx_audit_logs_created   on audit_logs (created_at);

alter table genres         enable row level security;
alter table books          enable row level security;
alter table cities         enable row level security;
alter table customers      enable row level security;
alter table order_statuses enable row level security;
alter table profiles       enable row level security;
alter table orders         enable row level security;
alter table order_items    enable row level security;
alter table payments       enable row level security;
alter table audit_logs     enable row level security;

