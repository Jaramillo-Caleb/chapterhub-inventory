truncate table
  audit_logs, payments, order_items, orders, profiles,
  order_statuses, customers, cities, books, genres
restart identity cascade;

select setseed(0.42);

insert into genres (name, description) values
  ('Ficción',            'Novela y cuento literario contemporáneo y clásico'),
  ('Ciencia ficción',    'Futuros posibles, tecnología y distopías'),
  ('Fantasía',           'Mundos imaginarios, magia y épica'),
  ('Misterio y thriller','Intriga, crimen y suspenso'),
  ('Romance',            'Historias de amor y relaciones'),
  ('Historia',           'Divulgación histórica y antropológica'),
  ('Biografía',          'Vidas y testimonios reales'),
  ('Ciencia y tecnología','Divulgación científica'),
  ('Autoayuda',          'Desarrollo personal, hábitos y finanzas'),
  ('Infantil y juvenil', 'Lecturas para niños y jóvenes');

insert into order_statuses (name) values
  ('Pendiente'), ('Pagado'), ('Enviado'), ('Entregado'), ('Cancelado');

insert into cities (name, department) values
  ('Manizales',     'Caldas'),
  ('Bogotá D.C.',   'Cundinamarca'),
  ('Medellín',      'Antioquia'),
  ('Cali',          'Valle del Cauca'),
  ('Pereira',       'Risaralda'),
  ('Armenia',       'Quindío'),
  ('Barranquilla',  'Atlántico'),
  ('Bucaramanga',   'Santander'),
  ('Cartagena',     'Bolívar'),
  ('Cúcuta',        'Norte de Santander'),
  ('Ibagué',        'Tolima'),
  ('Villavicencio', 'Meta'),
  ('Pasto',         'Nariño'),
  ('Santa Marta',   'Magdalena'),
  ('Neiva',         'Huila');

insert into profiles (id, full_name, email, role) values
  ('11111111-1111-4111-8111-111111111111', 'Laura Mejía Ospina',     'laura.mejia@chapterhub.com',    'admin'),
  ('22222222-2222-4222-8222-222222222222', 'Carlos Andrés Rojas',    'carlos.rojas@chapterhub.com',   'admin'),
  ('33333333-3333-4333-8333-333333333333', 'Daniela Cardona Ríos',   'daniela.cardona@chapterhub.com','vendedor'),
  ('44444444-4444-4444-8444-444444444444', 'Juan Pablo Henao',       'juan.henao@chapterhub.com',     'vendedor'),
  ('55555555-5555-4555-8555-555555555555', 'Mariana Giraldo Duque',  'mariana.giraldo@chapterhub.com','vendedor'),
  ('66666666-6666-4666-8666-666666666666', 'Sebastián Arias Marín',  'sebastian.arias@chapterhub.com','vendedor');

