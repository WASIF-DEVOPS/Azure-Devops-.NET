FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

COPY Directory.Packages.props .
COPY Directory.Build.props .
COPY nuget.config .

COPY ["src/Basket.API/Basket.API.csproj", "src/Basket.API/"]
COPY ["src/eShop.ServiceDefaults/eShop.ServiceDefaults.csproj", "src/eShop.ServiceDefaults/"]
COPY ["src/EventBusRabbitMQ/EventBusRabbitMQ.csproj", "src/EventBusRabbitMQ/"]
COPY ["src/EventBus/EventBus.csproj", "src/EventBus/"]
RUN dotnet restore "src/Basket.API/Basket.API.csproj"

COPY src/ src/
RUN dotnet publish "src/Basket.API/Basket.API.csproj" -c Release -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime
WORKDIR /app
EXPOSE 8080
EXPOSE 8081
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "Basket.API.dll"]
