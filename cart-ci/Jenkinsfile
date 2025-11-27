@Library('jenkins-shared-library') _

def configMap = [
    project : "roboshop",
    component: "cart"
]

if( ! env.BRANCH_NAME.equalsIgnoreCase('main') ){ // if not equals to main
    nodejsEKSPipeline(configMap) // by default it will call, call function inside this pipeline
}
else{
    echo "Please proceed with PROD process"
}
