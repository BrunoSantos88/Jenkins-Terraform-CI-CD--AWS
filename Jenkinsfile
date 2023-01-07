pipeline {
   agent any
   tools {
      terraform 'Terraform'
   }
   environment {
       AWS_ACCESS_KEY_ID    = credentials('AWS_ACCESS_KEY_ID')
       AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
   }

}