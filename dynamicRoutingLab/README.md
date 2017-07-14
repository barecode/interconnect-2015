# Lab AAI-2822 Application
Application used by the IBM InterConnect 2015 lab Liberty Elastic Clusters and Centralized Administration using Scripting and Admin Center.

## Build and Deploy

Step 1 - Build application
* Run `gradle` -> produces `build/libs/dynamicRoutingLab.war`

Step 2 - Deploy application
* Requires Liberty feature `jsp-2.2`
* Throw into `dropins` 


## Import into Eclipse

The following are high-level instructions for importing this project into Eclipse

1. Run `gradle eclipse` to generate the .project and other files needed by Eclipse
2. Import -> Projects from Git

