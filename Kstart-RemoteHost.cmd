@echo off
REM		Auto startup batch script for the KPA500 Remote, KAT500 Remote and KPA1500 Remote applications.
REM		Warren Merkel, KD4Z
REM		Revision:  0 (initial)

REM 	Note, this script may have a .TXT filename extension for distribution via email.  
REM 	You must RENAME this script to have a ".cmd" extension or it won't execute.  Just remove
REM 	the .txt portion at the end.

REM 	This script can be useful to configure the Elecraft Remote applications to automatically
REM 	launch after a PC reboot.  This script can be used to autostart one or two instances
REM		in any combination of the following applications.

REM 	KPA500 Remote
REM		KAT500 Remote
REM		KPA1500 Remote

REM 	Prerequisites

REM 	Currently these applications are available from here: 
REM   	https://elecraft.com/pages/kpa1500-kpa500-kat500-remote-software
REM		You must install at least one (or more) of these applications before attempting to use this script.

REM		You will need to set up DHCP reservations for the PC hosting the applications, and for the KPA1500 if enabled.
REM		You also may use Static IP addresses if you are not comfortable with DHCP reservations.

REM		Download the Elecraft Remote applications and install them on a PC that runs 24/7
REM		This PC will need network connectivity, and in the cases of the KAT500 and KPA500, USB connections.

REM		For the KPA1500, a network connection is preferable. Use a CAT5 / CAT6 Ethernet cable.  I prefer using Ethernet
REM		instead of a USB connection, as it allows use of the KPA1500 Utility simultanously with the
REM		KPA1500 Remote application still running.

REM		For the KPA1500 - Enable Tech Mode in the menu - Then, scroll through the menu items and locate the
REM	  	NET MAC item.  Make a note of the six values separated by colons.  Example: 54:10:EC:0E:11
REM	  	Scroll down in the menu to NET WAKE on LAN.  Toggle it to ENABLED if not already set that way.

REM		Open a Web Browser, and login to your Firewall/Router and add a DHCP IP reservation for the 
REM		KPA1500.   You might need to give it an IP outside your defined DHCP IP range.  Adjust
REM		that range if space is needed.  Example:  DHCP range 192.168.1.100 to 192.168.1.250

REM		Choose an IP number outside that range.  Example: 192.168.1.15   Make the DHCP IP reservation for
REM		that IP number and use the value from the NET MAC menu for MAC ADDRESS.
REM		Power cycle the KPA1500, go back into the Menu, and validate the Amp now has the IP address
REM		you reserved for it.  It will be on the NET IP ADDRESS menu item.

REM		Make another DHCP IP reservation for the workstation that you are going to run the remote application 
REM		on.  There are a few ways to get the MAC Address of your workstation.  I prefer going to an administrative
REM		cmd prompt, and running:  ipconfig /all   It will list all parameters for your network adapters.  Find your
REM		primary network interface and make note of the "Physical Address" value.  It will have dashes between each
REM		number.  Write it down using colons instead.  Leave the CMD prompt open.

REM		Back to the Web Browser with your Firewall/Router configuration.
REM		Pick another appropriate IP address outside your DHCP IP range.  Example:  192.168.1.20   Use the 
REM		Physical Address noted above, and create a new DHCP reservation for this IP number.  This will
REM		be used for the PC workstation that will run the Remote Host programs.
  
REM		While in your Firewall/Router setup, go to the Port Forward screen.  You will need to add a rule
REM		to forward ports for the Remote applications to use externally to access your local network.
REM		Example:  Port 4626   Type: TCP  
REM 	
REM		When you have completed adding the two IP number reservations, and the port forwards, exit from your
REM		Firewall/Router interface.

REM		Go back to the Administrative CMD prompt.  If you didn't open it as Administrator in the step above,
REM		close it,  Go back and launch it "as Administrator" (You should know how to do that)
REM		run this command at the CMD prompt:   ipconfig /renew    
REM		It may give some errors messages to you, but ignore them.  Run ipconfig again and verify that your
REM		workstation now has the IP address that you reserved for it.  Repeat this step until you see it worked.

REM [ KPA1500 Remote ]

REM		Launch the KPA1500 Remote application from it's icon or from the Start Menu.  Select the "Local Connect"
REM		tab.  A new popup window will appear.  On that window, select the "Ethernet" tab.
REM		Fill in the IP Address of the KPA1500 amplifer.  It will be the value you reserved above.
REM		Fill in the Server Port number as well.   Example using above values:  192.168.1.15 and 4626

REM		Click the "Test" button.  If the values are accurate, a message box should indicate success.
REM		If the amplifer failed to be detected, go back and retrace the above steps to see what is amiss.
REM		Close the "Local Connect" dialog window.

REM		Select the second tab "Host Remote"  Select the second tab "Ethernet"
REM		In the "Amplifier Ethernet Connection" frame, Fill in the IP address of the amplifier if the value 
REM		didn't default to it.  Example:  192.168.1.15
REM		Don't change the TCP Server Fill in!  Leave it set to 1500.  
REM		The MAC Address (WOL) value should have prefilled in for you.

