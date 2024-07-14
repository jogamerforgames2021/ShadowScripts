import requests
import random
import string
import os

def generate_key():
    return ''.join(random.choices(string.ascii_letters + string.digits, k=16))

def update_gist(key):
    gist_id = os.getenv('GIST_ID')
    github_token = os.getenv('GIST_TOKEN')  # Updated secret name
    gist_file_name = "key.lua"
    url = f"https://api.github.com/gists/{gist_id}"
    headers = {
        "Authorization": f"token {github_token}",
        "Accept": "application/vnd.github.v3+json"
    }
    payload = {
        "files": {
            gist_file_name: {
                "content": f"local key = \"{key}\"\n\nreturn key"
            }
        }
    }
    response = requests.patch(url, json=payload, headers=headers)
    return response.ok

def main():
    new_key = generate_key()
    if update_gist(new_key):
        print("Gist updated successfully.")
    else:
        print("Failed to update Gist.")

if __name__ == "__main__":
    main()
