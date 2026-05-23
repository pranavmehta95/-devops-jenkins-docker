# CI/CD Pipeline — Jenkins + Docker
Spring Boot application with automated CI/CD using Jenkins and Docker.
## Pipeline Stages
1. Checkout source code from GitHub
2. Build & test with Maven (quality gate)
3. Build Docker image (multi-stage)
4. Push to Docker Hub
5. Verify deployment via health check
## Run Locally
cd app && mvn spring-boot:run
## Health Check
curl http://localhost:8080/health
