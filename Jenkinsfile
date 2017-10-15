  //def nodes = ['hpc-test-node', 'hpc-test-node2'] 
  //git url: 'https://github.com/Mellanox/test_jenkins_projec'
  //def projects = sh test_pipeline.sh get_job_list
  //def projects = ['a','b','c','d']

def projects=''

stage ("Get project list") {
  node () {
    sh "hostname"
    checkout scm
    projects = sh "./test_pipeline.sh get_job_list"
  }
}

def builders = [:]

for ( x in projects ) {
  def proj = x
  builders[proj] = {
    node('l-jenkins-slave-01') {
      stage ('SCM checkout') {
        checkout scm
      }
      stage ('Running job') {
        sh "hostname"
        sh "./test_pipeline.sh do_job ${proj}"
      }
    }
  }

}

parallel builders
