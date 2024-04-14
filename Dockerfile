# You can change this base image to anything else
# But make sure to use the correct version of Java
FROM adoptopenjdk/openjdk11:alpine-jre

# Simply the artifact path
ARG artifact=/home/runner/work/java-maven-sonar-argocd-gh_actions-k8s/java-maven-sonar-argocd-gh_actions-k8s/spring-boot-app/staging/spring-boot-web.jar

WORKDIR /opt/app

COPY ${artifact} app.jar

# This should not be changed
ENTRYPOINT ["java","-jar","app.jar"]
