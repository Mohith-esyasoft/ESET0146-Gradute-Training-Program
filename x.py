
import socket
import threading
import pyperclip
import keyboard
import platform

SERVER_PORT = 5000
PUSH_HOTKEY = "ctrl+shift+8"
FETCH_HOTKEY = "ctrl+shift+9"

def get_server_ip():
    """Ask user for server IP for LAN or default to localhost"""
    ip = input("Enter server IP (LAN IP or 127.0.0.1 for same machine): ").strip()
    if not ip:
        ip = "172.16.103.66"
    # disallow 0.0.0.0
    if ip == "0.0.0.0":
        print("[client] 0.0.0.0 is invalid, using localhost instead")
        ip = "127.0.0.1"
    return ip

SERVER_IP = get_server_ip()

def allow_firewall():
    """Prompt Windows firewall for outgoing connections"""
    if platform.system() != "Windows":
        return
    python_exe = __import__('sys').executable
    print(f"[firewall] attempting to allow {python_exe} through firewall...")
    cmd = f'netsh advfirewall firewall add rule name="PythonTCPClient" dir=out action=allow program="{python_exe}" enable=yes profile=Private'
    try:
        import subprocess
        subprocess.run(["powershell", "-Command", f"Start-Process cmd -ArgumentList '/c {cmd}' -Verb RunAs"], check=True)
        print("[firewall] rule added (if user allowed UAC prompt)")
    except Exception as e:
        print("[firewall] could not add rule:", e)
        print("[firewall] manually allow Python through firewall for outgoing connections")

def push_clipboard():
    text = pyperclip.paste()
    if not text:
        print("[client] clipboard empty, nothing to push")
        return
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((SERVER_IP, SERVER_PORT))
        s.sendall(f"PUSH {text}".encode('utf-8'))
        s.recv(1024)
        print("[client] pushed clipboard to global")
        s.close()
    except Exception as e:
        print("[client] push error:", e)
        print("[client] ensure firewall allows outgoing connections to server IP")

def fetch_global():
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((SERVER_IP, SERVER_PORT))
        s.sendall(b"FETCH")
        data = s.recv(65536)
        text = data.decode('utf-8')
        if text:
            pyperclip.copy(text)
            print("[client] fetched global message to clipboard")
        else:
            print("[client] global message empty")
        s.close()
    except Exception as e:
        print("[client] fetch error:", e)
        print("[client] ensure firewall allows outgoing connections to server IP")

def hotkey_listener():
    print(f"Hotkeys -> PUSH: {PUSH_HOTKEY}, FETCH: {FETCH_HOTKEY}")
    keyboard.add_hotkey(PUSH_HOTKEY, lambda: threading.Thread(target=push_clipboard, daemon=True).start())
    keyboard.add_hotkey(FETCH_HOTKEY, lambda: threading.Thread(target=fetch_global, daemon=True).start())
    keyboard.wait()

if __name__ == "__main__":
    print(f"[client] using server IP: {SERVER_IP}:{SERVER_PORT}")
    allow_firewall()
    hotkey_listener()
