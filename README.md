# PokéAPI ELT

- Extract/Load: Airbyte
- Transform: custom dbt-transformations

## How to run?

### Dockerized dbt

1) Image:
`docker build --tag dbt-postgres --target dbt-postgres ./Dockerfile-dbt`

2) Container:
- Volumes
`docker run -it --name dbt --mount src=dbt-data,dst=/usr/app/dbt --entrypoint /bin/bash dbt-postgres`

`docker run -it --name dbt --mount type=volume,target=/usr/app/dbt --entrypoint /bin/bash dbt-postgres`

or

- Bind mount
`docker run -it --name dbt --mount type=bind,src=/usr/app/dbt/ELT-dbt-intro,dst=/usr/app/dbt --entrypoint /bin/bash dbt-postgres`