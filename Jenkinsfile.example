#!/usr/bin/env groovy
@Library('github.com/stakater/stakater-pipeline-library@v2.14.0') _

def utils = new io.fabric8.Utils()

timeout(time: 20, unit: 'MINUTES') {
    timestamps {
        toolsNode(toolsImage: 'stakater/pipeline-tools:v2.0.4') {
            container (name: "tools") {
                stage('Install') {
                    try {
                        checkout scm
                        String selectedTarget

                        // if master
                        if (utils.isCD()) {
                            selectedTarget = "install"
                        } else {
                            selectedTarget = "install-dry-run"
                        }

                        executeMakeTargets {
                            target = selectedTarget
                            NAMESPACE = "delivery"
                            FOLDER_NAME = "manifests"
                        }

                    } catch (err) {
                        echo "Error: ${err}"
                        throw err
                    }
                }
            }
        }
    }
}