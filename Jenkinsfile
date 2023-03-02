node {
    
    stage('git_checkout') {
        git changelog: false, poll: false, url: 'https://github.com/jagjot93/s3-code.git'
    }
    
    stage('terraform_init') {
        sh 'terraform init'
    }

    stage('terraform_plan') {
        sh 'terraform plan'
    }

    stage('terraform_apply') {
        sh 'terraform apply --auto-approve'
    }
    
}
