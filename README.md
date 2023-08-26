# progress-centreon-db-checker
A script to check the status of a Progress database in Centreon 22

## Installation & Usage Guide for Progress DB Checker

### Prerequisites

1. Ensure you have Perl installed on your machine. You can download and install Perl from [here](https://www.perl.org/get.html).

2. Ensure you have SSH client tools available.

### Step-by-step Installation

1. **Clone the Repository**: 

   Clone the `Progress-db-checker` repository to your local machine:
  ```bash
   git clone git@github.com:maheanuu/Progress-db-checker.git
   ```

2. **Navigate to the Cloned Directory**:

   Change to the directory containing the script:
   ```bash
   cd Progress-db-checker
   ```

3. **Generate SSH Keys (if not already generated)**:

   If you don't have SSH keys already set up:
   ```bash
   ssh-keygen
   ```
   Follow the prompts, and when it asks for a passphrase, you can either set one or simply press enter to proceed without setting a passphrase.

4. **Copy the Public Key to the Remote Host**:

   Ensure your public key (`~/.ssh/id_rsa.pub`) is added to the `~/.ssh/authorized_keys` file on the remote host. You can use the following command:
   ```bash
   ssh-copy-id user@REMOTE_HOST_IP
   ```
   Replace `user` with the appropriate username on the remote host and `REMOTE_HOST_IP` with the remote host's IP address.

5. **Set the Appropriate Permissions**:

   Make the script executable:
   ```bash
   chmod +x check_progress_db_status.pl
   ```

6. **Configuration**:

   Edit the script (using a text editor like vim or nano) to adjust the `REMOTE_HOST` variable, pointing it to the IP address of your remote host.

7. **Test the Script**:

   Run the script to ensure it works as expected:
   ```bash
   ./check_progress_db_status.pl
   ```

### Usage

To run the `Progress DB Checker` script:
```bash
./check_progress_db_status.pl
```

This will check the database status and print out a message indicating whether the database is active or inactive.

---

### Adding the Script as a Service in Centreon

1. **Login to Centreon Web UI**:

   Open your web browser and navigate to the Centreon web user interface. Use your credentials to log in.

2. **Navigate to Configuration**:

   Go to `Configuration` > `Commands`.

3. **Add a New Command**:

   Click on the "Add" button. This will allow you to define a new command.

4. **Fill in the Command Details**:

   - **Command name**: Enter a relevant name (e.g., `check_progress_db_status`).
   - **Command type**: Choose "Check".
   - **Command line**: Browse and select the script you have added. It should be in the Centreon plugins directory.
   - Fill any other relevant fields as necessary.

   Click "Save".

5. **Add a Service to Use the Command**:

   - Navigate to `Configuration` > `Services`.
   - Click "Add" to create a new service.
   - Under "Service Configuration", fill in the details and select the command you've just added from the "Check command" dropdown.
   - Associate this service with a host or a host template.
   - Fill any other relevant fields and settings as necessary.

   Click "Save".

6. **Reload Your Configuration**:

   To ensure Centreon acknowledges the new service, go to `Monitoring` > `Pollers` and reload the configuration.

7. **Verify**:

   To check if the script is working as expected, navigate to the associated host in Centreon and review the service's status.

---
