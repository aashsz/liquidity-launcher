#!/bin/bash

# Set the network to use (devnet or mainnet)
NETWORK="$1"

if [[ "$NETWORK" != "devnet" && "$NETWORK" != "mainnet" ]]; then
  echo "Usage: $0 <devnet|mainnet>"
  exit 1
fi

# Update Solana CLI if it is not installed
if ! command -v solana &> /dev/null; then
  echo "Solana CLI not found. Installing..."
  sh -c "$(curl -sSfL https://release.solana.com/v1.7.10/install)"
  export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
fi

# Set the cluster based on the user's argument
if [ "$NETWORK" == "devnet" ]; then
  solana config set --url https://api.devnet.solana.com
else
  solana config set --url https://api.mainnet-beta.solana.com
fi

echo "Current cluster set to: $(solana config get | grep 'RPC URL')"

# Build the project
echo "Building the project..."
npm install
npm run build

# Deploy the program
echo "Deploying to Solana $NETWORK..."
solana program deploy target/deploy/your_program.so

echo "Deployment completed!"