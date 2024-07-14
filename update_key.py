import requests
import random
import string
import os

def generate_key():
    return ''.join(random.choices(string.ascii_letters + string.digits, k=16))

def update_gist(key):
    gist_id = os.getenv('GIST_ID')
    github_token = os.getenv('GIST_TOKEN')
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

def notify_discord(message):
    webhook_url = os.getenv('DISCORD_WEBHOOK_URL')
    data = {"content": message}
    response = requests.post(webhook_url, json=data)
    return response.ok

def main():
    new_key = generate_key()
    if update_gist(new_key):
        print("Gist updated successfully.")
        notify_discord(f"The key has been updated to: {new_key}")
    else:
        print("Failed to update Gist.")
        notify_discord("Failed to update the key in the Gist.")

if __name__ == "__main__":
    main()
