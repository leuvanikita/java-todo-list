
#------------------- Stage1 ----------------------

FROM eclipse-temurin:25-jdk-alpine AS builder 

WORKDIR /app

COPY /src ./src

RUN javac -d . src/ToDoList.java

#------------------ Stage 2 ----------------------
FROM gcr.io/distroless/java21-debian12
#FROM eclipse-temurin:17-jre-apline

WORKDIR /app

COPY --from=builder /app .

EXPOSE 3000

CMD ["java", "todolist.ToDoList"]

