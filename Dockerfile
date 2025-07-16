FROM python:3.10-slim

# 设置国内源 + 安装 uv
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
 && pip install uv

# 创建工作目录
WORKDIR /app

# 拷贝 pyproject.toml 提前安装依赖
COPY pyproject.toml uv.lock ./

# 使用 uv.lock 安装依赖
RUN uv sync

# 拷贝其他项目文件
COPY . .

# 默认端口
EXPOSE 8000

# 启动 MCP 服务（你也可以用 python weather.py）
CMD ["uv", "run", "weather.py"]
