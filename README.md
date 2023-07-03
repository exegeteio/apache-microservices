# Apache Microservices

Wonder what Microservices looked like in 2005?  Check it out!

Actually, don't.  This is a useless app for a silly blog post.  Let it die ☠️..

# Build

Clone the repo, and build with Docker:

```sh
docker build --tag=apache-ms ./
```

# Start the server

```sh
docker run --rm -p 3000:80 --name apache-ms apache-ms
```

# Benchmark

Run the apache benchmark tool:

```sh
docker exec -it apache-ms ab -c 25 -n 100000 http://localhost/
```

This will run 25 concurrent sessions, 100k requests.  It'll take a while.
