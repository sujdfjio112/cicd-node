const express = require('express');
const WebSocket = require('ws');

const app = express();
const port = 4000;
const server = app.listen(port);

// 创建 WebSocket 服务器
const wss = new WebSocket.Server({ server});

// 监听 WebSocket 连接事件
wss.on('connection', (ws) => {
  console.log('WebSocket 连接已建立');

  // 设置心跳定时器
  const heartbeatInterval = setInterval(() => {
    if (ws.readyState === WebSocket.OPEN) {
      const heartbeatMsg = JSON.stringify({
        type: 'heartbeat',
        timestamp: new Date().getTime(),
      });
      ws.send(heartbeatMsg);
    }
  }, 3000); // 每30秒发送心跳消息

  // 监听 WebSocket 连接关闭事件
  ws.on('close', () => {
    console.log('WebSocket 连接已关闭');
    clearInterval(heartbeatInterval);
  });
});

// 定义 API 接口
app.get('/api/hello', (req, res) => {
  res.send('Hello, world!');
  // 发送欢迎消息
  wss.clients.forEach((client) => {
    if (client.readyState === WebSocket.OPEN) {
      const message = JSON.stringify({
        type: 'notification',
        message: `收到一个新的请求：${req.url}`,
      });
      // 向当前连接发送消息
      client.send(message);
    }
  });
});


app.get('/api/message', (req, res) => {
  res.send('update sussess！');
});

app.post('/api/gitpush', (req, res) => {
  res.send(JSON.stringify(req.body));
  wss.clients.forEach((client) => {
    if (client.readyState === WebSocket.OPEN) {
      const message = JSON.stringify({
        type: 'notification',
        message: `收到一个新的请求：${req}`,
      });
      // 向当前连接发送消息
      client.send(message);
    }
  });
});

// 启动应用程序
console.log(`应用程序已启动，访问 http://localhost:${port}`);
