aws ec2 run-instances \
--image-id ami-01bc990364452ab3e \
--count 1 \
--instance-type t2.micro \
--key-name key \
--security-group-ids sg-001fd82968af5db51 \
--subnet-id subnet-0e56a302aaa7f74e9 \
--iam-instance-profile Name=EC2_default \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=Hometask_8}]" \
--user-data file://user-data.sh
