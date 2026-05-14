@Library('jenkins_shared_library') _

def configMap = [
    project: "dotmart",
    component: "catalogue"
]

// If branch is not equal to main, then run CI Pipeline 
if ( ! env.BRANCH_NAME.equalsIgnoreCase('main') ){
    nodejsEKSpipeline(configMap)

}
else {
    echo "Please follow the CR Process"
}