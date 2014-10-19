require 'socket'

 module MCollective
   module Agent
     class Wso2server< RPC::Agent
  
       @server_location = ""
 
       # Basic echo server
       action "echo" do
         validate :msg, String

         reply[:msg] = request[:msg]
         reply[:time] = Time.now.to_s
       end
      
     # start any wso2 server
     action "start_all" do
      isCarbonHomeValid?      
      system "#{@server_location}/wso2*/bin/wso2server.sh start"      
     end

     # stop any wso2 server
     action "stop_all" do
      isCarbonHomeValid?      
      system "#{@server_location}/wso2*/bin/wso2server.sh stop"
     end
     
     # start wso2 server based on the cluster type - detected using hostname
     action "start" do
       validate :cluster, String
       isCarbonHomeValid?
        hostname = Socket.gethostname
        if hostname.include? request[:cluster]
           system "#{@server_location}/wso2*/bin/wso2server.sh start"
           reply[:msg] = "Done"
        else
           reply[:msg] = "Not Interested"
        end 
     end

     # stop wso2 server based on cluster type - detected using hostname
     action "stop" do
      validate :cluster, String
       isCarbonHomeValid?
        hostname = Socket.gethostname
        if hostname.include? request[:cluster]
           system "#{@server_location}/wso2*/bin/wso2server.sh stop"
           reply[:msg] = "Done"
        else
           reply[:msg] = "Not Interested"
        end 
     end
       
     def isCarbonHomeValid?
        @server_location = config.pluginconf["wso2server.location"]
        if(@server_location.nil? or !File.exist?(@server_location))
          reply[:msg] = "Wso2 server instance location not set or invalid " 
          raise "Wso2 server instance location not set or invalid "
        end
     end
    end
   end
 end
