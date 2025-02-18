from app import app

def test_home():
    # Create a test client using the Flask application configured for testing
    client = app.test_client()
    response = client.get('/')
    assert response.status_code == 200
    assert response.data == b"Hello, DevOps!"

def test_metrics():
    client = app.test_client()
    response = client.get('/metrics')
    assert response.status_code == 200
    assert b"app_requests_total" in response.data

