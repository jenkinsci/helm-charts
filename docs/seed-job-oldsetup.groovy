job('bootstrap-seed') {
    description('Seed job that loads pipelines from old_setup/jobs directory')
    scm {
        git {
            remote {
                url 'https://shukla_deept@bitbucket.org/ncinga/jenkins-k8s.git'
                credentials 'bitbucket-creds'
            }
            branches '*/master'
            extensions {
                cloneOptions {
                    shallow true
                    depth 1
                    noTags true
                }
            }
        }
    }
    steps {
        jobDsl targets: 'old_setup/jobs/*.groovy',
               removedJobAction: 'DELETE',
               removedViewAction: 'DELETE'
    }
}
