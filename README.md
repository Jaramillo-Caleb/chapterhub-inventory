# ChapterHub Inventory

A full-stack **Express + PostgreSQL (Supabase)** bookstore inventory application featuring **CRUD**, **image uploads**, **search**, **sorting**, **filtering**, and clean server-rendered views using **EJS + Tailwind CSS**.

Audited and extended to an enterprise **10-table relational model** hosted on **Supabase** with business analytics embedded from **Google Looker Studio**.

---

## Tech Stack & Tools

![Node.js](https://img.shields.io/badge/Node.js-339933?logo=node.js&logoColor=white)
![Express](https://img.shields.io/badge/Express.js-000000?logo=express&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql&logoColor=white)
![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?logo=supabase&logoColor=white)
![Looker Studio](https://img.shields.io/badge/Looker_Studio-4285F4?logo=google&logoColor=white)
![Neon](https://img.shields.io/badge/NeonDB-00E599?logo=postgresql&logoColor=white)
![EJS](https://img.shields.io/badge/EJS-8BC34A?logo=ejs&logoColor=white)
![TailwindCSS](https://img.shields.io/badge/TailwindCSS-38B2AC?logo=tailwind-css&logoColor=white)
![Multer](https://img.shields.io/badge/Multer-FFCA28?logo=node.js&logoColor=black)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript&logoColor=black)
![The Odin Project](https://img.shields.io/badge/The%20Odin%20Project-000000?logo=the-odin-project&logoColor=white)

---

## Screenshots

### Home Page

![home](./public/img/sc_first.png)

### Analytics Dashboard
![home](./public/img/sc_first-analytics.png)

### Books Page

![home](./public/img/sc_second.png)

### Edit Book Page

![home](./public/img/sc_third.png)

### Delete Genre Page

![home](./public/img/sc_fourth.png)

### Error Page

![home](./public/img/sc_fifth.png)

> Go to Live demo Section to see more pages - Error 500 Page, Edit Genre Page , Delete Book Page

---

# Features

### Books Management

- Create, edit, delete books
- Upload cover images (Multer)
- Metadata support: title, author, year, description
- Additional fields: **price**, **quantity**
- Filename hashing using crypto
- Full validation with express-validator

### Genres Management

- Create, edit, delete genres
- Name + description fields
- Prevent duplicates using DB constraints
- Genre dropdown in book forms

### Search, Filter & Sort

- Search books by title
- Filter books by **one or multiple genres**
- Sort options:
  - Title (A–Z / Z–A)
  - Year (Oldest / Newest)
  - Price (Low → High / High → Low)

### Database Layer

- PostgreSQL hosted on **Supabase** (Session Pooler IPv4)
- Normalized 10-table schema supporting sales, customers, orders, and audit logs
- Embedded interactive BI Dashboard from **Google Looker Studio**
- Parameterized SQL queries (SQL injection safe)

### UI (Tailwind + EJS)

- Tailwind CSS v4
- Modern, minimal, responsive UI
- Clean EJS templates

---

# Folder Structure

```
chapterhub-inventory/
│
├─ app.js
├─ package.json
├─ nodemon.json
│
├─ db/
│   ├─ seed.js
│   ├─ pool.js
│   ├─ data/
│   │    ├─ books.js
│   │    └─ genres.js
│   └─ queries/
│        ├─ books.js
│        └─ genres.js
│
├─ controllers/
│   ├─ booksController.js
│   └─ genresController.js
│
├─ routes/
│   ├─ booksRouter.js
│   ├─ genresRouter.js
│   └─ indexRouter.js
│
├─ validators/
│   ├─ booksValidators.js
│   └─ genresValidators.js
│
├─ middlewares/
│   ├─ upload.js
│   └─ setLocals.js
│
├─ views/
│
└─ public/

```

---

# Database Schema

The original schema (2 tables: `books`, `genres`) was audited and extended to a **10-table relational model** with explicit primary and foreign keys, referential integrity constraints, and indexes.

### Diagrama Entidad-Relación (DER)

```mermaid
erDiagram
    cities ||--o{ customers : "ubica"
    customers ||--o{ orders : "realiza"
    order_statuses ||--o{ orders : "describe"
    profiles ||--o{ orders : "registra"
    profiles ||--o{ audit_logs : "genera"
    genres ||--o{ books : "clasifica"
    books ||--o{ order_items : "se vende en"
    orders ||--o{ order_items : "contiene"
    orders ||--o{ payments : "se paga con"

    genres {
        int id PK
        varchar name UK
        text description
        timestamptz created_at
    }

    books {
        int id PK
        varchar title
        varchar author
        text description
        int year
        int genre_id FK
        text image_url
        numeric price
        int quantity
        timestamptz created_at
    }

    cities {
        int id PK
        varchar name
        varchar department
    }

    customers {
        int id PK
        varchar full_name
        varchar email UK
        varchar phone
        int city_id FK
        timestamptz created_at
    }

    order_statuses {
        int id PK
        varchar name UK
    }

    profiles {
        uuid id PK
        varchar full_name
        varchar email UK
        varchar role
        timestamptz created_at
    }

    orders {
        int id PK
        int customer_id FK
        int status_id FK
        uuid created_by FK
        timestamptz order_date
        numeric total
    }

    order_items {
        int id PK
        int order_id FK
        int book_id FK
        int quantity
        numeric unit_price
    }

    payments {
        int id PK
        int order_id FK
        numeric amount
        varchar method
        timestamptz paid_at
    }

    audit_logs {
        int id PK
        uuid profile_id FK
        varchar table_name
        varchar action
        int record_id
        jsonb details
        timestamptz created_at
    }
```

# Scripts SQL de Creación y Población
Los scripts oficiales para inicializar el esquema completo y los datos asimétricos se encuentran en la raíz del repositorio:
- Script de Creación de Tablas, Llaves e Índices: 01_schema.sql
- Script de Población de Datos Iniciales (Seed): 02_seed.sql
---

# Setup & Installation

### 1. Clone the repository

```bash
git clone https://github.com/Jaramillo-Caleb/chapterhub-inventory.git
cd chapterhub-inventory
```

### 2. Install dependencies

```bash
pnpm install
```

### 3. Create `.env`

```
DATABASE_URL=conexion_adjunta_en_el_classroom
PORT=3000
```

### 4. Seed the database

Fresh reset:

```bash
pnpm seed:reset
```

Normal seed:

```bash
pnpm seed
```

---

# Running the Project

### Development mode (server + Tailwind watcher)

```bash
pnpm dev
```

### Build Tailwind for production

```bash
pnpm css:build
```

### Start server normally

```
pnpm start
```

Server runs at:

```
http://localhost:3000
```

---

# Image Upload System

- Uploads stored in: `public/uploads/`
- Uses Multer disk storage
- Accepts: `.jpg`, `.jpeg`, `.png`, `.webp`
- Max file size: **5MB**
- Unique filenames using `crypto.randomBytes`

---

# Author

**Sameer Ali**  
Full-stack developer & Odin Project learner.

---

# License

**MIT License** — free to modify & share.

---

# Citations

https://github.com/devxsameer/chapterhub-inventory
