FROM ubuntu:latest
RUN apt update && apt install python -y
RUN ["echo" , "this is from run command"]
CMD ["python"]	
