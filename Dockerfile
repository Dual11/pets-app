# —— Dockerfile correcto para Spring Boot ——
FROM openjdk:21-jdk-slim

# Copia el JAR compilado (ajusta el nombre si el tuyo es diferente)
COPY target/*.jar app.jar

# Opcional: si usas Maven y quieres compilar dentro del contenedor
# COPY . .
# RUN ./mvnw clean package -DskipTests

EXPOSE 8080

# Variables recomendadas para PostgreSQL en Render
ENV SPRING_DATASOURCE_URL=jdbc:postgresql://dummy:5432/dummy
ENV SPRING_DATASOURCE_USERNAME=dummy
ENV SPRING_DATASOURCE_PASSWORD=dummy

ENTRYPOINT ["java", "-jar", "/app.jar"]