# SocketIOChatRoom
A small Chat app which consists of one chat room that different users can join using just a nickname. 

#TECHNOLOGIES</br>
1- iOS</br>
2- UIKit</br>
3- Socket.IO</br>
4- Swift-5</br>

#how to use 
1- Clone the ChatApp project</br>
2- Download the package in the link https://github.com/appcoda/SocketIOChat/blob/master/srv-SocketChat.zip and note thst this will be the server used in the demo</br>
3- Use your terminal to know your ip address by writing ifnconfig then you will find your address next to an iterm word it should be something like this 192.168.X.X , we willuse it later</br>
4- Using the terminal change directory to the app and run pod install -- make sure that in the pod file there is this line pod 'Socket.IO-Client-Swift', '~> 12.1.3' if not add it to the pod file</br>
5- If you don't have Node.js in your system you have to install it , you can install it from here https://nodejs.org/en/</br>
6- Extract the server folder downloaded in step 3 and use the terminal and change directory to the extracted folder</br>
7- After that use your terminal again to start the server by writting node index.js and press enter you must see the listining on 3000 on screen</br>
8- Add your ip address in step 3 to the application in SocketIOManagerFile line 16 instead of the ip already writen in this line "http://192.168.XX.XX:3000"</br>
9- if you need to stop the server from running, just hit the Ctrl-C keys combination but keep it open will runing the app</br>
10- use different simulators to try the app</br>

<table>
  <tr>
    <td>
       <img src="https://user-images.githubusercontent.com/97159439/190488785-e7bdeebf-f46c-4564-89fb-fda66369e136.png"> </img>
    </td>
   <td>
      <img src="https://user-images.githubusercontent.com/97159439/190490633-113c5ae5-6366-45bb-8c24-2a007ac66612.png"></img>
   </td>
    <td>
       <img src="https://user-images.githubusercontent.com/97159439/190490098-0482c2e5-239b-4ecf-9613-0b5be66149c4.png"></img>
    </td>
  </tr>
   <tr>
    <td>
       <img src="https://user-images.githubusercontent.com/97159439/190490168-95de34ef-9e8b-4212-9533-5016425c3656.png"></img>
    </td>
  </tr>
</table>


</br> </br> </br> </br> </br>
The reference used for this demo : https://www.appcoda.com/socket-io-chat-app/
