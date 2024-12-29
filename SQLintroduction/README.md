# Introduction

### Creating a database
The MySQL database engine installed on the university server. Access to it is possible for everyone using the student.agh.edu.pl server.

### Logging in to the shell
Logging in to the MySQL engine is done using the mysql client installed on the student server. Connecting to the student shell using:
- ssh (in Unix or Windows 10 and newer systems): 
ssh [username]@student.agh.edu.pl and password for student.agh.edu.pl
- putty program (in Windows).

### Connecting to the database engine
mysql -u [username] -p -h mysql.agh.edu.pl [database]
and password from the AGH Panel

More information on commanding the mysql shell:
mysql --help
and in the documentation: https://mariadb.com/kb/en/mysql-command-line-client/

## The test database
https://github.com/stachu86/test_db
Placed on the student.agh.edu.pl server using WinSCP -> then "source employees_small.sql"

NOTE: Student does not have all the rights, which does not allow to create new databases on the server. A table is created in the default database.

----------------------------------------------------------------------------------------

### The .my.cnf file
To avoid having to enter the password each time connecting to the database:
- nano .my.cnf
- [client]
  user=username
  password=password
  host=server_address
  database=database_name
- save it
- appropriate permissions to make the file accessible only to the owner: "chmod 600 .my.cnf"

### Using various options to run the mysql client
- The results as HTML for example:
mysql -e "SELECT * FROM employees" --html

- The HTML file (stream redirection) for example:
mysql -e "SELECT * FROM employees WHERE DATE_FORMAT(hire_date, '%m-%d') = '02-29';" --html > result.html

- The results as XML for example:
mysql -e "SELECT * FROM employees" --xml

## introduction.sql
The query displaying the fields: first_name, last_name from the table employees. 
The result in HTML format placed in the file "introduction.html":
- mysql --html < introduction.sql > introduction.html