REM		In the "Server Setup" frame, fill in the TCP Port value that you entered in your Firewall/Router's 
REM		Port Forward screen.  Example:  4626
REM		Make up a Username and Password and fill those in.  These credentials will be something you will
REM		share with others that will have access to your station.  So don't use your secret ones.
REM		You can change the Max Connections or Max Time values if you want.  I leave them set at the defaults 
REM		of 10 connections and 0 for hours (unlimited time).

REM		Click "Start Hosting Remote"  The "Host Remote" screen should close, leaving you at the main view of
REM		You should now see that the application allows full control of the amplifier. 
REM		Now, click the "Disconnect" tab to stop the remote control action.

REM [ KPA500 Remote and KAT500 Remote ]

REM		The process of setting up these two applications are similar.  Click on the Host tab, and configure
REM		COM port, COM port baud rate, TCP Port, User name and Password.   Be sure to use different port numbers for
REM		each of the three applications.   Also, don't forget to Port Forward those ports to the PC's IP address.

REM		At this point, you could leave the applications running in Host Remote mode, however
REM		if the PC decides to reboot, the remote software will not restart...YET.

REM		Copy this command script to a nice safe place.  One that is NOT under "Program Files" 
REM		I use a folder called C:\apps for these things.  You will need to edit a few settings below. They will 
REM		be specific to your configuration.  If you changed the default installation folder patch for the Remote
REM		applications, you will need to adjust the xxxx_PATH% variable to match.

REM All product names, logos, and brands are property of their respective owners. All company, product and service names
REM used in this script are for identification purposes only. Use of these names, logos, and brands does not imply endorsement.

REM Except as represented in this agreement, all work product by Developer is provided ​“AS IS”. Other than as provided in this
REM agreement, Developer makes no other warranties, express or implied, and hereby disclaims all implied warranties, 
REM including any warranty of merchantability and warranty of fitness for a particular purpose.

REM ***************** ONLY EDIT THE ENVIRONMENT VARIABLES BELOW *********************************************
REM *  Use the values that you configured above for them.  The defaults set below follow the example info.  *
REM ********************************************************************************************************* 

REM Set these variables to the value 1 to enable launching the remote application for that particular product.
REM (You will definately need to change the IP addresses and COM ports and Baud rates to your needs.)

SET KPA500_ENABLE=1
SET KAT500_ENABLE=0
SET KPA1500_ENABLE=0

REM ** FOR COMPLICATED SETUPS, HERE ARE THE ENABLES FOR A SECOND UNIT OF EACH DEVICE! **
SET KPA500_2_ENABLE=0
SET KAT500_2_ENABLE=0
SET KPA1500_2_ENABLE=0

REM Values for KPA1500 Remote (Amplifier) 
SET KPA1500_IPADDR=192.168.1.15
SET KPA1500_LOCAL_PORT=1500
SET KPA1500_FW_PORT=4626
SET "KPA1500_PATH=%ProgramFiles(x86)%\Elecraft\KPA1500 Remote"

REM Values for KPA500 Remote (Amplifier) 
SET KPA500_COMPORT=COM1
SET KPA500_FW_PORT=4625
SET KPA500_BAUD=38400
SET KPA500_TIMEOUT_MS=5000
SET "KPA500_PATH=%ProgramFiles(x86)%\Elecraft\KPA500 Remote"
  
REM Values for KAT500 Remote (Auto Tuner) 
SET KAT500_COMPORT=COM2
SET KAT500_FW_PORT=4627
SET KAT500_BAUD=38400
SET KAT500_TIMEOUT_MS=5000
SET "KAT500_PATH=%ProgramFiles(x86)%\Elecraft\KAT500 Remote"

REM ***************** IF YOU HAVE TWO OF THE DEVICES - HERE YOU GO ************************

REM Values for SECOND KPA1500 Remote (Amplifier) 
SET KPA1500_IPADDR=192.168.1.16
SET KPA1500_LOCAL_PORT=1500
SET KPA1500_FW_PORT=4628
SET "KPA1500_PATH=%ProgramFiles(x86)%\Elecraft\KPA1500 Remote"

REM Values for a SECOND KPA500 Remote (Amplifier) 
SET KPA500_2_COMPORT=COM3
SET KPA500_2_FW_PORT=4629
SET KPA500_2_BAUD=38400
SET KPA500_2_TIMEOUT_MS=5000
SET "KPA500_2_PATH=%ProgramFiles(x86)%\Elecraft\KPA500 Remote"
  
REM Values for a SECOND KAT500 Remote (Auto Tuner) 
SET KAT500_2_COMPORT=COM4
SET KAT500_2_FW_PORT=4630
SET KAT500_2_BAUD=38400
SET KAT500_2_TIMEOUT_MS=5000
SET "KAT500_2_PATH=%ProgramFiles(x86)%\Elecraft\KAT500 Remote"
  
