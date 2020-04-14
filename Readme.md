# West Wind Album Viewer ASP.NET Core Sample

This is a forked version of [Album Viewr Sample](https://github.com/dockersamples/dotnet-album-viewer) by dockersamples which itself is forked from [Rick Srahl's app](https://github.com/RickStrahl/AlbumViewerVNext). This version  is compatible with the new style of containerising  .NET Core applications. 

**Sample Angular (4) application demonstrating ASP.NET Core API features**

This is a sample ASP.NET Core application that demonstrates basic features of ASP.NET Core in an API backend application with an Angular frontend. The application allows browsing and editing of a list of albums and artists interactively.

![](AlbumViewer.png)

In a Mobile Web Browser: 

![](AlbumViewerMobile.png)

### ASP.NET Core Features
The **ASP.NET Core** Backend demonstrates:

* Creating an API backend service
* Isolating business logic and Controller code
* Using a base Repository for business logic
* Separating code into separate projects
* Custom User Authentication
* CORS Support
* Using ASP.NET Core as a backend to an Angular 2.0 front end

The sample also includes a few Server Side Rendered MVC pages for browsing and viewing of albums and artists. I'll be adding the edit pages at a later point.

Version supported:  
* **.NET Core 2.0**
* **2.0 SDK Version**
* **Visual Studio 2017.3 (.csproj)**

### Angular Features
The **Angular** front end application demonstrates:

* Page based Application
* Mobile friendly, adaptive UI
* Routing
* Animations and Page Transitions
* Client side and server side Authentication tracking
* Client side and server side Validation
* Managing Server Urls (dev/production)
* Angular CLI Project

Version supported:  
* **Angular 4.33**  
* **Angular CLI 1.27**

### Docker Features
The **Docker** setup demonstrates:

* Docker Windows containers
* Multi-stage Docker builds
* Optimized building and packaging of .NET Core apps
* MySQL Server running in a container

Versions supported:
* **Windows 10 or Windows Server 2016**
* **Docker 17.06+ (CE or EE)**

### Getting Started - using Docker on Windows ###

To build your own image of Album Viewer Application, 

```
docker build -t  username/dotnet-album-viewer . 

```

Launch the database container with TiDB ( a MySQL compatible database) as, 

```
docker run --name tidb -idt --rm -p 3306:4000 dockersamples/tidb:nanoserver-sac2016

```

Find out the IP address of TiDB container with , 

```
docker inspect tidb --format="{{.NetworkSettings.Networks.nat.IPAddress}}"
```

Now launch the Album Viewer App as, 

```
docker run -it --rm  -p 80:80 \ 
-e "Data:Provider=MySQL" \
 -e "Data:ConnectionString=Server=172.17.187.15;Port=4000;Database=AlbumViewer;User=root;SslMode=None"  \ 
schoolofdevops/dotnet-album-viewer

```

where, 172.17.187.15 is the IP address of TiDB, found using the command above. Replace this with the actual IP address of TiDB container.  Also replace schoolofdevops in the image tag with your own, if you have built an image of yours. Keep it unchanged in case if you have not. 


#### Platforms 
Currently the app has been tested to run under Windows and Mac, but it should also work under Linux.

**License:**  
This sample is licensed under MIT license. Use, play with, integrate code from
this repository as you see fit at your own risk. I try to update this code regularly to reflect the latest current builds of ASP.NET Core and Angular.

**Warranty Disclaimer: No Warranty!**

IN NO EVENT SHALL THE AUTHOR, OR ANY OTHER PARTY WHO MAY MODIFY
AND/OR REDISTRIBUTE THIS PROGRAM AND DOCUMENTATION, BE LIABLE 
FOR ANY COMMERCIAL, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM INCLUDING, 
BUT NOT LIMITED TO, LOSS OF DATA OR DATA BEING RENDERED INACCURATE
OR LOSSES SUSTAINED BY YOU OR LOSSES SUSTAINED BY THIRD PARTIES OR
A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER PROGRAMS, EVEN
IF YOU OR OTHER PARTIES HAVE BEEN ADVISED OF THE POSSIBILITY OF 
SUCH DAMAGES.
