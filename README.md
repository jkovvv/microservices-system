# Distributed Microservices System

A distributed microservices system built from scratch in Java featuring a custom **Load Balancer**, **API Gateway**, independent **User** and **Product** services, and **PostgreSQL** databases. The entire environment is orchestrated using Docker Compose.

## Overview

This project demonstrates the core building blocks of a distributed backend architecture without relying on frameworks such as Spring Cloud or Kubernetes.

The system consists of:

- Custom Load Balancer
- Custom API Gateway
- User Service
- Product Service
- PostgreSQL database for each service

The goal of the project was to understand how production backend systems communicate internally by implementing the networking layer manually.

---

## Architecture

```
                    Client
                       │
                       ▼
            +-------------------+
            |   Load Balancer   |
            |      :8080        |
            +-------------------+
                       │
                       ▼
            +-------------------+
            |    API Gateway    |
            |      :9000        |
            +-------------------+
               │            │
               │            │
               ▼            ▼
      +---------------+  +----------------+
      | User Service  |  | Product Service|
      |    :9001      |  |     :9002      |
      +---------------+  +----------------+
             │                  │
             ▼                  ▼
      PostgreSQL Users    PostgreSQL Products
```

---

## Features

### Load Balancer

- Custom Java implementation
- Health checking
- Service availability monitoring
- Request forwarding
- Latency tracking
- Weighted Least Connections routing strategy

### API Gateway

- Built using Java sockets
- HTTP request parsing
- Request routing
- Response forwarding
- Health endpoint (`/health`)

### User Service

- Retrieve users
- Create users
- Delete users
- PostgreSQL integration

### Product Service

- Retrieve products
- Create products
- Delete products
- PostgreSQL integration

---

## Technologies

- Java 17
- Docker
- Docker Compose
- PostgreSQL
- Java HTTP Client
- Java Sockets
- REST-style HTTP communication
- Git

---

## Project Structure

```
MicroservicesSystem
│
├── database
│   ├── users-init.sql
│   └── products-init.sql
│
├── docker-compose.yml
│
└── README.md
```

The system depends on the following repositories:

- API Gateway
- Load Balancer
- User Service
- Product Service

---

## Getting Started

### Prerequisites

- Docker Desktop
- Git

### Clone the repositories

```bash
git clone https://github.com/jkovvv/microservices-system.git
git clone https://github.com/jkovvv/api-gateway.git
git clone https://github.com/jkovvv/load-balancer.git
git clone https://github.com/jkovvv/user-service.git
git clone https://github.com/jkovvv/product-service.git
```

Place all repositories in the same parent directory:

```
Projects/
│
├── microservices-system
├── api-gateway
├── load-balancer
├── user-service
└── product-service
```

### Run the system

```bash
cd MicroservicesSystem

docker compose up --build
```

---

## Example Requests

Get all users

```http
GET /users
```

```bash
curl http://localhost:8080/users
```

Get all products

```http
GET /products
```

```bash
curl http://localhost:8080/products
```

Create a product

```bash
curl -X POST http://localhost:8080/products \
-H "Content-Type: application/json" \
-d "{\"name\":\"Keyboard\",\"price\":50}"
```

---

## Health Monitoring

The API Gateway exposes:

```
GET /health
```

The Load Balancer periodically checks this endpoint to determine service availability before forwarding requests.

---

## Future Improvements

- Multiple API Gateway instances
- Service discovery
- Circuit breaker
- Rate limiting
- Authentication & Authorization
- HTTPS support
- Metrics dashboard
- Logging framework
- Kubernetes deployment

---

## Related Projects

- API Gateway
- Load Balancer
- User Service
- Product Service
