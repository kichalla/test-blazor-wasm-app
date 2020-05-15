FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR "/src/test-blazor-wasm-app"
COPY . .
RUN dotnet publish "test-blazor-wasm-app.csproj" -c Release -o /app/publish

FROM nginx
EXPOSE 80
WORKDIR /var/www/web
COPY --from=build /app/publish .
COPY nginx.conf /etc/nginx/nginx.conf