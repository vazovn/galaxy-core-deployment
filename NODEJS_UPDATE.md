Check the version of nodejs which might be overwritten by the authomatic yum update.
The automatic update puts the packs into /opt/rh/<package name> and you need to do the following:

1. yum install v8314
2. set symlinks to the required libraries in /usr/lib64:

	ln -s /opt/rh/nodejs010/root/usr/lib64/libhttp_parser.so.2 libhttp_parser.so.2
	ln -s /opt/rh/nodejs010/root/usr/lib64/libuv.so.0.10 libuv.so.0.10
	ln -s /opt/rh/v8314/root/lib64/libv8.so.v8314-3.14.5 libv8.so.v8314-3.14.5

3. run /opt/rh/nodejs010/enable - this sets the correct PATH to node/npm binaries.

4. run /opt/rh/v8314/enable - this sets the correct PATH to v8314 binaries

5. If 3 and 4 fail, set the PATH for the binaries in /etc/profile.d/bash_login.sh

6. If node still fails, reinstall from yum
	yum install nodejs010.x86_64 nodejs010-runtime.x86_64 nodejs010-scldevel.x86_64 nodejs010-http-parser.x86_64 nodejs010-http-parser-devel.x86_64


