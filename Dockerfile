FROM python:2.7

# install jenkins-jobs-builder
RUN apt-get update && apt-get install -y libyaml-dev git
RUN pip install PyYAML
RUN git clone https://git.openstack.org/openstack-infra/jenkins-job-builder \
  && cd jenkins-job-builder \
  && python setup.py install

# set jobs cache for jenkins job builder
ENV XDG_CACHE_HOME /jobs
VOLUME /jobs
WORKDIR /jobs
CMD ["jenkins-jobs", "--conf", "/jobs/jenkins.ini", "update", "."]
