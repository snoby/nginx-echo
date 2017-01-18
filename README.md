# nginx-echo
Docker container that runs nginx and returns to the caller the request header, the clients, ip address and request uri


The key.key and cert.crt (Great names right?) have been hand generated for ssltest.tropo.com.  Feel free to change the hand generated certs to whatever you want.

To use:
just run ./build_n_run.sh and the container will build and run the container on port 80 and port 443.  obviously you can change this to suit your needs


