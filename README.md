# Introdução 
Projeto de construção da infraestrutura (GKE_AUTOPILOT, REDE E SUB-REDE, APLICAÇÃO KUBERNETES) na GCP utilizando Terraform

# Links de apoio
https://www.terraform.io/docs/cli/commands/plan.html


# Observações

O projeto Tem como objetivo demostrar o modelo end to end , da criação de um cluster GKE Autopilot, Criacao de uma rede e subrede para service e pods do cluster.
O cluster Terá ip Privado, Usando NAT da gcp e o kubernetes aplicara um deploy do com em memoria Redis

# Execução
Antes da execução dos plano é preciso autenticar como o application-default da GCP.

```bash
gcloud auth application-default login
```
```bash
gcloud auth application-default login
```

Desenvolvimento (apenas para teste, não manter enviroment)
```bash
terraform workspace new autopilot
terraform workspace select autopilot
```
Ao realizar a execução de planos crie sempre um novo plano utilizando um ID incremental salvado o arquivo no diretório 'plans'
```bash
terraform plan -out plans/autopilot.tfplan -var-file=vars/autopilot.tfvars
terraform apply plans/autopilot.tfplan
```

Caso necessite remover o que foi executado acima
```bash
terraform plan -destroy -out plans/autopilot.destroy.tfplan -var-file=vars/autopilot.tfvars
terraform apply plans/autopilot.destroy.tfplan
```
# TO-DO

- Estereira de CI/CD no GitHub<br/>
- Execução com secrets<br/>
# Contribuição
Arquitetura DevOps Victor Santos
