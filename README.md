# SImple Authentication Application
 Language:Java,
 Frameworks: Spring Boot,Spring Security, JPA, Hibernate, Restful Web Services,
 Library: Json Web Token, Swagger Documentation Library ,Lombok,Bcrypt,
 Front-end frameworks and  Library: Vue js, vuetify,vue-router,axios
 Database: H2 in Memory Database/Mysql, 
 Unit Test: Junit 
 
 
 Documentation URL: {base_url}/swagger-ui.html
 
 ** by default H2 is configured for database
 If mysql is needed these lines need to me uncommented on application.properties file
 
 spring.jpa.properties.hibernate.dialect = org.hibernate.dialect.MySQLDialect
 spring.jpa.hibernate.ddl-auto=create
 spring.datasource.url=jdbc:mysql://localhost:3306/simple_authentication
 spring.datasource.username=root
 spring.datasource.password=root
 
 and these lines need to be commented: 
 
 spring.datasource.url=jdbc:h2:file:~/testdb
 spring.datasource.driverClassName=org.h2.Driver
 spring.datasource.username=sa
 spring.datasource.password=
 spring.jpa.database-platform=org.hibernate.dialect.H2Dialect
 
 How to Deploy : 
 1.Build an war/jar file by compiling all the resources
 2.Deploy using apache tomcat 8.0 or later version.
 
 
 ** Further Development: Some code restructuring could be done more
 
 **If any problem to deploy the application then feel free to email me at shariful.bony@gmail.com
 
 ** There is some wired bug that i  am facing  for jUnit Testing with spring security.
  My web mvc testcase is not working for that. I need some more time to dig down more.I did some JPA test case and it is working fine. 
