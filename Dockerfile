FROM ubuntu

SHELL ["/bin/bash", "-c"]
RUN apt update
RUN apt install -y gnupg2
RUN apt install -y curl
RUN apt install -y vim
RUN curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x ./aws-iam-authenticator
RUN mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$PATH:$HOME/bin
RUN echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN chmod +x kubectl
RUN mv ./kubectl $HOME/bin/kubectl
COPY ./terraform $HOME/bin/terraform
#//RUN chmod +x $HOME/bin/terraform
COPY ./ $HOME/terraform-pratice
