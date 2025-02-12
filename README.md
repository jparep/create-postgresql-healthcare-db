# Healthcare Database with PostgreSQL and Docker Compose

This guide will help you set up a healthcare database using PostgreSQL and Docker Compose.

## Prerequisites

- Docker
- Docker Compose

## Getting Started

1. **Clone the repository:**

    ```sh
    git clone https://github.com/jparep/create-postgresql-healthcare-db.git
    cd create-postgresql-healthcare-db
    ```

2. **Create a `docker-compose.yml` file:**

    ```yaml
    version: '3.8'

    services:
      db:
        image: postgres:latest
        environment:
          POSTGRES_DB: healthcare
          POSTGRES_USER: yourusername
          POSTGRES_PASSWORD: yourpassword
        ports:
          - "5432:5432"
        volumes:
          - db_data:/var/lib/postgresql/data

    volumes:
      db_data:
    ```

3. **Start the PostgreSQL container:**

    ```sh
    docker-compose up -d
    ```

4. **Access the PostgreSQL database:**

    ```sh
    docker exec -it create-postgresql-healthcare-db_db_1 psql -U yourusername -d healthcare
    ```


## Stopping the Containers

To stop the running containers, use:

```sh
docker-compose down
```

## Cleaning Up

To remove all containers, networks, and volumes, use:

```sh
docker-compose down --volumes
```

## Conclusion

You have successfully set up a healthcare database using PostgreSQL and Docker Compose. You can now start building your application on top of this database.
