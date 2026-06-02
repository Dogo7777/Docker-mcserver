## Uso

### Pré-requisitos
- [Distrobox](https://distrobox.it) instalado
- [Podman](https://podman.io) ou [Docker](https://docker.com) instalado

### Clonar o repositório
```bash
git clone https://github.com/Dogo7777/Docker-mcserver
cd Docker-mcserver
```

### Buildar a imagem
```bash
podman build -t minecraft-base .
```

### Criar container
```bash
distrobox create --name mc-servers --image localhost/minecraft-base --init
```

### Entrar no container
```bash
distrobox enter mc-servers
```

### Versões de Java disponíveis
```bash
java8   # Java 8
java17  # Java 17
java21  # Java 21
java25  # Java 25
```
