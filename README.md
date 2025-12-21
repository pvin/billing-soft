# 🧾 Billing & Invoicing System (Rails 7)

A simple billing and invoicing application built with **Ruby on Rails 7**, **Bootstrap 5**, and **Sidekiq**, supporting product-based billing, tax calculation, cash denomination handling, and invoice email delivery.

---

## 🚀 Features

- Customer billing with email
- Multiple products per bill
- Automatic tax calculation
- Bill total rounding
- Cash paid & balance denomination calculation
- Customer-wise bill history
- Invoice email delivery
- Background job processing using Sidekiq
- Email preview using Letter Opener (development)

---

## 🛠 Tech Stack

| Layer            | Technology |
|------------------|------------|
| Backend          | Ruby on Rails 7.2.3 |
| Frontend         | Bootstrap 5 |
| Database         | PostgreSQL / SQLite (dev) |
| Background Jobs  | Sidekiq |
| Cache / Queue    | Redis |
| Email            | Action Mailer |
| Email Preview    | Letter Opener |
| JavaScript       | Importmaps / ES Modules |

---

## 📦 Prerequisites

- Ruby 3.2.1
- Rails 7.2.3
- Redis
- Bundler
- Node.js (optional)

---

## ⚙️ Setup Instructions

### 1. Clone the Repository

gh repo clone pvin/billing-soft
cd billing-app

### 2. Install Dependencies
bundle install

### 3. Database Setup
rails db:create
rails db:migrate
rails db:seed

### 4. Start Redis
redis-server

### 5. Start Sidekiq
bundle exec sidekiq

### 6. Start Rails Server
rails server


Visit:
http://localhost:3000