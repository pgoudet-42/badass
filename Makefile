.PHONY:	all

all :
		docker build -t router:latest -f Dockerfile.router .
		docker build -t host:latest -f Dockerfile.host .

fclean :
		docker rmi -f router:latest host:latest
