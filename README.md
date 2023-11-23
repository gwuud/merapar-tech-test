Merapar Tech Test
=

Brief
-

*On a cloud platform of your choice provision a service, using Infrastructure as Code, that
serves a html page.*
*The content of the page must be ```<h1>The saved string is dynamic string</h1>```, where dynamic 
string can be set to whatever is requested without having to re-deploy. When you demonstrate the 
solution in the interview you will need to modify the string to show it works. Any user accessing 
the url must get the same result. You will be asked to take us through the source code. Accompany 
this work with a short document (PDF) explaining:*
- *your solution and discussing the available options*
- *the reasons behind the decisions you made*
- *how you would embellish the solution were you to have more time*

*The document should be sent in advance of the interview.*

Requirements
-

- ```terraform 1.6.4```
- ```aws-cli 2.13.35```
- ```go 1.21.3```
- ```make 3.81```

AWS Deployment
-

- Deploy:

  ```sh
  # ./terraform/

  make apply
  ```

- Destroy:

  ```sh
  # ./terraform/

  make destroy
  ```