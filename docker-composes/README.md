# System docker containers

This is my system docker services.

## Kellnr

To self-host Rust crates I use.

### Run

```bash
docker compose --file ./docker-composes/kellnr.yml up -d
```

### Stop

```bash
docker compose --file ./docker-composes/kellnr.yml down
```

### Update

```bash
docker compose --file ./docker-composes/kellnr.yml pull
```

