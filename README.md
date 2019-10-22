# docker-dump-db-and-restore
This is a simple script to dump a database from any docker mysql container and then restore it on another mysql container.
 It is a very small and simple script that can be expanded on later to whatever the needs are. 
 
 In order to get this to work you will need to do a little research on how to use and set up 
 "--login-path=backup" this is helpful because using a password in the terminal is not advised 
 and will cause you some problems when it logs the warning into the dump file.

The script has been armed with comments that will explain what each command does.

It is also assumed that both servers are on the same host.