
# ==========================================
# Etapa 1: Construcción de la aplicación
# ==========================================
FROM maven:3.9.11-eclipse-temurin-17 AS build

WORKDIR /app

# Copiar el código fuente
COPY . .

# Compilar y empaquetar la aplicación
RUN mvn clean package -DskipTests

# ==========================================
# Etapa 2: Ejecución de la aplicación
# ==========================================
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# Copiar el JAR generado en la etapa de construcción
COPY --from=build /app/target/Lab2-faker.jar Lab2-faker.jar

# Puerto de la aplicación
EXPOSE 8080

# Ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "Lab2-faker.jar"]
