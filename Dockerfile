FROM microsoft/aspnet

ADD https://github.com/OrchardCMS/Orchard/releases/download/1.10.2/Orchard.Web.1.10.2.zip /sources/Orchard.zip

RUN powershell -command Expand-Archive -Path c:\sources\Orchard.zip -DestinationPath c:\sources\Orchard; Copy-Item c:\sources\Orchard\Orchard\* c:\inetpub\wwwroot -recurse

ADD Set-IISFolderPermissions.ps1 /sources/Set-IISFolderPermissions.ps1
RUN powershell c:\sources\Set-IISFolderPermissions.ps1