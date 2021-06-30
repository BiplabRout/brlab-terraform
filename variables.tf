/*

  1. We can set the value of the terraform variable using following methods:
      1.1  Using Environemnt varible :
              setx TT_VAR_<varible-name> = <value>    { setex TF_VAR_ami-id = "ami-0ec23856b3bad62d3"}  :  In Windows
              export TT_VAR_<variable-name> = <value>  { export TF_VAR_ami-id = "ami-0ec23856b3bad62d3"} : In Linux

      1.2  Using commad line :
              terraform plan -var <variable-nam> = <value>   {terraform plan -var ami-id="ami-0ec23856b3bad62d3" -var instance-type = "t2.micro"}

      1.3 uisng file :
                Filename convension:
                  terraform.tfvars  :  automatically picked up by "terraform plan"
                  <any-name>.tfvar  :  not picked up automatically , we have explicitl;y mentioned as {terraform plan -var-file <any-name>.tfvars}
                  <any-name>.auto.tfvars : automaticvall picked up by "terraform plan"

                Filename can alos be saved as (for jason sintax) :
                  terraform.jason.tfvars : automatically picked up by "terraform plan"
                  <any-name>.jason.tfvar  :  not picked up automatically , we have explicitl;y mentioned as {terraform plan -var-file <any-name>.tfvars}
                  <any-name>.auto.jason.tfvars : automaticvall picked up by "terraform plan"

       1.4 using "default" attribute inside variable block


*/

variable "ami-id" {
  type = string                               # used to set what will be the data type of the variable
  default = "ami-0ec23856b3bad62d3"           # deefault value of te varible.
}

variable "instance-type" {
  type = string
  default = "t2.micro"
}

variable "tag-name" {
  type = map
  default = {
                "Name" = "testing"
            }
}
