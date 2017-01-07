FROM soumyaray/ruby-http:2.3.1

WORKDIR /worker

ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install

ADD groups_update_worker.rb .

ENTRYPOINT ruby groups_update_worker.rb

# build image with:
#   docker build --rm --force-rm -t soumyaray/facegroup_groups_update:0.2.0 .

# push to docker hub with:
#   docker push soumyaray/facegroup_groups_update:0.2.0
