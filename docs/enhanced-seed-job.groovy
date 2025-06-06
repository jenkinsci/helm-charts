// Jenkins seed job script with credentials and environment variables

def jenkinsInfraRepo = 'https://shukla_deept@bitbucket.org/ncinga/jenkins-k8s.git'

def cloneCredsId = 'bitbucket-readonly'

def sbtCredsId   = 'sbt-publish-creds'

// List of services to create pipeline jobs for

def services = [
    [name: 'n-authentication',          repo: 'https://shukla_deept@bitbucket.org/ncinga/nsp_auth.git'],
    [name: 'n-machine-maintenance',     repo: 'https://shukla_deept@bitbucket.org/ncinga/zilingo-machine-maintenance-backend.git'],
    [name: 'n-machine-maintenance-web', repo: 'https://shukla_deept@bitbucket.org/ncinga/zilingo-machine-maintenance-frontend.git']
]

services.each { service ->
    def jobName = service.name
    pipelineJob(jobName) {
        description("Build Pipeline for ${jobName}")
        properties {
            disableConcurrentBuilds()
            buildDiscarder {
                strategy {
                    logRotator {
                        numToKeepStr('5')
                        artifactNumToKeepStr('5')
                    }
                }
            }
            environmentVariables {
                env('SERVICE_REPO_URL', service.repo)
                env('SERVICE_NAME', jobName)
                env('CREDENTIALS_ID', cloneCredsId)
                env('SBT_CREDS_ID', sbtCredsId)
            }
        }
        parameters {
            stringParam('branch', 'master', 'Branch to build')
            booleanParam('cleanBeforeCheckout', false, 'Clean workspace before checkout')
            choiceParam('environmentType', ['none', 'stage', 'production'], 'Select environment type')
            choiceParam('environment', ['kalpha'], 'Environment')
        }
        definition {
            cpsScm {
                scm {
                    git {
                        remote {
                            url(jenkinsInfraRepo)
                            credentials(cloneCredsId)
                        }
                        branches('*/master')
                    }
                }
                scriptPath('jenkinsfiles/Jenkinsfile.backend-service')
            }
        }
    }
    println "✅ Created job: ${jobName}"
}