REM		When done editing the above variables, save and close this script.

REM		***********************************************************************************
REM 		* DO NOT EDIT ANYTHING BELOW UNLESS YOU ARE STUCK AND HAVE A GOOD REASON TO DO SO *
REM		***********************************************************************************

REM		You should now be able to double-click on this script and test that the configured Remote applications
REM		launch and connect to the device in Hosting Remote mode.   Close each application when you are
REM		satisfied that it launches correctly into Host mode.

REM		Now, to make it launch at system startup.  First, create shortcut to THIS command script.
REM		From Windows Explorer, Right-Click on the filename of this script and choose "Create Shortcut"
REM		This newly created shortcut will need to be moved to the Start Menu "Startup" folder.  If you ever need
REM		to turn off the autostart, just delete the Shortcut, NOT this Script!

REM		Typically, the Startup folder is under the AppData\Roaming folder tree.  For example, 
REM		C:\Users\YourLoginName\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
REM		The "YourLoginName" will of course, be specific to your system.  The easiest way to start
REM		navigating to this folder is to put %APPDATA% in the navigation bar.  Then drill down from there.

REM		Use Windows Explorer to move the newly created shortcut to the Startup folder.  Be sure
REM		to leave this command script in it's current place.

REM		That is it.  Now, restart your PC and the enabled Remote applications should all autostart

REM		Remote users outside your network connect, they will need to use the Firewall port you
REM	 	configured above.  You may need to use a Dynamic Host name service like no-ip.com to setup a 
REM		hostname that resolves to your Internet routable IP number. 

REM		The meaty part begins here
REM *******************************************************************************************

setlocal EnableDelayedExpansion

if %KPA1500_ENABLE% equ 1 (
  SET "KPA1500_APP=KPA1500-Remote.exe"
  SET "KPA1500_ARGS=%KPA1500_IPADDR% %KPA1500_LOCAL_PORT% %KPA1500_FW_PORT%"
  SET "KPA1500_FQN=!KPA1500_PATH!\!KPA1500_APP!"
  cd \
  cd !KPA1500_PATH!
  start "" "!KPA1500_FQN!" !KPA1500_ARGS!
)
if %KPA500_ENABLE% equ 1 (
  SET "KPA500_APP=KPA500-Remote.exe"
  SET "KPA500_ARGS=!KPA500_COMPORT! !KPA500_BAUD! !KPA500_FW_PORT! !KPA500_TIMEOUT_MS!"
  SET "KPA500_FQN=!KPA500_PATH!\!KPA500_APP!"
  cd \
  cd !KPA500_PATH!
  start "" "!KPA500_FQN!" !KPA500_ARGS!
)
if %KAT500_ENABLE% equ 1 (
  SET "KAT500_APP=KAT500-Remote.exe"
  SET "KAT500_ARGS=!KAT500_COMPORT! !KAT500_BAUD! !KAT500_FW_PORT! !KAT500_TIMEOUT_MS!"
  SET "KAT500_FQN=!KAT500_PATH!\!KAT500_APP!"
  cd \
  cd !KAT500_PATH!
  start "" "!KAT500_FQN!" !KTA500_ARGS!
)
if %KPA1500_2_ENABLE% equ 1 (
  SET "KPA1500_2_APP=KPA1500-Remote.exe"
  SET "KPA1500_2_ARGS=%KPA1500_2_IPADDR% %KPA1500_2_LOCAL_PORT% %KPA1500_2_FW_PORT%"
  SET "KPA1500_2_FQN=!KPA1500_2_PATH!\!KPA1500_2_APP!"
  cd \
  cd !KPA1500_2_PATH!
  start "" "!KPA1500_2_FQN!" !KPA1500_2_ARGS!
)
if %KPA500_2_ENABLE% equ 1 (
  SET "KPA500_2_APP=KPA500-Remote.exe"
  SET "KPA500_2_ARGS=!KPA500_2_COMPORT! !KPA500_2_BAUD! !KPA500_2_FW_PORT! !KPA500_2_TIMEOUT_MS!"
  SET "KPA500_2_FQN=!KPA500_2_PATH!\!KPA500_2_APP!"
  cd \
  cd !KPA500_2_PATH!
  start "" "!KPA500_2_FQN!" !KPA500_2_ARGS!
)
if %KAT500_2_ENABLE% equ 1 (
  SET "KAT500_2_APP=KAT500-Remote.exe"
  SET "KAT500_2_ARGS=!KAT500_2_COMPORT! !KAT500_2_BAUD! !KAT500_2_FW_PORT! !KAT500_2_TIMEOUT_MS!"
  SET "KAT500_2_FQN=!KAT500_2_PATH!\!KAT500_2_APP!"
  cd \
  cd !KAT500_2_PATH!
  start "" "!KAT500_2_FQN!" !KTA500_2_ARGS!
)
:end

REM		Revisions
REM		Rev 0 	9 May 2020 	 Initial version

