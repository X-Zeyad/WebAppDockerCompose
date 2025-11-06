# ================================
# 1. Build stage
# ================================
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY WebAppDockerCompose/*.csproj WebAppDockerCompose/
RUN dotnet restore WebAppDockerCompose/WebAppDockerCompose.csproj
COPY . .
WORKDIR /src/WebAppDockerCompose
RUN dotnet publish -c Release -o /app/publish
# ================================
# 2. Runtime stage
# ================================
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime	
WORKDIR /app
# Create a non-root user and set ownership
RUN adduser --disabled-password --home /app appuser

# Switch to non-root user
USER appuser

COPY --from=build /app/publish ./
ENTRYPOINT ["dotnet", "WebAppDockerCompose.dll"]