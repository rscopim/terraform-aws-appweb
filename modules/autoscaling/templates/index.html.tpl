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
      <span class="badge">AWS + Terraform</span>

      <h1>${project_name}</h1>

      <p class="subtitle">
        Arquitetura web provisionada com Terraform na AWS, utilizando rede multi-AZ,
        Load Balancer, Auto Scaling, S3, IAM, NAT Gateway e RDS.
      </p>

      <div class="actions">
        <a class="btn primary" href="${linkedin_url}" target="_blank">Ver LinkedIn</a>
        <a class="btn secondary" href="${github_url}" target="_blank">Ver GitHub</a>
      </div>
    </section>

    <section class="status-bar">
      <div>
        <span>Status</span>
        <strong>Online</strong>
      </div>
      <div>
        <span>Ambiente</span>
        <strong>AWS Lab</strong>
      </div>
      <div>
        <span>Deploy</span>
        <strong>DEPLOY_TIME_PLACEHOLDER</strong>
      </div>
    </section>

    <section class="grid">
      <div class="card">
        <h2>Arquitetura</h2>
        <p>Internet → ALB → Auto Scaling → EC2 privada → S3 / RDS</p>
      </div>

      <div class="card">
        <h2>Instância ativa</h2>
        <p>INSTANCE_HOSTNAME_PLACEHOLDER</p>
      </div>

      <div class="card">
        <h2>Bucket S3</h2>
        <p>${bucket_name}</p>
      </div>

      <div class="card">
        <h2>Mensagem do S3</h2>
        <p>S3_MESSAGE_PLACEHOLDER</p>
      </div>

      <div class="card large">
        <h2>Serviços utilizados</h2>
        <div class="services">
          <span>Amazon VPC</span>
          <span>ALB</span>
          <span>Auto Scaling</span>
          <span>Amazon EC2</span>
          <span>Amazon S3</span>
          <span>AWS IAM</span>
          <span>NAT Gateway</span>
          <span>Amazon RDS</span>
        </div>
      </div>

      <div class="card large diagram">
        <h2>Diagrama da arquitetura</h2>
        <p>Espaço reservado para adicionar futuramente o diagrama visual da solução.</p>
      </div>
    </section>

  </main>
</body>
</html>