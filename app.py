from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, DevOps!"

@app.route('/metrics')
def metrics():
    # In a real app, you might integrate Prometheus metrics here
    return "app_requests_total 1024"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

