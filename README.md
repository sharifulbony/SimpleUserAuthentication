# Simple Authentication Application
 1. Language:Java,
 2. Frameworks: Spring Boot,Spring Security, JPA, Hibernate, Restful Web Services,
 3. Library: Json Web Token, Swagger Documentation Library ,Lombok,Bcrypt,
 4. Front-end frameworks and  Library: Vue js, vuetify,vue-router,axios
 5. Database: H2 in Memory Database/Mysql, 
 6. Unit Test: Junit 
 
 
 #Documentation URL: {base_url}/swagger-ui.html
 #How to Deploy : 
 
 1. Build an war/jar file by compiling all the resources
 2. Deploy using apache tomcat 8.0 or later version as a root context.
 
 ** by default H2 is configured for database
  # IF mysql is needed  then follow below steps:
  1. these lines need to me uncommented on application.properties file
  
     spring.jpa.properties.hibernate.dialect = org.hibernate.dialect.MySQLDialect
     spring.jpa.hibernate.ddl-auto=create
     spring.datasource.url=jdbc:mysql://localhost:3306/simple_authentication
     spring.datasource.username=root
     spring.datasource.password=root
  
  2. These lines need to be commented: 
  
     spring.datasource.url=jdbc:h2:file:~/testdb
     spring.datasource.driverClassName=org.h2.Driver
     spring.datasource.username=sa
     spring.datasource.password=
     spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
 
 
#Further Development: 
Some code restructuring and code cleaning
 
** If any problem to deploy the application then feel free to email me at shariful.bony@gmail.com
 
