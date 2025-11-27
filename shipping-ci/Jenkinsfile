@Library('jenkins-shared-library') _

def configMap = [
    project : "roboshop",
    component: "shipping"
]

if( ! env.BRANCH_NAME.equalsIgnoreCase('main') ){ // if not equals to main
    javaEKSPipeline(configMap) // by default it will call, call function inside this pipeline
}
else{
    echo "Please proceed with PROD process"
}
