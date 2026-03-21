# SOLANA_DEPLOYMENT.md

## Comprehensive Deployment Guide

### Environment Setup
1. **Install Rust**: Ensure you have Rust installed. If not, run:
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```
2. **Install Solana CLI**: Use the following command to install the Solana CLI:
   ```bash
   sh -c "$(curl -sSfL https://release.solana.com/v1.9.9/install)"
   ```
3. **Add Solana to your PATH**: Add the Solana installation directory to your `$PATH` by adding the following line to your `.bashrc` or `.zshrc`:
   ```bash
   export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
   ```
4. **Set up wallet**: Create your Solana wallet:
   ```bash
   solana-keygen new
   ```

### Testing
- Run the following command to check Solana CLI installation and version:
  ```bash
  solana --version
  ```
- Make sure that your wallet is set:
  ```bash
  solana config get
  ```

### Devnet Deployment
1. **Set the cluster to Devnet**:
   ```bash
   solana config set --url https://api.devnet.solana.com
   ```
2. **Airdrop SOL to your wallet**:
   ```bash
   solana airdrop 2
   ```
3. **Deploy your program**:
   During your program build step, you can deploy using:
   ```bash
   solana program deploy path/to/your_program.so
   ```
4. **Verify Deployment**:
   Use the following command to verify:
   ```bash
   solana program show <PROGRAM_ID>
   ```

### Mainnet Deployment Checklist
1. **Ensure Tests Pass**: Before deploying to Mainnet, ensure that all tests pass in the Devnet environment.
2. **Set the cluster to Mainnet**:
   ```bash
   solana config set --url https://api.mainnet-beta.solana.com
   ```
3. **Airdrop SOL**: Make sure you're funded sufficiently as there are no airdrops on Mainnet.
4. **Deploy Program with Security Consideration**: Deploy, keeping in mind that Mainnet deployment can have real financial implications.
5. **Verify on Explorer**: Confirm your deployment using the Solana Explorer to view the transaction status.

## Conclusion
Ensure you follow each step carefully during deployment to avoid misconfigurations and potential financial losses.