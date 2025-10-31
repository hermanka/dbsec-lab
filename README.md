# Welcome

Just another lab for practice.

## Build 'n Run

```
> docker compose up -d --build
```

## Connect to MySQL

- Access the client container using a web browser
`http://localhost:7681`
- Login to MySQL server
`mysql -uroot -hserver-db -p`

## The architecture

```mermaid
sequenceDiagram
Host->>client-db: localhost:7681
client-db->>server-db: 3306