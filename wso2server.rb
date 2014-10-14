 module MCollective
   module Agent
     class Wso2server< RPC::Agent
       metadata :name        => "wso2server",
                :description => "Agent for MCollective to manupulate wso2 instances",
                :author      => "Shamika",
                :license     => "Apache",
                :version     => "1.0",
                :url         => "http://www.wso2.com",
                :timeout     => 60

       # Basic echo server
       action "echo" do
         validate :msg, String

         reply[:msg] = request[:msg]
         reply[:time] = Time.now.to_s
       end
      
      # stop any wso2 server
      action "start" do
      
      
     end
   end
 end
