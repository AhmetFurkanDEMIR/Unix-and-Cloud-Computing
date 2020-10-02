# Deploying flask projects in Colab

* The main subject of this article is to learn how to deploy our flask projects on computers rich in gpu and tpu, namely Colab.

* During these operations, we will open a tunnel with Ngrok from the machine on Colab. Let's get started then.

### flask_ngrok

* Run the following code on the notebook running on Colab and install flask_ngrok.

```linux
pip3 install flask_ngrok
```

* Now let's develop a simple flask application and deploy it :).

```python
from flask_ngrok import run_with_ngrok
from flask import Flask

app = Flask(__name__)
run_with_ngrok(app) #From here, we will access our flask application with a random address to be given to us.

# root directory.
@app.route("/")
def main():
    # Since we are writing a simple application, we will only return a string.
    return "Ahmet Furkan DEMIR"
    
#demir_ai
@app.route("/demir_ai")
def demir():
    return "demir.ai"

if __name__ == "__main__":
    app.run() # debug = Won't be true, be careful !!
```

![Screenshot_2020-10-01_22-35-43](https://user-images.githubusercontent.com/54184905/94855019-86b9ca00-0436-11eb-916c-d9ef1c69aabb.png)


* The address http://127.0.0.1:5000/ here is the local address, it will not work for us. The address that concerns us; http://569ba165c7c2.ngrok.io/ , with this address we will be able to access our flask project on other devices. Let's click :).

![Screenshot_2020-10-01_22-37-00](https://user-images.githubusercontent.com/54184905/94855174-c54f8480-0436-11eb-8807-cc16ea92985b.png)

![Screenshot_2020-10-01_22-36-51](https://user-images.githubusercontent.com/54184905/94855179-c680b180-0436-11eb-8a07-8d4cad10d58a.png)

* **As a result, we deployed a flask project via Colab pro.**

* **Unfortunately, there will be some limitations of our flask projects deployed with ngrok :(.**

![Screenshot_2020-10-01_22-42-19](https://user-images.githubusercontent.com/54184905/94855771-aef5f880-0437-11eb-8af2-38ce404a97f9.png)

