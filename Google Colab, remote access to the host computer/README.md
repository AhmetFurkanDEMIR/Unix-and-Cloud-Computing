![pngwave](https://user-images.githubusercontent.com/54184905/92367001-8d3a7780-f0fe-11ea-9ce9-a9b7fb7b5475.png)

# Google Colab, remote access to the host computer

* Google Colab gives you GPU / TPU / CPU access for free. To learn more about Google Colab : https://github.com/AhmetFurkanDEMIR/Google-Colab

* Our aim is to get rid of the notebook running on Colab and access the main machine where this notebook is running from our own machine.

* Run the codes below in a cell on the notebook you have created.

```python
import random, string, urllib.request, json, getpass

password = ''.join(random.choice(string.ascii_letters + string.digits) for i in range(20))

! wget -q -c -nc https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
! unzip -qq -n ngrok-stable-linux-amd64.zip

! apt-get install -qq -o=Dpkg::Use-Pty=0 openssh-server pwgen > /dev/null

! echo root:$password | chpasswd
! mkdir -p /var/run/sshd
! echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
! echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
! echo "LD_LIBRARY_PATH=/usr/lib64-nvidia" >> /root/.bashrc
! echo "export LD_LIBRARY_PATH" >> /root/.bashrc

get_ipython().system_raw('/usr/sbin/sshd -D &')

print("Copy authtoken from https://dashboard.ngrok.com/auth")
authtoken = getpass.getpass()

get_ipython().system_raw('./ngrok authtoken $authtoken && ./ngrok tcp 22 &')

with urllib.request.urlopen('http://localhost:4040/api/tunnels') as response:
  data = json.loads(response.read().decode())
  (host, port) = data['tunnels'][0]['public_url'][6:].split(':')
  print(f'SSH command: ssh -p{port} root@{host}')

print(f'Root password: {password}')
```

* A link will appear as a printout, proceed to that link.

![a1](https://user-images.githubusercontent.com/54184905/92363625-7134d700-f0fa-11ea-9f92-488549ebb3db.png)

* Copy Authtoken in the link that opens. This is your personal Authtoken. Use this to authenticate the ngrok agent that you downloaded.

![Screenshot_2020-09-07_11-09-24](https://user-images.githubusercontent.com/54184905/92363751-ab05dd80-f0fa-11ea-9ee6-001a195dc6ac.png)

* Go back to the Colaba and paste the Authtoken and press Enter.

![dsa](https://user-images.githubusercontent.com/54184905/92363952-ffa95880-f0fa-11ea-9792-58a9752025cf.png)

* After you press Enter, you should see such a printout, just be patient :). With SSH command, we will access the remote Google machine using the SSH protocol. It will ask us for the root password while connecting to the machine and making important changes on the machine.

![fds](https://user-images.githubusercontent.com/54184905/92364206-6464b300-f0fb-11ea-807d-1012705fd877.png)

**So let's connect to Google machines :).**

* This is how you work with the SSH connection and Port number given to you on your own terminal.

![dsad](https://user-images.githubusercontent.com/54184905/92364694-17351100-f0fc-11ea-80d1-86a0064260c4.png)

* After pressing enter, it will ask you for the root password, we created the password in the 1st line cell in colab. Copy and paste the password you created into the terminal, then press Enter.

![Screenshot_2020-09-07_11-21-26](https://user-images.githubusercontent.com/54184905/92364970-60856080-f0fc-11ea-9431-e3594a7bf138.png)

* After typing the password, we are now logged into the Google remote machine :), Warning: If you see a notification message before or after the root password (yes / no), type yes and pass it.

![Screenshot_2020-09-07_11-21-36](https://user-images.githubusercontent.com/54184905/92365629-bf4ada00-f0fc-11ea-979f-8280fcab8d29.png)

* After accessing the google machine, save your root password somewhere, you can now close the google colab page.

* You can use all commands that run on UNIX operating systems on Google machines. You can download and use files from the Internet, you can access another machine from this machine, now everything depends on your imagination :).

![Screenshot_2020-09-07_11-31-37](https://user-images.githubusercontent.com/54184905/92366452-d8a05600-f0fd-11ea-8483-91c7eda4be7f.png)
