#!/usr/bin/env groovy

def gv

pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    stages {
        stage("Init") {
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }
        stage("Increment Version") {
            steps {
                script {
                    gv.incrementVersion()
                }
            }
        }
        stage("Build docker image") {
            steps {
                script {
                    gv.buildImage()
                }
            }
        }
        stage("pushing it to dockerhub") {
            steps {
                script {
                    gv.deployApp()
                }
            }
        }
    }
}
