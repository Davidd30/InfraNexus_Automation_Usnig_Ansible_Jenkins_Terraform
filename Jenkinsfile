pipeline{
    agent none
    stages {
        stage ("Cloning and terraform init"){
            agent {
                docker {
                    image 'terra-agent'
                    args '-v /var/run/docker.sock:/var/run/docker.sock' 
                }
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'githubcredntial', usernameVariable: 'GIT_USER', passwordVariable: 'GIT_PASS')]){
                sh"""
                rm -rf InfraNexus_Automation_Usnig_Ansible_Jenkins_Terraform
                git clone https://github.com/Davidd30/InfraNexus_Automation_Usnig_Ansible_Jenkins_Terraform.git
                cd InfraNexus_Automation_Usnig_Ansible_Jenkins_Terraform/terraform
                terraform init
                terraform plan
                terraform apply -auto-approve
                cd ..
                git init
                git add terraform/inventory.txt
                git commit -m "adding inventory.txt"
                git remote set-url origin https://${GIT_USER}:${GIT_PASS}@github.com/Davidd30/InfraNexus_Automation_Usnig_Ansible_Jenkins_Terraform.git
                git push origin main
                cd terraform
                """
                }
            }
        }
        stage('ansible configration') {
            agent {
                docker {
                    image 'ansible-agent'
                    args '-v /var/run/docker.sock:/var/run/docker.sock' 
                }
            }
            steps {
                withCredentials([usernamePassword(credentialsId: 'githubcredntial', usernameVariable: 'GIT_USER', passwordVariable: 'GIT_PASS')]){
                sh"""
                rm -rf InfraNexus_Automation_Usnig_Ansible_Jenkins_Terraform
                git clone https://github.com/Davidd30/InfraNexus_Automation_Usnig_Ansible_Jenkins_Terraform.git
                cd InfraNexus_Automation_Usnig_Ansible_Jenkins_Terraform/ansible
                chmod 400 key.pem
                ansible-playbook Main_playbook.yaml -i ../terraform/inventory.txt --private-key key.pem --ssh-extra-args
                """
                }
            }
        }
    }
}