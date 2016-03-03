require 'spec_helper'


 describe service('namenode') do  
   it { should be_enabled   }
   it { should be_running   }
 end 

 describe service('datanode') do  
   it { should be_enabled   }
   it { should be_running   }
 end 
 
describe service('nodemanager') do  
   it { should be_enabled   }
   it { should be_running   }
 end 
 
describe service('resourcemanager') do  
   it { should be_enabled   }
   it { should be_running   }
 end 

#describe command("su spark -l -c \"/srv/spark/bin/spark-submit --class org.apache.spark.examples.SparkPi --master yarn --deploy-mode cluster --num-executors 1 --driver-memory 512m --executor-memory 256m --executor-cores 1 --queue default /srv/spark/lib/spark-examples*.jar 2\"") do
#  its (:stdout) { should match /Pi is roughly/ }
#end

describe command("ps -ef | grep java | grep Master") do
  its(:exit_status) { should eq 0 }
end 


describe command("ps -ef | grep java | grep Worker") do
  its(:exit_status) { should eq 0 }
end 

describe command("su spark -l -c \"/srv/spark/bin/run-example SparkPi 10\"") do
  its (:stdout) { should match /Pi is roughly/ }
end



