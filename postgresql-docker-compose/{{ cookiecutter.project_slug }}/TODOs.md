Connect from Jupyter notebook to Postgres.

REview if the Python feature works as expected. Is there a need for a jupyter-related flag into the feature?


+ Persist the Postgres database between development sessions
+ Create a venv that gets initialized once the devcontainer starts
  Install all dependencies to execute queries on the database.
+ Initialize the postgres database with schema 
- Add environment variables for all inputs.
- Change the hostname of the postgres host.
- Add a service user.
- Clean up readmes
- Ability to inspect, open terminal to the other services of the Compose
  stack.
- Create and mount servers.json for pgamdin with the Postgres database
  already in it with valid credentials.
- What is the proper way to use devconatiners in a compose stack?
  Docker compose up will start the container but without any feature.

  Note: depends_on can start dependent services. Should we define them and
        let VSCode start the whole stack? We can eliminate the rebuild step
        with that. Verify!


17:51-17:51  Check what does the postgresql image doc says about this.
17:51-18:08  Create a local persistent volume, try out mounting it to
             the default PGDATA directory of /var/lib/postgresql/data
18:11-       Create venv using pyenv


10:00-10:10 Find the Elasticsearch docker compose stack
10:10-10:12: Review how the stack is created.

10:12-10:19: Review Healthcheck feature in Dockerfile specification. 
             https://docs.docker.com/reference/dockerfile/#healthcheck
10:20-10:30: Review the depends-on in the compose file.
11:50-   Concept map of healthcheck


Review healthcheck, how it works, etc. Implement a demo project for healthcheck.        

Multi-stage docker builds

Docker service for initialization

Docker compose up <service> - How does it work?

Docker healthcheck element for service

healthcheck:
  test: ["CMD", "curl", "-f", "http://localhost"]
  interval: 1m30s
  timeout: 10s
  retries: 3
  start_period: 2m

defined in the HEALTHCHECK dockerfile instruction

depends_on:
   servicename:
     condition: service_healthy


      https://github.com/elastic/elasticsearch/blob/8.13/docs/reference/setup/install/docker/docker-compose.yml
      https://www.elastic.co/guide/en/elasticsearch/reference/8.13/docker.html#docker-compose-file
      https://www.elastic.co/blog/getting-started-with-the-elastic-stack-and-docker-compose
      https://www.elastic.co/blog/getting-started-with-the-elastic-stack-and-docker-compose-part-2


TODO: Check which stack is downloaded onto the company laptop.

/var/lib/postgresql

PGDATA: /var/lib/postgresql/data
   Can be used to define another location for the database files.
   Needed when
    - the data volume is a filesystem mountpoint
    - remote folder that cannot be chowned to be postgres user (nfs)
    - contains folders / files (lost+found)

When mounting 



specify -> define



Selecting virtualenv for the notebook
1. Click the kernel icon
2. Select another kernel...
3. Python Environments
4. Select the virtualenv (postgres-notebook)


ipykernel
ipython-sql
psycopg2-binary

