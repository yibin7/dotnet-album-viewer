FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS BUILD
WORKDIR /album-viewer
COPY . .
RUN dotnet restore src/AlbumViewerNetCore/AlbumViewerNetCore.csproj
RUN dotnet publish src\AlbumViewerNetCore\AlbumViewerNetCore.csproj -c release -o /app

FROM mcr.microsoft.com/dotnet/core/runtime:3.1 AS RUN
WORKDIR /app
COPY --from=build /app .
EXPOSE 80
CMD dotnet AlbumViewerNetCore.dll