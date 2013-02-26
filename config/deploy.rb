set :application, "hadoop-hacknight-jonrowe"
set :repository,  "git@github.com:JonRowe/hadoop-hacknight.git"
set :user, "user"
set :password, "Password01"
set :ssh_options, forward_agent: true

set :deploy_via, :remote_cache
set :scm, :git

set :deploy_to, "/home/user/#{application}"
role :hadoop_node, '103.7.164.85'


namespace :deploy do
  task :do do
    run ENV['command']
  end
  after "deploy" do
    run "cd #{current_path} && bundle install"
  end
  task :finalize_update do
  end
  task :restart do ; end
end

namespace :hadoop do
  task :go do
    run "cd #{current_path} && hadoop jar /opt/cloudera/parcels/CDH-4.1.3-1.cdh4.1.3.p0.23/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-*streaming*.jar 	\
  -D mapred.job.name='#{job}-#{input}-#{output}' \
  -files        'jobs/#{job}-mapper.rb' \
  -files        'jobs/#{job}-reducer.rb' \
  -mapper       'ruby #{job}-mapper.rb' \
  -reducer      'ruby #{job}-reducer.rb' \
  -input        'hdfs:///user/user/#{input}' \
  -output       'hdfs:///user/user/#{output}' \
  -cmdenv       'LANG=en_AU.UTF-8'"
  end
end


namespace :wukong do
  task :go do
    run "cd #{current_path} && wu-hadoop #{current_path}/jobs/#{job}.rb --mode=hadoop --input=#{input}\
    --output=#{output} --hadoop_runner=/usr/bin/hadoop\
    --hadoop_home=/opt/cloudera/parcels/CDH-4.1.3-1.cdh4.1.3.p0.23/lib/hadoop-0.20-mapreduce"
  end
end

