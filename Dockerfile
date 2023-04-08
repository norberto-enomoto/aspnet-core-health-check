FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

WORKDIR /src
COPY Weather.csproj .     
RUN dotnet restore
COPY . .
RUN dotnet publish -c release -o /app


#FROM mcr.microsoft.com/dotnet/aspnet:7.0
#FROM mcr.microsoft.com/dotnet/aspnet:7.0-bullseye-slim-amd64
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app .

# ENV ASPNETCORE_URLS=http://+:14642
ENTRYPOINT ["dotnet", "Weather.dll"]