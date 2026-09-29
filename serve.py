#!/usr/bin/env python3
"""Local static server with correct MIME types for Unity WebGL."""
import http.server
import socketserver
import os

PORT = int(os.environ.get("PORT", "8080"))
DIR = os.path.dirname(os.path.abspath(__file__))

class Handler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIR, **kwargs)

    extensions_map = {
        **getattr(http.server.SimpleHTTPRequestHandler, "extensions_map", {}),
        ".wasm": "application/wasm",
        ".js": "application/javascript",
        ".json": "application/json",
        ".data": "application/octet-stream",
        ".unityweb": "application/octet-stream",
        ".html": "text/html",
    }

    def end_headers(self):
        self.send_header("Cache-Control", "no-cache")
        super().end_headers()

if __name__ == "__main__":
    os.chdir(DIR)
    with socketserver.ThreadingTCPServer(("0.0.0.0", PORT), Handler) as httpd:
        print(f"Serving Air Wars 3 at http://127.0.0.1:{PORT}/")
        print("Press Ctrl+C to stop")
        httpd.serve_forever()