insert into books (title, author, description, year, genre_id, price, quantity) values
 ('Cien años de soledad','Gabriel García Márquez','La saga de la familia Buendía en el mítico pueblo de Macondo.',1967,1,18.90,25),
 ('El amor en los tiempos del cólera','Gabriel García Márquez','Una historia de amor que desafía el paso del tiempo.',1985,5,16.50,18),
 ('Crónica de una muerte anunciada','Gabriel García Márquez','La reconstrucción de un crimen que todo un pueblo sabía que ocurriría.',1981,1,12.00,30),
 ('La casa de los espíritus','Isabel Allende','Tres generaciones de mujeres marcadas por la política y el amor.',1982,1,15.75,14),
 ('Pedro Páramo','Juan Rulfo','Un hombre viaja a Comala y encuentra un pueblo de voces muertas.',1955,1,11.50,20),
 ('Rayuela','Julio Cortázar','Novela experimental que se puede leer en más de un orden.',1963,1,17.00,9),
 ('Ficciones','Jorge Luis Borges','Cuentos sobre laberintos, espejos e infinitos.',1944,1,13.40,16),
 ('El túnel','Ernesto Sabato','Un pintor narra el asesinato de la única persona que lo comprendió.',1948,1,10.90,12),
 ('Dune','Frank Herbert','Épica del desierto Arrakis, la especia y la casa Atreides.',1965,2,19.90,22),
 ('Fundación','Isaac Asimov','Un matemático intenta preservar el conocimiento ante la caída de un imperio galáctico.',1951,2,14.80,17),
 ('Neuromante','William Gibson','Novela fundacional del cyberpunk sobre hackers y realidad virtual.',1984,2,15.20,8),
 ('Fahrenheit 451','Ray Bradbury','En un futuro donde los libros están prohibidos, un bombero empieza a dudar.',1953,2,12.60,24),
 ('1984','George Orwell','Distopía sobre vigilancia total y manipulación de la verdad.',1949,2,13.00,35),
 ('Un mundo feliz','Aldous Huxley','Una sociedad estable y feliz a costa de la libertad individual.',1932,2,12.90,19),
 ('El hobbit','J.R.R. Tolkien','La aventura de Bilbo Bolsón, un dragón y un tesoro.',1937,3,16.90,28),
 ('La comunidad del anillo','J.R.R. Tolkien','Comienza el viaje para destruir el Anillo Único.',1954,3,21.00,15),
 ('Harry Potter y la piedra filosofal','J.K. Rowling','Un niño descubre que es mago e ingresa a Hogwarts.',1997,3,17.50,40),
 ('Juego de tronos','George R. R. Martin','Casas nobles se disputan el Trono de Hierro.',1996,3,22.50,13),
 ('El nombre del viento','Patrick Rothfuss','La historia de Kvothe, músico, mago y leyenda.',2007,3,20.00,11),
 ('Asesinato en el Orient Express','Agatha Christie','Poirot investiga un crimen en un tren detenido por la nieve.',1934,4,11.90,21),
 ('El código Da Vinci','Dan Brown','Un simbologista persigue un secreto guardado por siglos.',2003,4,14.50,26),
 ('La chica del tren','Paula Hawkins','Una mujer ve algo desde la ventanilla que lo cambia todo.',2015,4,13.80,10),
 ('Los hombres que no amaban a las mujeres','Stieg Larsson','Un periodista y una hacker investigan una desaparición de décadas.',2005,4,15.60,12),
 ('Orgullo y prejuicio','Jane Austen','Elizabeth Bennet y el señor Darcy frente a los prejuicios de su época.',1813,5,10.50,18),
 ('Jane Eyre','Charlotte Brontë','Una institutriz huérfana y el misterioso señor Rochester.',1847,5,11.20,9),
 ('Sapiens','Yuval Noah Harari','Breve historia de la humanidad, de los cazadores recolectores a hoy.',2011,6,21.90,30),
 ('Armas, gérmenes y acero','Jared Diamond','Por qué algunas sociedades dominaron a otras.',1997,6,19.40,7),
 ('SPQR','Mary Beard','Una nueva historia de la antigua Roma.',2015,6,24.00,6),
 ('Steve Jobs','Walter Isaacson','Biografía autorizada del cofundador de Apple.',2011,7,22.00,14),
 ('El diario de Ana Frank','Ana Frank','Testimonio de una adolescente judía escondida durante la ocupación nazi.',1947,7,9.90,27),
 ('Breve historia del tiempo','Stephen Hawking','Del Big Bang a los agujeros negros, explicado para todos.',1988,8,16.80,20),
 ('Cosmos','Carl Sagan','Un recorrido por el universo y nuestro lugar en él.',1980,8,18.30,12),
 ('El gen egoísta','Richard Dawkins','La evolución vista desde el punto de vista de los genes.',1976,8,17.20,8),
 ('Hábitos atómicos','James Clear','Cambios pequeños que producen resultados extraordinarios.',2018,9,19.00,38),
 ('Padre rico, padre pobre','Robert Kiyosaki','Lecciones sobre dinero y educación financiera.',1997,9,14.00,33),
 ('Los 7 hábitos de la gente altamente efectiva','Stephen Covey','Principios para la eficacia personal y profesional.',1989,9,16.10,16),
 ('El principito','Antoine de Saint-Exupéry','Un piloto conoce a un niño que viene de otro planeta.',1943,10,9.50,45),
 ('Matilda','Roald Dahl','Una niña prodigio se enfrenta a una directora tiránica.',1988,10,10.80,19),
 ('El león, la bruja y el armario','C.S. Lewis','Cuatro hermanos descubren Narnia a través de un armario.',1950,10,12.70,15),
 ('Percy Jackson y el ladrón del rayo','Rick Riordan','Un adolescente descubre que es hijo de un dios griego.',2005,10,13.60,0);

with names as (
  select n,
    (array['Valentina','Santiago','Camila','Mateo','Sofía','Juan David',
           'Isabella','Andrés','Daniela','Felipe','Mariana','Nicolás'])[1 + (n*7) % 12] as fn,
    (array['García','Rodríguez','Martínez','López','Hernández','Gómez',
           'Ramírez','Torres','Vargas','Castaño','Ospina','Jaramillo'])[1 + (n*5 + n/12) % 12] as ln
  from generate_series(1, 40) n
)
insert into customers (full_name, email, phone, city_id, created_at)
select
  fn || ' ' || ln,
  translate(lower(replace(fn, ' ', '') || '.' || ln), 'áéíóúñü', 'aeiounu') || n || '@correo.com',
  '3' || lpad(floor(random() * 1e9)::bigint::text, 9, '0'),
  1 + floor(power(random(), 2) * 15)::int,
  now() - make_interval(days => 365 + floor(random() * 400)::int)
