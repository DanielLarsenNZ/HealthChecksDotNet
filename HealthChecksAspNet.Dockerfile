#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["HealthChecksAspNet/HealthChecksAspNet.csproj", "HealthChecksAspNet/"]
COPY ["HealthChecksCommon/HealthChecksCommon.csproj", "HealthChecksCommon/"]
RUN dotnet restore "./HealthChecksAspNet/HealthChecksAspNet.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "./HealthChecksAspNet/HealthChecksAspNet.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "./HealthChecksAspNet/HealthChecksAspNet.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app

# Inject GitHub SHA as env var
ARG GITHUB_SHA
LABEL GITHUB_SHA=${GITHUB_SHA}
ENV GITHUB_SHA=${GITHUB_SHA}

COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "HealthChecksAspNet.dll"]
