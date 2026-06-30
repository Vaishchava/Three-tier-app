# Three-Tier Flask Application – Dockerized

This repository is a Dockerized version of the original Three-Tier Flask application created by **Ameya Lokare**.

The goal of this fork is to containerize the application using Docker and Docker Compose while following modern DevOps best practices.

---

## Original Repository

**Original Author:** Ameya Lokare

This repository is a fork of the original project. All application logic and source code belong to the original author. My contribution focuses on containerization, deployment, debugging, and infrastructure improvements.

---

## My Contributions

### Docker

* Created a production-ready Dockerfile for the Flask application.
* Used a lightweight Python base image.
* Optimized Docker layer caching by copying `requirements.txt` before the application source.
* Installed dependencies using `pip --no-cache-dir`.
* Configured the application to run inside a Docker container.
* Exposed the Flask application on port **5090**.

---

### Docker Compose

Created a Docker Compose setup including:

* Flask application service
* PostgreSQL database service
* Nginx reverse proxy
* Custom Docker networks
* Persistent PostgreSQL volume
* Environment variable management using `.env`
* Automatic service restart policy

---

### Nginx

Configured Nginx as a reverse proxy to:

* Accept client requests
* Forward requests to the Flask application
* Separate web server responsibilities from the application server

---

### PostgreSQL

Configured PostgreSQL using Docker Compose.

Updated the application to communicate with PostgreSQL through the Docker service name instead of `localhost`.

---

### Database Fixes

Resolved compatibility issues with newer versions of SQLAlchemy.

Updated the database connection string from:

```python
postgres://
```

to

```python
postgresql://
```

to support modern SQLAlchemy versions.

Added database initialization during application startup so tables are created automatically if they do not already exist.

---

### Docker Networking

Configured communication between containers using Docker Compose networks.

Application flow:

```
Browser
    │
    ▼
Nginx
    │
    ▼
Flask
    │
    ▼
PostgreSQL
```

---

### Project Structure

```
.
├── app.py
├── database.py
├── models.py
├── forms.py
├── templates/
├── static/
├── Dockerfile
├── docker-compose.yml
├── nginx/
│   └── flaskapp.conf
├── .env
└── requirements.txt
```

---

## Technologies Used

* Python
* Flask
* SQLAlchemy
* PostgreSQL
* Nginx
* Docker
* Docker Compose

---

## How to Run

Clone the repository:

```bash
git clone <repository-url>
cd Three-tier-app
```

Build the images:

```bash
docker compose build
```

Start the application:

```bash
docker compose up
```

Open your browser:

```
http://localhost:8080
```

---

## DevOps Concepts Practiced

* Docker image creation
* Docker layer caching
* Docker Compose
* Docker networking
* Reverse proxy with Nginx
* Environment variables
* Persistent volumes
* PostgreSQL containerization
* Container debugging
* Service-to-service communication
* Application dependency management

---

## Acknowledgements

Application developed by **Ameya Lokare**.

This fork focuses on Dockerization, container orchestration, infrastructure configuration, troubleshooting, and DevOps best practices for learning and portfolio purposes.
