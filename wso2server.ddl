metadata 	:name        => "wso2",
                :description => "Agent for MCollective to manupulate wso2 instances",
                :author      => "Shamika",
                :license     => "Apche",
                :version     => "1.0",
                :url         => "http://projects.puppetlabs.com/projects/mcollective-plugins/wiki",
                :timeout     => 60

requires :mcollective => "2.2.1"

action "echo", :description => "Echo to test the plugin works" do
    display :always

     input :msg,
          :prompt      => "Message",
          :description => "Message to echo",
          :type        => :string,
          :validation  => '^[a-zA-Z\-_\d]+$',
          :optional    => false,
          :maxlength   => 120

     output :msg,
          :description => "Mesage recieved",
          :display_as  => "Message"
    
     output :time,
          :description => "Time that the message was recieved",
          :display_as  => "Time"

end

action "start_all", :description => "Start wso2 instance" do
    output :msg,
          :description => "Done",
          :display_as  => "Done"
end

action "stop_all", :description => "Stop wso2 instance" do
    output :msg,
          :description => "Done",
          :display_as  => "Done"
end

action "start", :description => "Start wso2 instance based on cluster - detected using hostname" do
   
    input :cluster,
          :prompt      => "cluster",
          :description => "Cluster Name",
          :type        => :string,
          :validation  => '^[a-zA-Z\-_\d]+$',
          :optional    => false,
          :maxlength   => 120

    output :msg,
          :description => "Done",
          :display_as  => "Done"
end

action "stop", :description => "Stop wso2 instance based on cluster - detected using hostname" do
   
    input :cluster,
          :prompt      => "cluster",
          :description => "Cluster Name",
          :type        => :string,
          :validation  => '^[a-zA-Z\-_\d]+$',
          :optional    => false,
          :maxlength   => 120

    output :msg,
          :description => "Done",
          :display_as  => "Done"
end


action "stop_all", :description => "Stop wso2 instance" do
    output :msg,
          :description => "Done",
          :display_as  => "Done"
end
