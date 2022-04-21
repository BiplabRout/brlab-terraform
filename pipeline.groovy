pipeline {
	agent none
	environment {
		college = 'Biplab'
	}

	parameters {
		string(name:'name', default: '', description: '')
		choiceParam(name:'subject', choice: ['Doctor','Engineer','Teacher'], description: '')
		string(name:'branch', default: '', description: '')
	}

	stages {
		stage('College') {
			steps {
				sh 'echo College Name Is $college'
			}
		}
		
		stage('Student') {
			steps {
				sh 'echo Name of the Student is ${param.name}'
				sh 'echo Branch of the Student is ${param.branch}'
				sh 'echo Subject taken by Student is ${param.subject}'	
			}
		}
	}
}
