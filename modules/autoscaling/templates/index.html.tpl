<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${project_name}</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <main class="page">
    <section class="hero">
      <div class="badge">AWS + Terraform</div>

      <h1>${project_name}</h1>

      <p class="subtitle">
        Arquitetura web criada com Terraform na AWS, utilizando VPC, ALB,
        Auto Scaling, IAM, S3 e NAT Gateway.
      </p>

      <div class="actions">
        <a href="${linkedin_url}" target="_blank">LinkedIn</a>
        <a href="${github_url}" target="_blank">GitHub</a>
      </div>
    </section>

    <section class="grid">
      <div class="card">
        <h2>Arquitetura</h2>
        <p>Internet → ALB → Auto Scaling Group → EC2 privada → S3</p>
      </div>

      <div class="card">
        <h2>Instância</h2>
        <p>Instância ativa:</p>
        <p>${instance_hostname}</p>
      </div>

      <div class="card">
        <h2>Bucket S3</h2>
        <p>Bucket de armazenamento</p>
        <p>${bucket_name}</p>
      </div>

      <div class="card">
        <h2>Mensagem do S3</h2>
        <p>S3_MESSAGE_PLACEHOLDER</p>
      </div>

      <div class="card">
        <h2>Serviços utilizados</h2>
        <ul>
          <li>Amazon VPC</li>
          <li>Application Load Balancer</li>
          <li>Auto Scaling Group</li>
          <li>Amazon EC2</li>
          <li>Amazon S3</li>
          <li>AWS IAM</li>
          <li>NAT Gateway</li>
        </ul>
      </div>
    </section>

    <section class="diagram-placeholder">
      <h2>Diagrama da arquitetura</h2>
      <p>Espaço reservado para adicionar futuramente o diagrama visual da solução.</p>
    </section>
  </main>
</body>
</html>