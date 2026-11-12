# Ruby on Rails Task Manager

A full-stack Task Manager built with Ruby on Rails 8.1 and PostgreSQL, deployed to a Hetzner VPS using Docker and Kamal.

Built as part of Linuxademy's **Build Rails Applications with AI** course, demonstrating how to use AI as a development assistant to build and deploy a real Rails application.

## Features

- Create tasks
- View tasks
- Edit tasks
- Mark tasks as completed
- Delete tasks
- Store tasks in PostgreSQL

## Tech Stack

- **Backend:** Ruby on Rails 8.1
- **Database:** PostgreSQL
- **Frontend:** ERB, Tailwind CSS, Hotwire (Turbo and Stimulus)
- **Background jobs:** Solid Queue
- **Caching:** Solid Cache
- **WebSockets:** Solid Cable
- **Containerization:** Docker
- **Deployment:** Kamal
- **Hosting:** Hetzner Cloud
- **HTTPS:** Kamal Proxy

## Requirements

For local development:

- Ruby (see `.ruby-version`)
- Bundler
- PostgreSQL
- Git

For production deployment:

- Docker
- Kamal (included in the project dependencies)
- Ubuntu VPS on Hetzner
- Domain name with DNS access
- SSH key pair

## Local Setup

Clone the repository:

```bash
git clone YOUR_REPOSITORY_URL
cd rails-task-manager
```

Install dependencies:

```bash
bundle install
```

### Configure PostgreSQL

The application uses the PostgreSQL role `my_app`.

Create a local PostgreSQL role with permission to create databases:

```bash
sudo -u postgres createuser --login --createdb --pwprompt my_app
```

Choose a local development password and configure the matching credentials in `config/database.yml`.

The development database is:

```text
my_app_development
```

The test database is:

```text
my_app_test
```

Prepare the databases:

```bash
bin/rails db:prepare
```

### Start the Application

```bash
bin/dev
```

Open:

http://localhost:3000

## Rails Credentials

Rails uses encrypted credentials stored in:

```text
config/credentials.yml.enc
```

The corresponding decryption key is:

```text
config/master.key
```

The master key is private and must never be committed.

When cloning this repository, you will not have the original application's master key. To use your own credentials, create a new encrypted credentials file and master key for your copy.

**Do not reuse the course author's production credentials or master key.**

## Production Configuration

The application uses Kamal and PostgreSQL 17.

Important configuration files:

| File | Purpose |
|---|---|
| `config/database.yml` | Local and production PostgreSQL configuration |
| `config/deploy.yml` | Kamal deployment configuration |
| `config/credentials.yml.enc` | Encrypted Rails credentials |
| `.kamal/secrets` | Local secret definitions used by Kamal |
| `Dockerfile` | Rails application container |
| `.dockerignore` | Files excluded from Docker builds |

### Database Configuration

Production uses four PostgreSQL databases:

- `my_app_production`
- `my_app_production_cache`
- `my_app_production_queue`
- `my_app_production_cable`

The production application receives these environment variables through Kamal:

```text
RAILS_MASTER_KEY
POSTGRES_PASSWORD
POSTGRES_HOST
```

The PostgreSQL accessory uses persistent storage.

### VPS and Domain

Before deploying, update `config/deploy.yml` with your own:

- Hetzner VPS IP address
- Domain name
- SSH configuration, if needed
- Docker registry configuration

The IP address and domain currently shown in the deployment configuration belong to the original course environment. **Replace them with your own values.**

The configured registry uses `localhost:5555`. Ensure the registry and image distribution workflow are correctly configured before deployment.

Hosting and domain registration are separate paid services.

## Deploy with Kamal

After configuring the VPS, DNS, SSH, Rails Credentials, Kamal Secrets, and Docker registry:

First deployment:

```bash
bin/kamal setup
```

Subsequent deployments:

```bash
bin/kamal deploy
```

Check deployment status:

```bash
bin/kamal details
```

View application logs:

```bash
bin/kamal app logs
```

View PostgreSQL logs:

```bash
bin/kamal accessory logs db
```

## Security

Never commit:

- `config/master.key`
- `config/credentials/*.key`
- `.kamal/secrets`
- `.env` files containing secrets
- Private SSH keys
- Database backups containing sensitive data
- Passwords or API tokens

Use your own generated secrets and database credentials.

Before deploying publicly, verify SSH access, HTTPS, firewall rules, database access restrictions, and backup procedures.

## Course Framework

The Linuxademy course follows eight steps:

1. Create the Rails Application
2. Set Up PostgreSQL
3. Configure Rails Credentials
4. Configure Kamal Secrets
5. Configure Kamal
6. Prepare the VPS + Domain
7. Deploy to Production
8. Manage Production

## Learn More

🐧 **Linuxademy**

https://linuxademy.com

🤝 **AI Certification Council**

https://www.aicertificationcouncil.com

---

Built for practical, hands-on learning with Linuxademy.
