#!/bin/bash

if [ -z "$ADMINUSER" ] || [ -z "$ADMINPWD" ] || [ -z "$LAMBDAUSERPWD" ] || [ -z "$REGION" ] || [ -z "$NETWORKNAME" ]; then
  echo "Please ensure environment variables ADMINUSER, ADMINPWD, LAMBDAUSERPWD, REGION and NETWORKNAME are set!"
  exit 1
fi

echo "_______________________________________"
echo "1. Exporting environment variables"
echo "_______________________________________"

export NETWORKID=$(aws managedblockchain list-networks --name $NETWORKNAME --region $REGION --query 'Networks[0].Id' --output text)
export NETWORKVERSION=1.2
export MEMBERID=$(aws managedblockchain list-members --region $REGION --network-id $NETWORKID --query 'Members[?IsOwned].Id' --output text | awk '{print $2}')
export MEMBERNAME=$(aws managedblockchain list-members --region $REGION --network-id $NETWORKID --query 'Members[?IsOwned].Name' --output text | awk '{print $2}')
export MEMBERIDORG2=$(aws managedblockchain list-members --region $REGION --network-id $NETWORKID --query 'Members[?IsOwned].Id' --output text | awk '{print $1}')
export MEMBERNAMEORG2=$(aws managedblockchain list-members --region $REGION --network-id $NETWORKID --query 'Members[?IsOwned].Name' --output text | awk '{print $1}')
export PEERID=$(aws managedblockchain list-nodes --region $REGION --network-id $NETWORKID --member-id $MEMBERID --query 'Nodes[0].Id' --output text)
export PEERIDORG2=$(aws managedblockchain list-nodes --region $REGION --network-id $NETWORKID --member-id $MEMBERIDORG2 --query 'Nodes[0].Id' --output text)

VpcEndpointServiceName=$(aws managedblockchain get-network --region $REGION --network-id $NETWORKID --query 'Network.VpcEndpointServiceName' --output text)
OrdererEndpoint=$(aws managedblockchain get-network --region $REGION --network-id $NETWORKID --query 'Network.FrameworkAttributes.Fabric.OrderingServiceEndpoint' --output text)
CaEndpoint=$(aws managedblockchain get-member --region $REGION --network-id $NETWORKID --member-id $MEMBERID --query 'Member.FrameworkAttributes.Fabric.CaEndpoint' --output text)
CaEndpointOrg2=$(aws managedblockchain get-member --region $REGION --network-id $NETWORKID --member-id $MEMBERIDORG2 --query 'Member.FrameworkAttributes.Fabric.CaEndpoint' --output text)
PeerEndpoint=$(aws managedblockchain get-node --region $REGION --network-id $NETWORKID --member-id $MEMBERID --node-id $PEERID --query 'Node.FrameworkAttributes.Fabric.PeerEndpoint' --output text)
PeerEventEndpoint=$(aws managedblockchain get-node --region $REGION --network-id $NETWORKID --member-id $MEMBERID --node-id $PEERID --query 'Node.FrameworkAttributes.Fabric.PeerEventEndpoint' --output text)

PeerEndpointOrg2=$(aws managedblockchain get-node --region $REGION --network-id $NETWORKID --member-id $MEMBERIDORG2 --node-id $PEERIDORG2 --query 'Node.FrameworkAttributes.Fabric.PeerEndpoint' --output text)
PeerEventEndpointOrg2=$(aws managedblockchain get-node --region $REGION --network-id $NETWORKID --member-id $MEMBERIDORG2 --node-id $PEERIDORG2 --query 'Node.FrameworkAttributes.Fabric.PeerEventEndpoint' --output text)


echo "export REGION=$REGION"
echo "export NETWORKNAME=$NETWORKNAME"
echo "export NETWORKID=$NETWORKID"
echo "export MEMBERNAME=$MEMBERNAME"
echo "export MEMBERID=$MEMBERID"
echo "export PEERID=$PEERID"
echo "export MEMBERNAMEORG2=$MEMBERNAMEORG2"
echo "export MEMBERIDORG2=$MEMBERIDORG2"
echo "export PEERIDORG2=$PEERIDORG2"
echo "export ADMINUSER=$ADMINUSER"
echo -e "export ADMINPWD='${ADMINPWD}'"
echo "export LAMBDAUSER=lambdaUser"
echo -e "export LAMBDAUSERPWD='${LAMBDAUSERPWD}'"
echo "export CAENDPOINT=$CaEndpoint"
echo "export CAENDPOINTORG2=$CaEndpointOrg2"
echo "export ORDERERENDPOINT=$OrdererEndpoint"
echo "export PEERENDPOINT=$PeerEndpoint"
echo "export PEEREVENTENDPOINT=$PeerEventEndpoint"
echo "export PEERENDPOINTORG2=$PeerEndpointOrg2"
echo "export PEEREVENTENDPOINTORG2=$PeerEventEndpointOrg2"

echo "export AMBVpcEndpointServiceName=$VpcEndpointServiceName"

echo "_______________________________________"
echo "2. Deploying the stack with 'sam deploy'"
echo "_______________________________________"

bucketName="lambda-java-blockchain-sam-bucket-"$(aws sts get-caller-identity --query "Account" --output text)
#echo "Creating s3 bucket to host lambda sources: $bucketName"
#aws s3 mb s3://$bucketName --region $REGION

sam deploy --stack-name lambda-java-blockchain --region $REGION --s3-bucket $bucketName \
  --capabilities CAPABILITY_IAM --parameter-overrides \
  AMBREGION=$REGION NETWORKID=$NETWORKID \
  MEMBERNAME=$MEMBERNAME MEMBERID=$MEMBERID PEERID=$PEERID \
  MEMBERNAMEORG2=$MEMBERNAMEORG2 MEMBERIDORG2=$MEMBERIDORG2 PEERIDORG2=$PEERIDORG2 \
  ADMINUSER=$ADMINUSER ADMINPWD=${ADMINPWD} \
  LAMBDAUSER=lambdaUser LAMBDAUSERPWD=${LAMBDAUSERPWD} \
  CAENDPOINT=$CaEndpoint CAENDPOINTORG2=$CaEndpointOrg2 \
  ORDERERENDPOINT=$OrdererEndpoint \
  PEERENDPOINT=$PeerEndpoint PEERENDPOINTORG2=$PeerEndpointOrg2 \
  CHANNELNAME=mychannel CHAINCODENAME=asset \
  AMBVpcEndpointServiceName=$VpcEndpointServiceName

echo "Lambda source code is stored in the S3 bucket - "$bucketName""
