# Usamos uma imagem base Nginx leve para servir arquivos estáticos
FROM nginx:alpine

# Copia todos os arquivos estáticos (HTML, CSS, JS) para o diretório de serviço do Nginx
COPY . /usr/share/nginx/html
