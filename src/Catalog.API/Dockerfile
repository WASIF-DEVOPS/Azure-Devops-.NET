FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

COPY Directory.Packages.props .
COPY Directory.Build.props .
COPY nuget.config .

COPY ["src/Catalog.API/Catalog.API.csproj", "src/Catalog.API/"]
COPY ["src/eShop.ServiceDefaults/eShop.ServiceDefaults.csproj", "src/eShop.ServiceDefaults/"]
COPY ["src/EventBusRabbitMQ/EventBusRabbitMQ.csproj", "src/EventBusRabbitMQ/"]
COPY ["src/EventBus/EventBus.csproj", "src/EventBus/"]
COPY ["src/IntegrationEventLogEF/IntegrationEventLogEF.csproj", "src/IntegrationEventLogEF/"]
RUN dotnet restore "src/Catalog.API/Catalog.API.csproj"

COPY src/ src/
RUN dotnet publish "src/Catalog.API/Catalog.API.csproj" -c Release -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime
WORKDIR /app
EXPOSE 8080
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Catalog.API.dll"]