from names
order by n;

insert into orders (customer_id, status_id, created_by, order_date, total)
select
  1 + floor(power(random(), 2.5) * 40)::int,
  case when r < 0.08 then 1
       when r < 0.18 then 2
       when r < 0.28 then 3
       when r < 0.85 then 4
       else 5 end,
  (array['11111111-1111-4111-8111-111111111111',
         '22222222-2222-4222-8222-222222222222',
         '33333333-3333-4333-8333-333333333333',
         '44444444-4444-4444-8444-444444444444',
         '55555555-5555-4555-8555-555555555555',
         '66666666-6666-4666-8666-666666666666']::uuid[])[1 + floor(power(random(), 2) * 6)::int],
  now() - make_interval(days  => floor(power(random(), 1.4) * 365)::int,
                        hours => floor(random() * 24)::int),
  0
from (select n, random() as r from generate_series(1, 50) n) s
order by n;

insert into order_items (order_id, book_id, quantity, unit_price)
select o.id, s.id, 1 + floor(power(random(), 3) * 4)::int, s.price
from orders o
cross join lateral (
  select x.id, x.price
  from (
    select b.id, b.price,
           row_number() over (order by power(random(), 1 + b.id / 8.0) desc) as rn
    from books b
    where o.id > 0
  ) x
  where x.rn <= 1 + (o.id * 7) % 5
) s
order by o.id, s.id;

update orders o
set total = t.s
from (select order_id, sum(quantity * unit_price) as s
      from order_items group by order_id) t
where t.order_id = o.id;

insert into payments (order_id, amount, method, paid_at)
select o.id, o.total,
  (array['Tarjeta de crédito','Tarjeta débito','PSE','Transferencia','Efectivo','Nequi'])
    [1 + floor(power(random(), 1.6) * 6)::int],
  least(o.order_date + make_interval(mins => 5 + floor(random() * 2800)::int), now())
from orders o
where o.status_id in (2, 3, 4) and o.id % 8 <> 0
order by o.id;

insert into payments (order_id, amount, method, paid_at)
select o.id, round(o.total * 0.6, 2), 'Transferencia',
       least(o.order_date + interval '1 hour', now())
from orders o where o.status_id in (2, 3, 4) and o.id % 8 = 0
union all
select o.id, o.total - round(o.total * 0.6, 2), 'Efectivo',
       least(o.order_date + interval '1 day', now())
from orders o where o.status_id in (2, 3, 4) and o.id % 8 = 0;

insert into audit_logs (profile_id, table_name, action, record_id, details, created_at)
select
  p,
  tn,
  act,
  case tn when 'orders'      then 1 + floor(random() * 50)::int
          when 'order_items' then 1 + floor(random() * 100)::int
          when 'payments'    then 1 + floor(random() * 40)::int
          when 'customers'   then 1 + floor(random() * 40)::int
          else                    1 + floor(random() * 40)::int end,
  jsonb_build_object('origen', 'carga inicial', 'descripcion', act || ' en ' || tn),
  now() - make_interval(days => floor(power(random(), 1.3) * 300)::int,
                        hours => floor(random() * 24)::int)
from (
  select n,
    (array['11111111-1111-4111-8111-111111111111',
           '22222222-2222-4222-8222-222222222222',
           '33333333-3333-4333-8333-333333333333',
           '44444444-4444-4444-8444-444444444444',
           '55555555-5555-4555-8555-555555555555',
           '66666666-6666-4666-8666-666666666666']::uuid[])[1 + floor(power(random(), 2) * 6)::int] as p,
    (array['orders','books','payments','customers','order_items'])[1 + floor(power(random(), 1.5) * 5)::int] as tn,
    (array['INSERT','UPDATE','DELETE'])[1 + floor(power(random(), 2) * 3)::int] as act
  from generate_series(1, 40) n
) s
order by n;

select 'genres' as tabla, count(*) from genres
union all select 'books', count(*) from books
union all select 'cities', count(*) from cities
union all select 'customers', count(*) from customers
union all select 'order_statuses', count(*) from order_statuses
union all select 'profiles', count(*) from profiles
union all select 'orders', count(*) from orders
union all select 'order_items', count(*) from order_items
union all select 'payments', count(*) from payments
union all select 'audit_logs', count(*) from audit_logs;
