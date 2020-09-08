# Deploy create-react-app with subpath

This example using `create-react-app` with `react-router-dom`

## Setup

Replace `<path>` with your custom directory

1. Update your BrowserRouter by adding a basename. Example: `<BrowserRouter history={history} basename="<path>">`.
2. Specify a homepage on your `package.json`. Example: `"homepage": "/<path>"`.
3. If you are referencing a static file by it's relative path, you should add the subdirectory to that reference. Example: `src="/static/logo/logo.png"` becomes `src="/<path>/static/logo/logo.png"`.
4. NGINX config
```
server {
  listen 80;
  location ^~ /<path> {
    root   /usr/share/nginx/html;
    index  index.html index.htm;
    try_files $uri $uri/ /<path>/index.html;
  }
  error_page 500 502 503 504 /50x.html;
  location = /50x.html {
    root  /usr/share/nginx/html;
  }
}
```

5. Build and run Docker

Now you can test with `/<path>/a` and `<path>/b`