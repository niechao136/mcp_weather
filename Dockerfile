FROM python:3.10-slim

# 安装 uv（使用官方 pip 安装）
RUN pip install uv

# 创建工作目录
WORKDIR /app

# 拷贝 pyproject.toml 和 uv.lock 提前安装依赖
COPY pyproject.toml uv.lock ./

# 安装依赖（使用 uv.lock）
RUN uv pip install -r uv.lock

# 拷贝其他项目文件
COPY . .

# 默认端口
EXPOSE 8000

# 启动 MCP 服务（你也可以用 python weather.py）
CMD ["uv", "run", "weather.py"]
