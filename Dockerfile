FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package.json pnpm-lock.yaml ./

# Cài pnpm
RUN npm install -g pnpm

# Cài dependencies
RUN pnpm install --frozen-lockfile

# Copy toàn bộ mã nguồn
COPY . .

# Copy và set quyền file entrypoint
COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x entrypoint.sh

# Expose cổng backend
EXPOSE 5000

# Khởi chạy script entrypoint
CMD ["./entrypoint.sh"]