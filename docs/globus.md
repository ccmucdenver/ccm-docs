# Globus File Transfer

[Globus](https://www.globus.org), sometimes called Globus Connect, is a service for robust transfer of large amounts of data without having to monitor the connection and transparently through firewalls. It provides access to a network of computers running the Globus software, free for personal use in the US academia.

## Globus basics

Globus data transfer runs between two software installations, called [endpoints](https://docs.globus.org/faq/globus-connect-endpoints). The transfer is initiated and can be monitored from a web interface. There are two kinds of endpoints, ''Server'' and ''Personal'' paid subscription is required to run a Server endpoint or to transfer data between two Personal endpoints. Without a subscription, at least one of the endpoints needs to be a Server endpoint. Details of [Globus subscription](https://www.globus.org/subscriptions) vary over time. 

## How to connect to Globus

CU Denver does not have Globus subscription and thus we do not have any Server endpoints. But you can install Globus Personal endpoint in your account on our Linux servers or your PC and transfer data to and from any Server endpoint you are allowed to log into.

Log into your account on `math-alderaan`, and install the
endpoint from the command line:

    mkdir globus
    cd globus
    wget https://downloads.globus.org/globus-connect-personal/linux/stable/globusconnectpersonal-latest.tgz
    tar xvfz globusconnectpersonal-latest.tgz
    cd globusconnectpersonal-x.y.z  (replace x.y.z by the version from the downloaded file)
    ./globusconnectpersonal -setup
    
(See also the [instructions](https://docs.globus.org/how-to/globus-connect-personal-linux) for further details.)
After a little while, you should get a link. Copy and paste the link to your browser and log in with your CU Denver credentials. The Globus website should give you a temporary access code, copy and paste it after `Enter the auth code:` and press enter. The setup should ask for an endpoint name, make it something you can find easily, such as `math-alderaan-`your-name. Your email address will be visible to anyone on Globus who searches for an endpoint anyway. 
    
Run the endpoint:

    screen -S globus
    ./globusconnectpersonal -start`

Kill the terminal window or detach from the terminal session by Ctrl-A d. Your endpoint now runs in a virtual terminal until system reboot. You can reconnect to the virtual terminal if you need to by `screen -r globus`.

Log into [Globus](https://globus.org) again and search for your personal endpoint in the Collections box. Click on the your endpoint name, and you should see the files in your home directory! You can now transfer data between this endpoint and any Server endpoint you can log into.

Optional: Make a Personal endpoint on your computer the same way following [instructions](https://www.globus.org/globus-connect-personal). You can now transfer data between any Server endpoint and your computer.

# Security notes

* Your personal endpoint runs as you and, in principle, it has access to any files on the computer that you have. 
* A personal endpoint seems to refuse access to some files outside of your home directory, even if they are owned by you.
* Your personal endpoint is visible to anyone on Globus but it is accessible from your own Globus account only.

# Works with
This guide was tested in the following environment. It should work in other similar cases too.

* 2023-04-21 math-alderaan Centos 8, globus 3.2.0, command line ssh, no graphics

# Some Globus Server endpoints

* RMACC Alpine at CU Boulder - use the `CU Boulder Research Computing ACCESS` endpoint, select your `ACCESS CI` identity 
* NCAR - use the `NCAR Data Sharing Service` endpoint

# External links

https://docs.globus.org/how-to/get-started/

(links below need updating)

https://docs.globus.org/how-to/globus-connect-personal-windows/

https://www2.cisl.ucar.edu/resources/storage-and-file-systems/globus-file-transfers

https://nar.ucar.edu/2014/cisl/ncar%E2%80%99s-data-sharing-service-globus-plus  "dropbox for big data"

https://www.globus.org/globus-connect-server

https://www.globus.org/subscriptions

https://www2.vrdc.cornell.edu/news/repost-ecco-important-changes-to-globus-web-site-and-products/

https://docs.globus.org/faq/globus-connect-endpoints/ : Globus Connect Personal can execute a transfer as long as either the source or destination endpoint has a routable IP address (which is the case for almost all Globus Connect Server endpoints).

http://help.unc.edu/help/globus-connect-file-transfer/ Example

https://docs.globus.org/how-to/access-google-drive/

https://ci.uchicago.edu/press-releases/globus-expands-data-services-accelerate-secure-cancer-research ''...expect to become eligible for HIPAA business associate agreements in mid-2018.''
