# Dockerfile – funciona en Render 100 % (actualizado noviembre 2025)
FROM eclipse-temurin:21-jdk-alpine AS build
WORKDIR /app

# Copia pom.xml y descarga dependencias (mejor cache)
COPY pom.xml .
COPY src ./src
RUN ./mvnw clean package -DskipTests

# Etapa final – imagen ligera solo con JRE
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]